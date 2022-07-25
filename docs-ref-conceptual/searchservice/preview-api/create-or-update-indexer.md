---
title: Create or Update Indexer (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: Preview version of the Create or Update Indexer REST API for Azure Cognitive Search.
ms.date: 07/25/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---

# Create or Update Indexer (Preview REST API)

**API Version: 2021-04-30-Preview, 2020-06-30-Preview**

> [!Important]
> 2021-04-30-Preview adds managed identity support for enrichment cache and encryption keys:
> + **"storageConnectionString"** accepts a Resource ID for a system-assigned managed identity connection to Azure Storage. This property is under [**"cache"**](#cache). User-assigned managed identity is not supported.
> + **"identity"** accepts a user-assigned managed identity.
>
> 2020-06-30-Preview adds:
> + [**"cache"**](#cache), used to [cache and reuse enriched content](/azure/search/cognitive-search-incremental-indexing-conceptual) created by a skillset.

An [indexer](/azure/search/search-indexer-overview) automates indexing from supported data sources by connecting to a predefined *data source*, retrieving and serializing data, and passing it to a search service for data ingestion. For AI enrichment of image and unstructured text, indexers can also accept a *skillset* that adds image and natural language processing. 

You can use either POST or PUT on a create request. For either one, the request body provides the object definition.

```http
POST https://[service name].search.windows.net/indexers?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]  
```  

For update requests, use PUT and specify the indexer name on the URI. 

```http
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]    
```

HTTPS is required for all service requests. If the indexer doesn't exist, it's created. If it already exists, it's updated to the new definition but you must issue a [Run Indexer](../run-indexer.md) request if you want indexer execution.

**Creating an indexer** adds it to your search service and runs it. If the request is successful, the index will be populated with searchable content from the data source. 

**Updating an indexer** doesn't automatically run it, but depending on your modifications and the associated a data source, a reset and rerun might be required. When updating an existing indexer, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the indexer definition with a GET, modify it, and then update it with PUT.

Indexer configuration varies based on the type of data source. For data-platform-specific guidance on creating indexers, start with [Indexers overview](/azure/search/search-indexer-overview), which includes the complete list of [related articles](/azure/search/search-indexer-overview#next-steps).

> [!NOTE]  
> The maximum number of indexers that you can create varies by pricing tier. For more information, see [Service limits for Azure Cognitive Search](/azure/search/search-limits-quotas-capacity/).    

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be fewer 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes aren't consecutive. |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It's a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

A [data source](create-or-update-data-source.md), [index](create-or-update-index.md), and [skillset](create-or-update-skillset.md) are part of an [indexer](/azure/search/search-indexer-overview) definition, but each is an independent component that can be used in different combinations. For example, you could use the same data source with multiple indexers, or the same index with multiple indexers, or multiple indexers writing to a single index.

The following JSON is a high-level representation of the main parts of the definition. 

```json
{   
    "name" : (optional on PUT; required on POST) "Name of the indexer",  
    "description" : (optional) "Anything you want, or nothing at all", 
    "dataSourceName" : (required) "Name of an existing data source",  
    "targetIndexName" : (required) "Name of an existing index",  
    "skillsetName" : (required for AI enrichment) "Name of an existing skillset",
    "cache":  { ... },
    "schedule" : (optional but runs once immediately if unspecified) { ... },  
    "parameters" : (optional) {
        "batchSize": null,
        "maxFailedItems": 0,
        "maxFailedItemsPerBatch": 0,
        "base64EncodeKeys": null,
        "configuration": { }
    },
    "fieldMappings" : (optional) { ... },
    "outputFieldMappings" : (required for AI enrichment) { ... },
    "encryptionKey":(optional) { },
    "disabled" : (optional) Boolean value indicating whether the indexer is disabled. False by default.
}  
```

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name must be lower case, start with a letter or number, have no slashes or dots, and be fewer 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes aren't consecutive.| 
|description| Optional. Description of the indexer. |
|dataSourceName |Required. Name of an existing data source that provides connection information and other properties.|
|targetIndexName|Required. Name of an existing index. |  
|skillsetName|Required for AI enrichment. Name of an existing skillset. |
|[cache](#cache) |Optional for AI enrichment, enables reuse of unchanged documents. |
|[schedule](#schedule)| Optional, but runs once immediately if unspecified. |
|[parameters](#parameters)| Optional. Properties for modifying runtime behavior.|
|[fieldMappings](#fieldmappings)| Optional. Used when source and destination fields have different names. |
|[outputFieldMappings](#outputfieldmappings)| Required for AI enrichment. Maps output from a skillset to an index or projection. |
|[encryptionKey](#encryptionkey)| Optional. Used to encrypt indexer data at rest with your own keys, managed in your Azure Key Vault. To learn more, see [Azure Cognitive Search encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys). |
|disabled| Optional. Boolean value indicating whether the indexer is disabled. False by default. |

## Response  

201 Created for a successful request.  

## Examples  

**Example: Text-based indexer with schedule and parameter**

This example creates an indexer that copies data from the table referenced by the `order-sds` data source to the `orders-idx` index on a schedule that starts on January 1, 2022 UTC and runs hourly. Each indexer invocation will be successful if no more than 5 items fail to be indexed in each batch, and no more than 10 items fail to be indexed in total. Field mappings provide a data path when field names and types don't match.

```json
{
    "name" : "myindexer",  
    "description" : "a cool indexer",  
    "dataSourceName" : "orders-ds",  
    "targetIndexName" : "orders-idx", 
    "fieldMappings" : [
      {
          "sourceFieldName" : "content",
          "targetFieldName" : "sourceContent"
      }
    ], 
    "schedule" : { "interval" : "PT1H", "startTime" : "2022-01-01T00:00:00Z" },  
    "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5 }  
}
```

**Example: Skillset indexer**

This example demonstrates an AI enrichment, indicated by the reference to a skillset and [outputFieldMappings](#output-fieldmappings) that map skill outputs to fields in a search index. [Skillsets](create-or-update-skillset.md) are high-level resources, defined separately. 

New in this preview and applicable to skillsets only, you can specify the [cache property](#cache) to reuse documents that are unaffected by changes in your skillset definition.

```json
{
  "name":"demo-indexer",	
  "dataSourceName" : "demo-data",
  "targetIndexName" : "demo-index",
  "skillsetName" : "demo-skillset",
  "cache" : 
    {
      "storageConnectionString" : "DefaultEndpointsProtocol=https;AccountName=<storage-account-name>;AccountKey=<storage-account-key>;EndpointSuffix=core.windows.net",
      "enableReprocessing": true
    },
  "fieldMappings" : [ ],
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

**Example: Enrichment cache with a managed identity connection**

This example illustrates the connection string format when using Azure Active Directory for authentication. The search service must be [configured to use a managed identity](/azure/search/search-howto-managed-identities-data-sources). The identity must have "Storage Blob Data Contributor" permissions so that it can write to the cache. The connection string is the unique Resource ID of your storage account, and it must include the container used to store the cached enrichment.

```json
{
  "name":"demo-indexer",
  "dataSourceName" : "demodata-ds",
  "targetIndexName" : "demo-index",
  "skillsetName" : "demo-skillset",
  "cache" : 
    {
      "storageConnectionString" : "ResourceId=/subscriptions/<subscription-ID>/resourceGroups/<resource-group-name>/providers/Microsoft.Storage/storageAccounts/<storage-account-name>/<container-name>;",
      "enableReprocessing": true
    },
  "fieldMappings" : [  ],
  "outputFieldMappings" :  [  ],
  "parameters": {  }
}
```

## Definitions

|Link|Description|
|--|--|
| [cache](#cache) | Configures caching for AI enrichment and skillset execution.  |
| [encryptionKey](#encryptionkey) | Configures a connection to Azure Key Vault for customer-managed encryption. |
| [fieldMappings](#field-mappings) | Source-to-destination field mappings for fields that don't match by name and type. |
| [outputFieldMappings](#outputfieldmappings) | Maps nodes in an enriched document to fields in an index. Required if you are using skillsets. |
| [parameters](#parameters) | Configures an indexer. Parameters include general parameters and source-specific parameters.|
| [schedule](#schedule) | Specifies the interval and frequency of scheduled indexer execution.|

<a name="cache"></a>

### cache (preview)

[Incremental indexing](/azure/search/cognitive-search-incremental-indexing-conceptual) is the ability to reuse enriched documents in the cache when processing a skillset. The most common scenario is reuse of OCR or image analysis of image files, which can be costly and time-consuming to process.

```json
"cache" : 
  {
    "storageConnectionString" : "<YOUR-STORAGE-ACCOUNT-CONNECTION-STRING>",
    "enableReprocessing": true
  }
```

The cache object has required and optional properties.

|Property|Description|  
|--------------|-----------------|  
| storageConnectionString | Required. Specifies the storage account used to cache the intermediate results. Using the account you provide, the search service will create a blob container prefixed with `ms-az-search-indexercache` and completed with a GUID unique to the indexer. It must be set to either a full access connection string that includes a key, or the unique Resource ID of your storage account for requests that are authenticated using Azure AD. </p>To authenticate through Azure AD, the search service must be [configured to use a managed identity](/azure/search/search-howto-managed-identities-data-sources), and that identity must have "Storage Blob Data Contributor" permission.|
| enableReprocessing | Optional. Boolean property (`true` by default) to control processing over incoming documents already represented in the cache. When `true` (default), documents already in the cache are reprocessed when you rerun the indexer, assuming your skill update affects that doc. When `false`, existing documents aren't reprocessed, effectively prioritizing new, incoming content over existing content. You should only set `enableReprocessing` to `false` on a temporary basis. To ensure consistency across the corpus, `enableReprocessing` should be `true` most of the time, ensuring that all documents, both new and existing, are valid per the current skillset definition.|
| ID | Read-only. Generated once the cache is created. The `ID` is the identifier of the container within the storage account that will be used as the cache for this indexer. This cache will be unique to this indexer and if the indexer is deleted and recreated with the same name, the `ID` will be regenerated. The `ID` can't be set, it's always generated by the service. |

 <a name="schedule"></a>

### schedule

An indexer can optionally specify a schedule. Without a schedule, the indexer runs immediately when you send the request: connecting to, crawling, and indexing the data source. For some scenarios including long-running indexing jobs, schedules are used to [extend the processing window](/azure/search/search-howto-large-index) beyond the 24-hour maximum. If a schedule is present, the indexer runs periodically as per schedule. The scheduler is built in; you can't use an external scheduler. A **Schedule** has the following attributes: 

- **interval**: Required. A duration value that specifies an interval or period for indexer runs. The smallest allowed interval is five minutes; the longest is one day. It must be formatted as an XSD "dayTimeDuration" value (a restricted subset of an [ISO 8601 duration](https://www.w3.org/TR/xmlschema11-2/#dayTimeDuration) value). The pattern for this is: `"P[nD][T[nH][nM]]".` Examples:  `PT15M` for every 15 minutes, `PT2H` for every 2 hours.  

- **startTime**: Optional. A UTC datetime when the indexer should start running.  

> [!NOTE]
> If an indexer is set to a certain schedule but repeatedly fails on the same document over and over again each time it runs, the indexer will begin running on a less frequent interval (up to the maximum of at least once every 24 hours) until it successfully makes progress again.  If you believe you have fixed whatever the issue that was causing the indexer to be stuck at a certain point, you can perform an on demand run of the indexer, and if that successfully makes progress, the indexer will return to its set schedule interval again.

<a name="parameters"></a>

### parameters

An indexer can optionally take configuration parameters that modify runtime behaviors. Configuration parameters are comma-delimited on the indexer request. 

```json
{
  "name" : "my-blob-indexer-for-cognitive-search",
  ... other indexer properties
  "parameters" : { 
        "batchSize": null,
        "maxFailedItems": 0,
        "maxFailedItemsPerBatch": 0,
        "base64EncodeKeys": null,
        "configuration" : { 
            "parsingMode" : "json", 
            "indexedFileNameExtensions" : ".json, .jpg, .png", 
            "imageAction" : "generateNormalizedImages", 
            "dataToExtract" : "contentAndMetadata" } }
}
```

#### General parameters for all indexers

| Parameter | Type and allowed values	| Usage  |
|-----------|--------------------------|--------|
| `"batchSize"` | Integer<br/>Default is source-specific (1000 for Azure SQL Database and Azure Cosmos DB, 10 for Azure Blob Storage) | Specifies the number of items that are read from the data source and indexed as a single batch in order to improve performance. |
| `"maxFailedItems"` | Integer<br/>Default is 0 | Number of errors to tolerate before an indexer run is considered a failure. Set to -1 if you don’t want any errors to stop the indexing process. You can retrieve information about failed items using [Get Indexer Status](../get-indexer-status.md).  |
| `"maxFailedItemsPerBatch"` | Integer<br/>Default is 0 | Number of errors to tolerate in each batch before an indexer run is considered a failure. Set to -1 if you don’t want any errors to stop the indexing process. |
| `"base64EncodeKeys"` | Boolean<br/>Default is true | Valid values are null, true, or false. When set to false, the indexer will not automatically base64 encode the values of the field designated as the document key. Setting this property eliminates the need to specify a mapping function that base64 encodes key values (such as dashes) that are not otherwise valid in a document key.|

#### Blob configuration parameters

Several parameters are exclusive to a particular indexer, such as [Azure blob indexing](/azure/search/search-howto-indexing-azure-blob-storage).

| Parameter                     | Type and allowed values	| Usage                |
|-------------------------------|---------------------------|----------------------|
| `"parsingMode"` | String<br/> `"text"`<br/>`"delimitedText"`<br/> `"json"`<br/> `"jsonArray"` <br /> `"jsonLines"`  | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set to `text` to improve indexing performance on plain text files in blob storage. <br/>For [CSV blobs](/azure/search/search-howto-index-csv-blobs), set to `delimitedText` when blobs are plain CSV files. <br/>For [JSON blobs](/azure/search/search-howto-index-json-blobs), set to `json` to extract structured content or to `jsonArray` to extract individual elements of an array as separate documents in Azure Cognitive Search. Use `jsonLines` to extract individual JSON entities, separated by a new line, as separate documents in Azure Cognitive Search. |
| `"excludedFileNameExtensions"` | String<br/>comma-delimited list<br/>user-defined | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), ignore any file types in the list. For example, you could exclude ".png, .png, .mp4" to skip over those files during indexing. | 
| `"indexedFileNameExtensions"` | String<br/>comma-delimited list<br/>user-defined | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), selects blobs if the file extension is in the list. For example, you could focus indexing on specific application files ".docx, .pptx, .msg" to specifically include those file types. | 
| `"failOnUnsupportedContentType"` | Boolean<br/> true <br/>false (default) | For [Azure blobs](/azure/search-howto-indexing-azure-blob-storage), set to `false` if you want to continue indexing when an unsupported content type is encountered, and you don't know all the content types (file extensions) in advance. |
| `"failOnUnprocessableDocument"` | Boolean<br/> true <br/>false (default)| For [Azure blobs](/azure/search-howto-indexing-azure-blob-storage), set to `false` if you want to continue indexing if a document fails indexing. |
| `"indexStorageMetadataOnly`<br/>`ForOversizedDocuments"` | Boolean true <br/>false (default) | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set this property to `true` to still index storage metadata for blob content that is too large to process.  Oversized blobs are treated as errors by default. For limits on blob size, see [Service Limits](/azure/search/search-limits-quotas-capacity). |
| `"delimitedTextHeaders"` | String<br/>comma-delimited list<br/>user-defined| For [CSV blobs](/azure/search/search-howto-index-csv-blobs), specifies a comma-delimited list of column headers, useful for mapping source fields to destination fields in an index. |
| `"delimitedTextDelimiter"` | String<br/>single character<br/>user-defined | For [CSV blobs](/azure/search/search-howto-index-csv-blobs), specifies the end-of-line delimiter for CSV files where each line starts a new document (for example, `"|"`).  |
| `"firstLineContainsHeaders"` | Boolean<br/> true (default) <br/>false | For [CSV blobs](/azure/search/search-howto-index-csv-blobs), indicates that the first (non-blank) line of each blob contains headers.|
| `"documentRoot"` | String<br/>user-defined path | For [JSON arrays](/azure/search/search-howto-index-json-blobs#nested-json-arrays), given a structured or semi-structured document, you can specify a path to the array using this property. |
| `"dataToExtract"` | String<br/> `"storageMetadata"` <br/>`"allMetadata"` <br/> `"contentAndMetadata"` (default) | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage):<br/>Set to `"storageMetadata"` to index just the [standard blob properties and user-specified metadata](/storage/blobs/storage-properties-metadata). <br/>Set to `"allMetadata"` to extract metadata provided by the Azure blob storage subsystem and the [content-type specific metadata](/azure/search/search-howto-indexing-azure-blob-storage#ContentSpecificMetadata) (for example, metadata unique to just .png files) are indexed. <br/>Set to `"contentAndMetadata"` to extract all metadata and textual content from each blob. <br/><br/>For [image-analysis in AI enrichment](/azure/search/cognitive-search-concept-image-scenarios), when `"imageAction"` is set to a value other than `"none"`, the `"dataToExtract"` setting tells the indexer which data to extract from image content. Applies to embedded image content in a .PDF or other application, or image files such as .jpg and .png, in Azure blobs.  |
| `"imageAction"` | String<br/> `"none"`<br/> `"generateNormalizedImages"`<br/> `"generateNormalizedImagePerPage"` | For [Azure blobs](/azure/search/search-howto-indexing-azure-blob-storage), set to`"none"` to ignore embedded images or image files in the data set. This is the default. <br/><br/>For [image-analysis in AI enrichment](/azure/search/cognitive-search-concept-image-scenarios), set to`"generateNormalizedImages"`  to extract text from images (for example, the word "stop" from a traffic Stop sign), and embed it as part of the content field. During image analysis, the indexer creates an array of normalized images as part of document cracking, and embeds the generated information into the content field. This action requires that `"dataToExtract"` is set to `"contentAndMetadata"`. A normalized image refers to additional processing resulting in uniform image output, sized and rotated to promote consistent rendering when you include images in visual search results (for example, same-size photographs in a graph control as seen in the [JFK demo](https://github.com/Microsoft/AzureSearch_JFK_Files)). This information is generated for each image when you use this option.  <br/><br/>If you set to `"generateNormalizedImagePerPage"`, PDF files will be treated differently in that instead of extracting embedded images, each page will be rendered as an image and normalized accordingly.  Non-PDF file types will be treated the same as if `"generateNormalizedImages"` was set.  <br/><br/>Setting the `"imageAction"` configuration to any value other than `"none"` requires that a [skillset](../create-skillset.md) also be attached to that indexer.
| `"normalizedImageMaxWidth"`<br/>`"normalizedImageMaxHeight"` | Any integer between 50-10000 | The maximum width or height (in pixels) respectively for normalized images generated when an `"imageAction"` is set. The default is 2000. <br/><br/> The default of 2000 pixels for the normalized images maximum width and height is based on the maximum sizes supported by the [OCR skill](/azure/search/cognitive-search-skill-ocr) and the [image analysis skill](/azure/search/cognitive-search-skill-image-analysis). The [OCR skill](/azure/search/cognitive-search-skill-ocr) supports a maximum width and height of 4200 for non-English languages, and 10000 for English.  If you increase the maximum limits, processing could fail on larger images depending on your skillset definition and the language of the documents.|
| `"allowSkillsetToReadFileData"` | Boolean<br/> true <br/>false (default) | Setting the `"allowSkillsetToReadFileData"` parameter to `true` will create a path `/document/file_data` that is an object representing the original file data downloaded from your blob data source.  This allows you to pass the original file data to a [custom skill](/azure/search/cognitive-search-custom-skill-web-api) for processing within the enrichment pipeline, or to the [Document Extraction skill](/azure/search/cognitive-search-skill-document-extraction). The object generated will be defined as follows: `{ "$type": "file", "data": "BASE64 encoded string of the file" }` <br/><br/> Setting the `"allowSkillsetToReadFileData"` parameter to `true` requires that a [skillset](../create-skillset.md) be attached to that indexer, that the `"parsingMode"` parameter is set to `"default"`, `"text"` or `"json"`, and the `"dataToExtract"` parameter is set to `"contentAndMetadata"` or `"allMetadata"`. |
| `"pdfTextRotationAlgorithm"` | String<br/> `"none"` (default)<br/> `"detectAngles"` | Setting the `"pdfTextRotationAlgorithm"` parameter to `"detectAngles"` may help produce better and more readable text extraction from PDF files that have rotated text within them.  Note that there may be a small performance speed impact when this parameter is used. This parameter only applies to PDF files, and only to PDFs with embedded text. If the rotated text appears within an embedded image in the PDF, this parameter doesn't apply.<br/><br/> Setting the `"pdfTextRotationAlgorithm"` parameter to `"detectAngles"` requires that the `"parsingMode"` parameter is set to `"default"`. |

#### Azure Cosmos DB configuration parameters

The following parameters are specific to Cosmos DB indexers.

| Parameter | Type and allowed values	| Usage       |
|-----------|---------------------------|-------------|
|`"assumeOrderByHighWaterMarkColumn"` | Boolean  | For [Cosmos DB indexers with SQL API](/azure/search/search-howto-index-cosmosdb), set this parameter to provide a hint to Cosmos DB that the query used to return documents for indexing is in fact ordered by the `_ts` column. Setting this parameter gives you better results for [incremental indexing scenarios](/azure/search/search-howto-index-cosmosdb#incremental-indexing-and-custom-queries). |

#### Azure SQL configuration parameters

The following parameters are specific to [Azure SQL Database](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers).

| Parameter | Type and allowed values	| Usage       |
|-----------|-------------------------|-------------|
|`"queryTimeout"` | String<br/>"hh:mm:ss"<br/>"00:05:00"   | Set this parameter to override the 5-minute default.|
|`"convertHighWaterMarkToRowVersion"` | Boolean  | Set this parameter to "true"  to use the rowversion data type for the high water mark column. When this property is set to true, the indexer subtracts one from the rowversion value before the indexer runs. It does this because views with one-to-many joins may have rows with duplicate rowversion values. Subtracting one ensures the indexer query doesn't miss these rows. |
|`"disableOrderByHighWaterMarkColumn"` | Boolean | If you're using the High Watermark change detection policy, the indexer uses WHERE and ORDER BY clauses to track which rows need indexing (`WHERE [High Water Mark Column] > [Current High Water Mark Value] ORDER BY [High Water Mark Column]`). You can [disable the ORDER BY behavior](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers#disableorderbyhighwatermarkcolumn) by setting "disableOrderByHighWaterMarkColumn" to true. Indexing will finish faster, but the trade off is that if the indexer is interrupted for any reason, the entire indexer job must be repeated in full.|

<a name="field-mappings"></a>

### fieldMappings

Create these when source-destination field names or types don't match, or when you want to specify a function. Field mappings are case-insensitive. See [Define field mappings](/azure/search/search-indexer-field-mappings).

|Attribute|Description|  
|---------------|-----------------|  
| sourceFieldName | Required. Name of the source column. |
| targetFieldName | Required. Name of the corresponding field in the search index. 
| mappingFunction | Optional. Adds processing to source values en route to the search engine. For example, an arbitrary string value can be base64-encoded so it can be used to populate a document key field. A mapping function has a name and parameters. Valid values include:  </br></br>base64Encode </br>base64Decode </br>extractTokenAtPosition </br>jsonArrayToStringCollection </br>urlEncode </br>urlDecode| 

<a name="output-fieldmappings"></a>

### outputFieldMappings

Specifies skill outputs (or nodes in an enrichment tree) to fields in a search index.

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
   ],
```

<a name="encryptionKey"> </a>

### encryptionKey

Configures a connection to Azure Key Vault for supplemental [customer-managed encryption keys (CMK)](/azure/search/search-security-manage-encryption-keys). Encryption with customer-managed keys is not available for free services. For billable services, it's only available for search services created on or after 2019-01-01.

A connection to the key vault must be authenticated. You can use either "accessCredentials" or a managed identity for this purpose. 

Managed identities can be system or user-assigned (preview). If the search service has both a system-assigned managed identity and a role assignment that grants read access to the key vault, you can omit both "identity" and "accessCredentials", and the request will authenticate using the system managed identity. If the search service has user-assigned identity and role assignment, set the "identity" property to the resource ID of that identity.

|Attribute|Description|  
|---------------|-----------------|  
| keyVaultKeyName | Required. Name of the Azure Key Vault key used for encryption. |
| keyVaultKeyVersion | Required. Version of the Azure Key Vault key. |
| keyVaultUri  | Required. URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be `https://my-keyvault-name.vault.azure.net` |
| accessCredentials | Omit if you are using a managed identity. Otherwise, the properties of `accessCredentials` include `applicationId` (an Azure Active Directory Application ID that has access permissions to your specified Azure Key Vault), and `applicationSecret` (the authentication key of the specified Azure AD application). |
| identity | Optional unless you are using a user-assigned managed identity for the search service connection to Azure Key Vault. The format is `"/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.ManagedIdentity/userAssignedIdentities/[managed identity name]"`. |

## See also

+ [Customer-managed encryption](/azure/search/search-security-manage-encryption-keys)
+ [Indexer overview](/azure/search/search-indexer-overview)
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](/azure/search/cognitive-search-output-field-mapping)
