---
title: Create Indexer (api-version=2019-05-06-Preview)
description: Indexers are resources that automate many aspects of data ingestion into an Azure Cognitive Search indexes. You must use a supported Azure data source to use this API.

author: luiscabrer
ms.author: luisca

ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: 01/24/2020
---
# Create Indexer (Preview REST API)

**API Version: 2019-05-06-Preview**

> [!Important]
> This preview adds a [cache property](#cache) used during [incremental indexing](https://docs.microsoft.com/azure/search/cognitive-search-incremental-indexing-conceptual), allowing you to repurpose existing processed content when you make a modification that doesn't affect it.

An [indexer](https://docs.microsoft.com/azure/search/search-indexer-overview) automates indexing from supported Azure data sources such as Azure Storage, Azure SQL Database, and Azure Cosmos DB to name a few. Indexers use a predefined *data source* and *index* to establish an indexing pipeline that extracts and serializes source data, passing it to a search service for data ingestion. For AI enrichment of image and unstructured text, indexers can also accept a *skillset* that defines AI processing. 

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

HTTPS is required for all service requests. If the indexer doesn't exist, it is created. If it already exists, it is updated to the new definition but you must issue a [Run Indexer](../run-indexer.md) request if you want indexer execution.

Indexer configuration varies based on the type of data source. For data-platform-specific guidance on creating indexers, start with [Indexers overview](https://docs.microsoft.com/azure/search/search-indexer-overview), which includes the complete list of [related articles](https://docs.microsoft.com/azure/search/search-indexer-overview#next-steps).

> [!NOTE]  
>  The maximum number of indexes that you can create varies by pricing tier. For more information, see [Service limits for Azure Cognitive Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/).    

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current preview version is `api-version=2019-05-06-Preview` (case-sensitive). See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Headers
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys). 

## Request Body

A [data source](../create-data-source.md), [index](../create-index.md), and [skillset](create-skillset.md) are part of an [indexer](https://docs.microsoft.com/azure/search/search-indexer-overview) definition, but each is an independent component that can be used in different combinations. For example, you could use the same data source with multiple indexers, or the same index with multiple indexers, or multiple indexers writing to a single index.

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
    "parameters" : (optional) { ... },  
    "fieldMappings" : (optional) { ... },
    "outputFieldMappings" : (required for AI enrichment) { ... },
    "disabled" : (optional) Boolean value indicating whether the indexer is disabled. False by default.
}  
```
 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.|  
|[dataSourceName](#dataSourceName) |Required. Name of an existing data source. |
|[targetIndexName](#targetIndexName)|Required. Name of an existing index. |  
|[skillsetName](#skillset)|Required for AI enrichment. Name of an existing skillset. |
|[cache](#cache) |Optional for AI enrichment, enables reuse of unchanged documents. |
|[schedule](#indexer-schedule)| Optional, but runs once immediately if unspecified. |
|[parameters](#indexer-parameters)| Optional. Properties for modifying runtime behavior.|
|[fieldMappings](#field-mappings)| Optional. Used when source and destination fields have different names. |
|[outputFieldMappings](#output-fieldmappings)| Required for AI enrichment. Maps output from a skillset to an index or projection. |
|disabled| Optional. Boolean value indicating whether the indexer is disabled. False by default. |

<a name="dataSourceName"></a>

### "dataSourceName"

A [data source definition](../create-data-source.md) often includes properties that an indexer can use to exploit source platform characteristics. As such, the data source you pass to the indexer determines the availability of certain properties and parameters, such content type filtering in Azure blobs or query timeout for Azure SQL Database. 

<a name="targetIndexName"></a>

### "targetIndexName"

An [index schema](../create-index.md) defines the fields collection containing searchable, filterable, retrievable, and other attributions that determine how the field is used. During indexing, the indexer crawls the data source, optionally cracks documents and extracts information, serializes the results to JSON, and indexes the payload based on the schema defined for your index.

<a name="skillset"></a>

### "skillsetName"

[AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro) refers to natural language and image processing capabilities in Azure Cognitive Search, applied during data ingestion to extract entities, key phrases, language, information from images, and so forth. Transformations applied to content are through *skills*, which you combine into a single [*skillset*](create-skillset.md), one per indexer. As with data sources and indexes, a skillset is an independent component that you attach to an indexer. You can repurpose a skillset with other indexers, but each indexer can only use one skillset at a time.

<a name="cache"></a>

### "cache" (preview)

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
|storageConnectionString | Required. Specifies the storage account used to cache the intermediate results. It must be set to an Azure Storage connection string. Using the account you provide, the search service will create a blob container prefixed with `ms-az-search-indexercache` and completed with a GUID unique to the indexer. |
|enableReprocessing | Optional. Boolean property (`true` by default) to control processing over incoming documents already represented in the cache. When `true` (default), documents already in the cache are reprocessed when you rerun the indexer, assuming your skill update affects that doc. When `false`, existing documents are not reprocessed, effectively prioritizing new, incoming content over existing content. You should only set `enableReprocessing` to `false` on a temporary basis. To ensure consistency across the corpus, `enableReprocessing` should be `true` most of the time, ensuring that all documents, both new and existing, are valid per the current skillset definition.|
| ID | Read-only. Generated once the cache is created. The `ID` is the identifier of the container within the `annotationCache` storage account that will be used as the cache for this indexer. This cache will be unique to this indexer and if the indexer is deleted and recreated with the same name, the `ID` will be regenerated. The `ID` cannot be set, it is always generated by the service. |

 
<a name="indexer-schedule"></a>

### "schedule"  
An indexer can optionally specify a schedule. Without a schedule, the indexer runs immediately when you send the request: connecting to, crawling, and indexing the data source. For some scenarios including long-running indexing jobs, schedules are used to [extend the processing window](https://docs.microsoft.com/azure/search/search-howto-large-index) beyond the 24-hour maximum. If a schedule is present, the indexer runs periodically as per schedule. The scheduler is built in; you cannot use an external scheduler. A **Schedule** has the following attributes: 

-   **interval**: Required. A duration value that specifies an interval or period for indexer runs. The smallest allowed interval is five minutes; the longest is one day. It must be formatted as an XSD "dayTimeDuration" value (a restricted subset of an [ISO 8601 duration](https://www.w3.org/TR/xmlschema11-2/#dayTimeDuration) value). The pattern for this is: `"P[nD][T[nH][nM]]".` Examples:  `PT15M` for every 15 minutes, `PT2H` for every 2 hours.  

-   **startTime**: Optional. A UTC datetime when the indexer should start running.  

> [!NOTE]
> If an indexer is set to a certain schedule but repeatedly fails on the same document over and over again each time it runs, the indexer will begin running on a less frequent interval (up to the maximum of at least once every 24 hours) until it successfully makes progress again.  If you believe you have fixed whatever the issue that was causing the indexer to be stuck at a certain point, you can perform an on demand run of the indexer, and if that successfully makes progress, the indexer will return to its set schedule interval again.

<a name="indexer-parameters"></a>

### "parameters"

An indexer can optionally take configuration parameters that modify runtime behaviors. Configuration parameters are comma-delimited on the indexer request. 

```json
    {
      "name" : "my-blob-indexer-for-cognitive-search",
      ... other indexer properties
      "parameters" : { "maxFailedItems" : "15", "batchSize" : "100", "configuration" : { "parsingMode" : "json", "indexedFileNameExtensions" : ".json, .jpg, .png", "imageAction" : "generateNormalizedImages", "dataToExtract" : "contentAndMetadata" } }
    }
```

#### General parameters for all indexers

| Parameter | Type and allowed values	| Usage  |
|-----------|--------------------------|--------|
| `"batchSize"` | Integer<br/>Default is source-specific (1000 for Azure SQL Database and Azure Cosmos DB, 10 for Azure Blob Storage) | Specifies the number of items that are read from the data source and indexed as a single batch in order to improve performance. |
| `"maxFailedItems"` | Integer<br/>Default is 0 | Number of errors to tolerate before an indexer run is considered a failure. Set to -1 if you don’t want any errors to stop the indexing process. You can retrieve information about failed items using [Get Indexer Status](https://docs.microsoft.com/rest/api/searchservice/get-indexer-status).  |
| `"maxFailedItemsPerBatch"` | Integer<br/>Default is 0 | Number of errors to tolerate in each batch before an indexer run is considered a failure. Set to -1 if you don’t want any errors to stop the indexing process. |

#### Blob configuration parameters

Several parameters are exclusive to a particular indexer, such as [Azure blob indexing](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage).

| Parameter                     | Type and allowed values	| Usage                |
|-------------------------------|---------------------------|----------------------|
| `"parsingMode"` | String<br/> `"text"`<br/>`"delimitedText"`<br/> `"json"`<br/> `"jsonArray"` <br /> `"jsonLines"`  | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), set to `text` to improve indexing performance on plain text files in blob storage. <br/>For [CSV blobs](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), set to `delimitedText` when blobs are plain CSV files. <br/>For [JSON blobs](https://docs.microsoft.com/azure/search/search-howto-index-json-blobs), set to `json` to extract structured content or to `jsonArray` to extract individual elements of an array as separate documents in Azure Cognitive Search. Use `jsonLines` to extract individual JSON entities, separated by a new line, as separate documents in Azure Cognitive Search. |
| `"excludedFileNameExtensions"` | String<br/>comma-delimited list<br/>user-defined | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), ignore any file types in the list. For example, you could exclude ".png, .png, .mp4" to skip over those files during indexing. | 
| `"indexedFileNameExtensions"` | String<br/>comma-delimited list<br/>user-defined | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), selects blobs if the file extension is in the list. For example, you could focus indexing on specific application files ".docx, .pptx, .msg" to specifically include those file types. | 
| `"failOnUnsupportedContentType"` | Boolean<br/> true <br/>false (default) | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), set to `false` if you want to continue indexing when an unsupported content type is encountered, and you don't know all the content types (file extensions) in advance. |
| `"failOnUnprocessableDocument"` | Boolean<br/> true <br/>false (default)| For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), set to `false` if you want to continue indexing if a document fails indexing. |
| `"indexStorageMetadataOnly`<br/>`ForOversizedDocuments"` | Boolean true <br/>false (default) | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), set this property to `true` to still index storage metadata for blob content that is too large to process.  Oversized blobs are treated as errors by default. For limits on blob size, see [Service Limits](https://docs.microsoft.com/azure/search/search-limits-quotas-capacity). |
| `"delimitedTextHeaders"` | String<br/>comma-delimited list<br/>user-defined| For [CSV blobs](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), specifies a comma-delimited list of column headers, useful for mapping source fields to destination fields in an index. |
| `"delimitedTextDelimiter"` | String<br/>single character<br/>user-defined | For [CSV blobs](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), specifies the end-of-line delimiter for CSV files where each line starts a new document (for example, `"|"`).  |
| `"firstLineContainsHeaders"` | Boolean<br/> true (default) <br/>false | For [CSV blobs](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), indicates that the first (non-blank) line of each blob contains headers.|
| `"documentRoot"` | String<br/>user-defined path | For [JSON arrays](https://docs.microsoft.com/azure/search/search-howto-index-json-blobs#nested-json-arrays), given a structured or semi-structured document, you can specify a path to the array using this property. |
| `"dataToExtract"` | String<br/> `"storageMetadata"` <br/>`"allMetadata"` <br/> `"contentAndMetadata"` (default) | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage):<br/>Set to `"storageMetadata"` to index just the [standard blob properties and user-specified metadata](https://docs.microsoft.com/azure/storage/blobs/storage-properties-metadata). <br/>Set to `"allMetadata"` to extract metadata provided by the Azure blob storage subsystem and the [content-type specific metadata](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage#ContentSpecificMetadata) (for example, metadata unique to just .png files) are indexed. <br/>Set to `"contentAndMetadata"` to extract all metadata and textual content from each blob. <br/><br/>For [image-analysis in AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-image-scenarios), when `"imageAction"` is set to a value other than `"none"`, the `"dataToExtract"` setting tells the indexer which data to extract from image content. Applies to embedded image content in a .PDF or other application, or image files such as .jpg and .png, in Azure blobs.  |
| `"imageAction"` | String<br/> `"none"`<br/> `"generateNormalizedImages"`<br/> `"generateNormalizedImagePerPage"` | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), set to`"none"` to ignore embedded images or image files in the data set. This is the default. <br/><br/>For [image-analysis in AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-image-scenarios), set to`"generateNormalizedImages"`  to extract text from images (for example, the word "stop" from a traffic Stop sign), and embed it as part of the content field. During image analysis, the indexer creates an array of normalized images as part of document cracking, and embeds the generated information into the content field. This action requires that `"dataToExtract"` is set to `"contentAndMetadata"`. A normalized image refers to additional processing resulting in uniform image output, sized and rotated to promote consistent rendering when you include images in visual search results (for example, same-size photographs in a graph control as seen in the [JFK demo](https://github.com/Microsoft/AzureSearch_JFK_Files)). This information is generated for each image when you use this option.  <br/><br/>If you set to `"generateNormalizedImagePerPage"`, PDF files will be treated differently in that instead of extracting embedded images, each page will be rendered as an image and normalized accordingly.  Non-PDF file types will be treated the same as if `"generateNormalizedImages"` was set.  <br/><br/>Setting the `"imageAction"` configuration to any value other than `"none"` requires that a [skillset](create-skillset.md) also be attached to that indexer.
| `"allowSkillsetToReadFileData"` | Boolean<br/> true <br/>false (default) | Setting the `"allowSkillsetToReadFileData"` parameter to `true` will create a path `/document/file_data` that is an object representing the original file data downloaded from your blob data source.  This allows you to pass the original file data to a [custom skill](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-web-api) for processing within the enrichment pipeline, or to the [Document Extraction skill](https://docs.microsoft.com/azure/search/cognitive-search-skill-document-extraction). The object generated will be defined as follows: `{ "$type": "file", "data": "BASE64 encoded string of the file" }` <br/><br/> Setting the `"allowSkillsetToReadFileData"` parameter to `true` requires that a [skillset](create-skillset.md) be attached to that indexer, that the `"parsingMode"` parameter is set to `"default"`, `"text"` or `"json"`, and the `"dataToExtract"` parameter is set to `"contentAndMetadata"` or `"allMetadata"`. |
| `"pdfTextRotationAlgorithm"` | String<br/> `"none"` (default)<br/> `"detectAngles"` | Setting the `"pdfTextRotationAlgorithm"` parameter to `"detectAngles"` may help produce better and more readable text extraction from PDF files that have rotated text within them.  Note that there may be a small performance speed impact when this parameter is used. This parameter only applies to PDF files, and only to PDFs with embedded text. If the rotated text appears within an embedded image in the PDF, this parameter does not apply.<br/><br/> Setting the `"pdfTextRotationAlgorithm"` parameter to `"detectAngles"` requires that the `"parsingMode"` parameter is set to `"default"`. |


#### Other configuration parameters

The following parameters are specific to Azure SQL Database.

| Parameter | Type and allowed values	| Usage       |
|-----------|---------------------------|-------------|
|`"queryTimeout"` | String<br/>"hh:mm:ss"<br/>"00:05:00"   | For [Azure SQL Database](https://docs.microsoft.com/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers), set this parameter to increase the timeout beyond the 5-minute default.|

<a name="field-mappings"></a>

### "fieldMappings"

Indexer definitions contain field associations for mapping a source field to a destination field in an Azure Cognitive Search index. There are two types of associations depending on whether the content transfer follows a direct or enriched path:

+ **fieldMappings** are optional, applied when source-destination field names do not match, or when you want to specify a function.
+ **outputFieldMappings** are required if you are building [an enrichment pipeline](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro). In an enrichment pipeline, the output field is a construct defined during the enrichment process. For example, the output field might be a compound structure built during enrichment from two separate fields in the source document. 

In the following example, consider a source table with a field `_id`. Azure Cognitive Search doesn't allow a field name starting with an underscore, so the field must be renamed. This can be done using the `fieldMappings` property of the indexer as follows:

```json
"fieldMappings" : [ { "sourceFieldName" : "_id", "targetFieldName" : "id" } ]
```

You can specify multiple field mappings:

```json
"fieldMappings" : [
    { "sourceFieldName" : "_id", "targetFieldName" : "id" },
    { "sourceFieldName" : "_timestamp", "targetFieldName" : "timestamp" }
]
```

Both source and target field names are case-insensitive.

To learn about scenarios where field mappings are useful, see [Search Indexer Field Mappings](https://docs.microsoft.com/azure/search/search-indexer-field-mappings).

<a name="output-fieldmappings"></a>

### "outputFieldMappings"

In [AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro) scenarios in which a skillset is bound to an indexer, you must add `outputFieldMappings` to associate any output of an enrichment step that provides content to a searchable field in the index.

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

<a name="FieldMappingFunctions"></a>

### Field mapping functions

Field mappings can also be used to transform source field values using *field mapping functions*. For example, an arbitrary string value can be base64-encoded so it can be used to populate a document key field.

To learn more about when and how to use field mapping functions, see [Field Mapping Functions](https://docs.microsoft.com/azure/search/search-indexer-field-mappings#field-mapping-functions).

## Response  
 201 Created for a successful request.  

## Examples  
 The first example creates an indexer that copies data from the table referenced by the `ordersds` data source to the `orders` index on a schedule that starts on Jan 1, 2015 UTC and runs hourly. Each indexer invocation will be successful if no more than 5 items fail to be indexed in each batch, and no more than 10 items fail to be indexed in total.  

```json
{
    "name" : "myindexer",  
    "description" : "a cool indexer",  
    "dataSourceName" : "ordersds",  
    "targetIndexName" : "orders",  
    "schedule" : { "interval" : "PT1H", "startTime" : "2018-01-01T00:00:00Z" },  
    "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5 }  
}
```

The second example demonstrates an AI enrichment, indicated by the reference to a skillset and [outputFieldMappings](#output-fieldmappings). [Skillsets](create-skillset.md) are high-level resources, defined separately. 

New in this preview, you can specify the [cache property](#cache) to reuse documents that are unaffected by changes in your skillset definition.

```json
{
  "name":"demoindexer",	
  "dataSourceName" : "demodata",
  "targetIndexName" : "demoindex",
  "skillsetName" : "demoskillset",
  "cache" : 
    {
      "storageConnectionString" : "<YOUR-STORAGE-ACCOUNT-CONNECTION-STRING>",
      "enableReprocessing": true
    },
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

## See also

+ [Indexer overview](https://docs.microsoft.com/azure/search/search-indexer-overview)
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
