---
title: Create Indexer (Azure Cognitive Search REST API-version=2020-06-30)
description: Indexers are resources that automate many aspects of data ingestion into an Azure Cognitive Search indexes. You must use a supported Azure data source to use this API.
ms.date: 07/25/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Create Indexer (Azure Cognitive Search REST API)

An [indexer](/azure/search/search-indexer-overview) automates indexing from supported Azure data sources such as Azure Storage, Azure SQL Database, and Azure Cosmos DB to name a few. Indexers use a predefined *data source* and *index* to establish an indexing pipeline that extracts and serializes source data, passing it to a search service for data ingestion. For AI enrichment of image and unstructured text, indexers can also accept a *skillset* that defines AI processing. 

Creating an indexer adds it to your search service and runs it. If the request is successful, the index will be populated with searchable content from the data source. 

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http
POST https://[service name].search.windows.net/indexers?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]  
```  

Alternatively, you can use PUT and specify the indexer name on the URI. 

```http
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]    
```  

HTTPS is required for all service requests. If the indexer doesn't exist, it is created. If it already exists, it is updated to the new definition but you must issue a [Run Indexer](run-indexer.md) request if you want indexer execution.

Indexer configuration varies based on the type of data source. For data-platform-specific guidance on creating indexers, start with [Indexers overview](/azure/search/search-indexer-overview), which includes the complete list of [related articles](/azure/search/search-indexer-overview#next-steps).

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

A [data source](create-data-source.md), [index](create-index.md), and [skillset](create-skillset.md) are part of an [indexer](/azure/search/search-indexer-overview) definition, but each is an independent component that can be used in different combinations. For example, you could use the same data source with multiple indexers, or the same index with multiple indexers, or multiple indexers writing to a single index.

The following JSON is a high-level representation of the main parts of the definition. 

```json
{   
    "name" : (optional on PUT; required on POST) "Name of the indexer",  
    "description" : (optional) "Anything you want, or nothing at all", 
    "dataSourceName" : (required) "Name of an existing data source",  
    "targetIndexName" : (required) "Name of an existing index",  
    "skillsetName" : (required for AI enrichment) "Name of an existing skillset",
    "disabled" : (optional) Boolean value indicating whether the indexer is disabled. False by default,
    "schedule" : (optional but runs once immediately if unspecified) { ... },  
    "parameters": { (optional)
       "batchSize": null,
       "maxFailedItems": 0,
       "maxFailedItemsPerBatch": 0,
       "base64EncodeKeys": null,
       "configuration": { (optional, mostly specific to the data source)
            "executionEnvironment": null
        }
      }, 
    "fieldMappings" : (optional) { ... },
    "outputFieldMappings" : (required for AI enrichment) { ... },
    "cache": null,
    "encryptionKey":(optional) { }
} 
```

Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.|  
|dataSourceName |Required. Name of an existing [data source](create-data-source.md). It often includes properties that an indexer can use to exploit source platform characteristics. As such, the data source you pass to the indexer determines the availability of certain properties and parameters, such content type filtering in Azure blobs. or query timeout for Azure SQL Database. |
|targetIndexName|Required. Name of an existing [index schema](create-index.md). It defines the fields collection containing searchable, filterable, retrievable, and other attributions that determine how the field is used. During indexing, the indexer crawls the data source, optionally cracks documents and extracts information, serializes the results to JSON, and indexes the payload based on the schema defined for your index.|
|skillsetName|Required for AI enrichment. Name of an existing [skillset](create-skillset.md), one per indexer. As with data sources and indexes, a skillset is an independent definition that you attach to an indexer. You can repurpose a skillset with other indexers, but each indexer can only use one skillset at a time.|  
|schedule | Optional, but runs once immediately if unspecified and not disabled. A schedule contains `interval` (required) and `startTime` (optional). For more information, see [Schedule an indexer](/azure/search/search-howto-schedule-indexers). </br></br>`interval` specifies how often the indexer runs. The smallest allowed interval is five minutes; the longest is one day. It must be formatted as an XSD "dayTimeDuration" value (a restricted subset of an [ISO 8601 duration](https://www.w3.org/TR/xmlschema11-2/#dayTimeDuration) value). The pattern for this is: `"P[nD][T[nH][nM]]".` Examples:  `PT15M` for every 15 minutes, `PT2H` for every 2 hours. </br></br>`startTime` is a UTC datetime when the indexer should start running. |
|disabled| Optional. Boolean value indicating whether the indexer is disabled. Set this property if you want to create an indexer definition without immediately running it. False by default. |  
|parameters | Optional. Properties for modifying runtime behavior. </br></br>`"batchSize"` (integer). Specifies the number of items that are read from the data source and indexed as a single batch in order to improve performance. Default is source-specific (1000 for Azure SQL Database and Azure Cosmos DB, 10 for Azure Blob Storage). </br></br>`"maxFailedItems"` (integer). Specifies the number of errors to tolerate before an indexer run is considered a failure. Default is 0. Set to -1 if you don’t want any errors to stop the indexing process. Use [Get Indexer Status](/rest/api/searchservice/get-indexer-status) to retrieve information about failed documents. </br></br>`"maxFailedItemsPerBatch"` (integer). Specifies the number of errors to tolerate in each batch before an indexer run is considered a failure. Default is 0. Set to -1 if you don’t want any errors to stop the indexing process. </br></br>`"base64EncodeKey"` (Boolean). Specifies whether to encode document keys that contain invalid characters. </br></br>`"configuration"`. Properties that vary based on the data source. </br></br>`"executionEnvironment"` (string). Overrides the execution environment chosen by internal system processes. Explicitly setting the execution environment to `Private` is required if indexers are accessing external resources over private endpoint connections. This setting is under `"configuration"`. For data ingestion, this setting is valid only for services that are provisioned as Basic or Standard (S1, S2, S3). For AI enrichment content processing, this setting is valid for S2 and S3 only. Valid values are case-insensitive and consist of [null or unspecified], `Standard` (default), or `Private`. |
|fieldMappings| Optional. Explicitly associates a source field to a destination field in search index. Used when source and destination fields have different names or types, or when you want to specify a function. A `fieldMappings` section includes `sourceFieldName` (required, a field in the underlying data source), `targetFieldName` (required, a field in an index), and an optional `mappingFunction` for encoding output. A list of supported functions and examples can be found at [field mapping functions](/azure/search/search-indexer-field-mappings#field-mapping-functions). For more general information, see [Field mappings and transformations](/azure/search/search-indexer-field-mappings). |
|outputFieldMappings| Required for [an enrichment pipeline](/azure/search/cognitive-search-concept-intro). Maps output from a skillset to an index or projection. An `outputFieldMappings` section includes `sourceFieldName` (required, a node in an enrichment tree), `targetFieldName` (required, a field in an index), and an optional `mappingFunction` for encoding output. A list of supported functions and examples can be found at [field mapping functions](/azure/search/search-indexer-field-mappings#field-mapping-functions). For more general information, see [How to map output fields from a skillset](/azure/search/cognitive-search-output-field-mapping).|
|encryptionKey| Optional. Used to encrypt an indexer definition at rest with your own keys, managed in your Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>Optionally, you can specify `accessCredentials` if you are not using a managed system identity. Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax. |

### Blob configuration parameters

Several parameters are exclusive to a particular indexer, such as [Azure blob indexing](/azure/search/search-howto-indexing-azure-blob-storage).

| Parameter                     | Type and allowed values	| Usage                |
|-------------------------------|---------------------------|----------------------|
| `"parsingMode"` | String<br/> `"text"`<br/>`"delimitedText"`<br/> `"json"`<br/> `"jsonArray"` <br /> `"jsonLines"`  | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set to `text` to improve indexing performance on plain text files in blob storage. <br/>For [CSV blobs](/azure/search/search-howto-index-csv-blobs), set to `delimitedText` when blobs are plain CSV files. <br/>For [JSON blobs](/azure/search/search-howto-index-json-blobs), set to `json` to extract structured content or to `jsonArray` to extract individual elements of an array as separate documents in Azure Cognitive Search. Use `jsonLines` to extract individual JSON entities, separated by a new line, as separate documents in Azure Cognitive Search. |
| `"excludedFileNameExtensions"` | String<br/>comma-delimited list<br/>user-defined | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), ignore any file types in the list. For example, you could exclude ".png, .png, .mp4" to skip over those files during indexing. | 
| `"indexedFileNameExtensions"` | String<br/>comma-delimited list<br/>user-defined | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), selects blobs if the file extension is in the list. For example, you could focus indexing on specific application files ".docx, .pptx, .msg" to specifically include those file types. | 
| `"failOnUnsupportedContentType"` | Boolean<br/> true <br/>false (default) | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set to `false` if you want to continue indexing when an unsupported content type is encountered, and you don't know all the content types (file extensions) in advance. |
| `"failOnUnprocessableDocument"` | Boolean<br/> true <br/>false (default)| For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set to `false` if you want to continue indexing if a document fails indexing. |
| `"indexStorageMetadataOnly`<br/>`ForOversizedDocuments"` | Boolean true <br/>false (default) | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set this property to `true` to still index storage metadata for blob content that is too large to process.  Oversized blobs are treated as errors by default. For limits on blob size, see [Service Limits](/azure/search/search-limits-quotas-capacity). |
| `"delimitedTextHeaders"` | String<br/>comma-delimited list<br/>user-defined| For [CSV blobs](/azure/search/search-howto-index-csv-blobs), specifies a comma-delimited list of column headers, useful for mapping source fields to destination fields in an index. |
| `"delimitedTextDelimiter"` | String<br/>single character<br/>user-defined | For [CSV blobs](/azure/search/search-howto-index-csv-blobs), specifies the end-of-line delimiter for CSV files where each line starts a new document (for example, `"|"`).  |
| `"firstLineContainsHeaders"` | Boolean<br/> true (default) <br/>false | For [CSV blobs](/azure/search/search-howto-index-csv-blobs), indicates that the first (non-blank) line of each blob contains headers.|
| `"documentRoot"` | String<br/>user-defined path | For [JSON arrays](/azure/search/search-howto-index-json-blobs#nested-json-arrays), given a structured or semi-structured document, you can specify a path to the array using this property. |
| `"dataToExtract"` | String<br/> `"storageMetadata"` <br/>`"allMetadata"` <br/> `"contentAndMetadata"` (default) | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage):<br/>Set to `"storageMetadata"` to index just the [standard blob properties and user-specified metadata](/azure/storage/blobs/storage-properties-metadata). <br/>Set to `"allMetadata"` to extract metadata provided by the Azure blob storage subsystem and the [content-type specific metadata](/azure/search/search-howto-indexing-azure-blob-storage#ContentSpecificMetadata) (for example, metadata unique to just .png files) are indexed. <br/>Set to `"contentAndMetadata"` to extract all metadata and textual content from each blob. <br/><br/>For [image-analysis in AI enrichment](/azure/search/cognitive-search-concept-image-scenarios), when `"imageAction"` is set to a value other than `"none"`, the `"dataToExtract"` setting tells the indexer which data to extract from image content. Applies to embedded image content in a .PDF or other application, or image files such as .jpg and .png, in Azure blobs.  |
| `"imageAction"` | String<br/> `"none"`<br/> `"generateNormalizedImages"`<br/> `"generateNormalizedImagePerPage"` | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set to`"none"` to ignore embedded images or image files in the data set. This is the default. <br/><br/>For [image-analysis in AI enrichment](/azure/search/cognitive-search-concept-image-scenarios), set to`"generateNormalizedImages"`  to extract text from images (for example, the word "stop" from a traffic Stop sign), and embed it as part of the content field. During image analysis, the indexer creates an array of normalized images as part of document cracking, and embeds the generated information into the content field. This action requires that `"dataToExtract"` is set to `"contentAndMetadata"`. A normalized image refers to additional processing resulting in uniform image output, sized and rotated to promote consistent rendering when you include images in visual search results (for example, same-size photographs in a graph control as seen in the [JFK demo](https://github.com/Microsoft/AzureSearch_JFK_Files)). This information is generated for each image when you use this option.  <br/><br/>If you set to `"generateNormalizedImagePerPage"`, PDF files will be treated differently in that instead of extracting embedded images, each page will be rendered as an image and normalized accordingly.  Non-PDF file types will be treated the same as if `"generateNormalizedImages"` was set.  <br/><br/>Setting the `"imageAction"` configuration to any value other than `"none"` requires that a [skillset](create-skillset.md) also be attached to that indexer.
| `"normalizedImageMaxWidth"`<br/>`"normalizedImageMaxHeight"` | Any integer between 50-10000 | The maximum width or height (in pixels) respectively for normalized images generated when an `"imageAction"` is set. The default is 2000. <br/><br/> The default of 2000 pixels for the normalized images maximum width and height is based on the maximum sizes supported by the [OCR skill](/azure/search/cognitive-search-skill-ocr) and the [image analysis skill](/azure/search/cognitive-search-skill-image-analysis). The [OCR skill](/azure/search/cognitive-search-skill-ocr) supports a maximum width and height of 4200 for non-English languages, and 10000 for English.  If you increase the maximum limits, processing could fail on larger images depending on your skillset definition and the language of the documents.|
| `"allowSkillsetToReadFileData"` | Boolean<br/> true <br/>false (default) | Setting the `"allowSkillsetToReadFileData"` parameter to `true` will create a path `/document/file_data` that is an object representing the original file data downloaded from your blob data source.  This allows you to pass the original file data to a [custom skill](/azure/search/cognitive-search-custom-skill-web-api) for processing within the enrichment pipeline, or to the [Document Extraction skill](/azure/search/cognitive-search-skill-document-extraction). The object generated will be defined as follows: `{ "$type": "file", "data": "BASE64 encoded string of the file" }` <br/><br/> Setting the `"allowSkillsetToReadFileData"` parameter to `true` requires that a [skillset](create-skillset.md) be attached to that indexer and that the `"parsingMode"` parameter is set to `"default"`, `"text"` or `"json"`. |
| `"pdfTextRotationAlgorithm"` | String<br/> `"none"` (default)<br/> `"detectAngles"` | Setting the `"pdfTextRotationAlgorithm"` parameter to `"detectAngles"` may help produce better and more readable text extraction from PDF files that have rotated text within them.  Note that there may be a small performance speed impact when this parameter is used. This parameter only applies to PDF files, and only to PDFs with embedded text. If the rotated text appears within an embedded image in the PDF, this parameter does not apply.<br/><br/> Setting the `"pdfTextRotationAlgorithm"` parameter to `"detectAngles"` requires that the `"parsingMode"` parameter is set to `"default"`. |

#### Azure Cosmos DB configuration parameters

The following parameters are specific to Cosmos DB indexers.

| Parameter | Type and allowed values	| Usage       |
|-----------|---------------------------|-------------|
|`"assumeOrderByHighWaterMarkColumn"` | Boolean  | For [Cosmos DB indexers with SQL API](/azure/search/search-howto-index-cosmosdb), set this parameter to provide a hint to Cosmos DB that the query used to return documents for indexing is in fact ordered by the `_ts` column. Setting this parameter gives you better results for [incremental indexing scenarios](/azure/search/search-howto-index-cosmosdb#incremental-indexing-and-custom-queries). |

### Azure SQL configuration parameters

The following parameters are specific to Azure SQL Database.

| Parameter | Type and allowed values	| Usage       |
|-----------|---------------------------|-------------|
|`"queryTimeout"` | String<br/>"hh:mm:ss"<br/>"00:05:00"   | For [Azure SQL Database](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers), set this parameter to increase the timeout beyond the 5-minute default.|
|`"convertHighWaterMarkToRowVersion"` | Boolean  | Set this parameter to "true"  to use the rowversion data type for the high water mark column. When this property is set to true, the indexer subtracts one from the rowversion value before the indexer runs. It does this because views with one-to-many joins may have rows with duplicate rowversion values. Subtracting one ensures the indexer query doesn't miss these rows. |
|`"disableOrderByHighWaterMarkColumn"` | Boolean | Set this parameter to "true" if you want to [disable the ORDER BY behavior](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers#disableorderbyhighwatermarkcolumn) in the query used for change detection. If you're using the high water mark change detection policy, the indexer uses WHERE and ORDER BY clauses to track which rows need indexing (`WHERE [High Water Mark Column] > [Current High Water Mark Value] ORDER BY [High Water Mark Column]`). This parameter disables the ORDER BY behavior. Indexing will finish faster, but the trade off is that if the indexer is interrupted for any reason, the entire indexer job must be repeated in full.|

## Response

201 Created for a successful request.  

## Examples

**Example: Indexer with schedule and generic parameters**

Creates an indexer that copies data from the table referenced by the `ordersds` data source to the `orders` index on a schedule that starts on Jan 1, 2021 UTC and runs hourly. Each indexer invocation will be successful if no more than 5 items fail to be indexed in each batch, and no more than 10 items fail to be indexed in total.  

```json
{
    "name" : "myindexer",  
    "description" : "a cool indexer",  
    "dataSourceName" : "ordersds",  
    "targetIndexName" : "orders",  
    "schedule" : { "interval" : "PT1H", "startTime" : "2021-01-01T00:00:00Z" },  
    "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5 }  
}
```

> [!NOTE]
> If an indexer is set to a certain schedule but repeatedly fails on the same document over and over again each time it runs, the indexer will begin running on a less frequent interval (up to the maximum of at least once every 24 hours) until it successfully makes progress again.  If you believe you have fixed whatever the issue that was causing the indexer to be stuck at a certain point, you can perform a [reset, followed by an on-demand run](/azure/search/search-howto-run-reset-indexers), of the indexer, and if that successfully makes progress, the indexer will return to its set schedule interval again.

**Example: Indexer with blob parameters**

An indexer can optionally take configuration parameters that modify runtime behaviors. Configuration parameters are comma-delimited on the indexer request and are specific to a data source type. The following configuration parameters provide instructions used to index blobs.

```json
  {
    "name" : "my-blob-indexer-for-cognitive-search",
    ... other indexer properties
    "parameters" : 
      { 
      "maxFailedItems" : "15", 
      "batchSize" : "100", 
      "configuration" : 
          { 
          "parsingMode" : "json", 
          "indexedFileNameExtensions" : ".json, .jpg, .png",
          "imageAction" : "generateNormalizedImages",
          "dataToExtract" : "contentAndMetadata" ,
          "executionEnvironment": "Standard"
          } 
      }
  }
```

**Example: Indexer with field mappings**

Map a source table's field `_id` to an "id" field in a search index. Azure Cognitive Search doesn't allow a field name to start with an underscore. A field mapping can resolve name discrepancies. Both source and target field names are case-insensitive. For more information, see [Field mappings and transformations](/azure/search/search-indexer-field-mappings).

```json
"fieldMappings" : [
    { "sourceFieldName" : "_id", "targetFieldName" : "id" },
    { "sourceFieldName" : "_timestamp", "targetFieldName" : "timestamp" }
]
```

**Example: Indexer with AI enrichment**

Demonstrates an AI enrichment, indicated by the reference to a `skillset` and `outputFieldMappings`. [Skillsets](create-skillset.md) are high-level resources, defined separately. This example is an abbreviation of the indexer definition in the [AI enrichment tutorial](/azure/search/cognitive-search-tutorial-blob).

```json
{
  "name":"demoindexer",	
  "dataSourceName" : "demodata",
  "targetIndexName" : "demoindex",
  "skillsetName" : "demoskillset",
  "fieldMappings" : [
    {
        "sourceFieldName" : "content",
        "targetFieldName" : "content"
    }
   ],
  "outputFieldMappings" : 
  [
    {
        "sourceFieldName" : "/document/organizations", 
        "targetFieldName" : "organizations"
    },
  ],
  "parameters":
  {
  	"maxFailedItems":-1,
  	"configuration": 
    {
    "dataToExtract": "contentAndMetadata",
    "imageAction": "generateNormalizedImages"
    }
  }
}
```

**Example: Indexer with skillset and output field mappings**

In [AI enrichment](/azure/search/cognitive-search-concept-intro) scenarios in which a skillset is bound to an indexer, you must add `outputFieldMappings` to associate any output of an enrichment step that provides content to a searchable field in the index. The `sourceFieldName` is a node in an enrichment tree. It might be a compound structure built during enrichment from two separate fields in the source document. The `targetFieldName` is a field in a search index. For more information, see [How to map output fields from a skillset](/azure/search/cognitive-search-output-field-mapping).

```json
"outputFieldMappings" : [
      {
        "sourceFieldName" : "/document/organizations", 
        "targetFieldName" : "organizations"
      },
      {
        "sourceFieldName" : "/document/pages/*/keyPhrases/*", 
        "targetFieldName" : "keyphrases"
      },
      {
          "sourceFieldName": "/document/languageCode",
          "targetFieldName": "language",
          "mappingFunction": null
      }      
  ]
```

**Example: Encryption keys**

Encryption keys are customer-managed keys used for additional encryption. For more information, see [Encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys).

```json
{
    "name" : "myindexer",  
    "description" : "a cool indexer",  
    "dataSourceName" : "ordersds",  
    "targetIndexName" : "orders",  
    "schedule" : { "interval" : "PT1H", "startTime" : "2021-01-01T00:00:00Z" },  
    "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5 },
    "encryptionKey": (optional) { 
      "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
      "keyVaultKeyVersion": "Version of the Azure Key Vault key",
      "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
      "accessCredentials": (optional, only if not using managed system identity) {
        "applicationId": "Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault",
        "applicationSecret": "Authentication key of the specified Azure AD application)"}
      }
}
```

## See also

+ [Indexer overview](/azure/search/search-indexer-overview)
+ [Creating indexers](/azure/search/search-howto-create-indexers)
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](/azure/search/cognitive-search-output-field-mapping)