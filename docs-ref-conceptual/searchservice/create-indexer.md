---
title: Create Indexer (Azure Cognitive Search REST API-version=2019-05-06)
description: In the preview API, indexers are extended to include outputFieldMapping parameters used to map enrichment output to a field in an Azure Cognitive Search index.
manager: pablocas
author: luiscabrer
ms.author: luisca
ms.date: "05/02/2019"
ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
---
# Create Indexer (Azure Cognitive Search REST API)

An [indexer](https://docs.microsoft.com/azure/search/search-indexer-overview) crawls an external data source, extracts information, serializes it as JSON documents, and stores the text in an [Azure Cognitive Search index](https://docs.microsoft.com/azure/search/search-what-is-an-index). Indexers are specific to Azure data storage, such as an Azure blob container or a SQL Database table or view. 

This API reference covers generally available and preview-only functionality. A few parameters are used exclusively for [AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro), which is an optional capability of indexer processing.

Creating an indexer expresses it in your Azure Cognitive Search service. You can create a new indexer using an HTTP POST or PUT request. 

```http
POST https://[service name].search.windows.net/indexers?api-version=2019-05-06
    Content-Type: application/json  
    api-key: [admin key]  
```  
The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Security in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-security-overview) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://docs.microsoft.com/azure/search/search-create-service-portal) explains how to get the service URL and key properties used in the request.

Alternatively, you can use PUT and specify the indexer name on the URI. If the indexer does not exist, it will be created.  

```http
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
```  
The **api-version** is required. The current generally available version is `api-version=2019-05-06`.  See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.

For data-platform-specific guidance on creating indexers, start with [Indexers overview](https://docs.microsoft.com/azure/search/search-indexer-overview), which includes the complete list of [related articles](https://docs.microsoft.com/azure/search/search-indexer-overview#next-steps).

> [!NOTE]  
>  The maximum number of indexers allowed varies by pricing tier. The free service allows up to 3 indexers. Standard service allows 50 indexers. Standard High Definition services do not support indexers at all. See [Service Limits](https://docs.microsoft.com/azure/search/search-limits-quotas-capacity) for details.    

## Request  

A [data source](create-data-source.md), [index](create-index.md), and [skillset](create-skillset.md) are part of an [indexer](https://docs.microsoft.com/azure/search/search-indexer-overview) definition, but each is an independent component that can be used in different combinations. For example, you could use the same data source with multiple indexers, or the same index with multiple indexers, or multiple indexers writing to a single index.

 The body of the request contains an indexer definition, with the following parts.

+ [dataSourceName](#dataSourceName)
+ [targetIndexName](#targetIndexName)
+ [skillsetName](#skillset)
+ [schedule](#indexer-schedule)
+ [parameters](#indexer-parameters)
+ [fieldMappings](#field-mappings)
+ [outputFieldMappings](#output-fieldmappings)

## Request syntax

Syntax for structuring the request payload is as follows. A sample request is provided later in this article.  

```json
{   
    "name" : "Required for POST, optional for PUT. The name of the indexer",  
    "description" : "Optional. Anything you want, or null",  
    "dataSourceName" : "Required. The name of an existing data source",  
    "targetIndexName" : "Required. The name of an existing index",  
    "skillsetName" : "Required for AI enrichment",
    "schedule" : { Optional, but immediately runs once if unspecified. See Indexing Schedule below. },  
    "parameters" : { Optional. See Indexing Parameters below. },  
    "fieldMappings" : { Optional. See fieldMappings below. },
    "outputFieldMappings" : { Required for enrichment pipelines. See outputFieldMappings below. },
    "disabled" : Optional boolean value indicating whether the indexer is disabled. False by default.
}  
```
<a name="dataSourceName"></a>

### "dataSourceName"

A [data source definition](create-data-source.md) often includes properties that an indexer can use to exploit source platform characteristics. As such, the data source you pass to the indexer determines the availability of certain properties and parameters, such content type filtering in Azure blobs or query timeout for Azure SQL Database. 

<a name="targetIndexName"></a>

### "targetIndexName"

An [index schema](create-index.md) defines the fields collection containing searchable, filterable, retrievable, and other attributions that determine how the field is used. During indexing, the indexer crawls the data source, optionally cracks documents and extracts information, serializes the results to JSON, and indexes the payload based on the schema defined for your index.

<a name="skillset"></a>

### "skillsetName"

[AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro) refers to natural language and image processing capabilities in Azure Cognitive Search, applied during data ingestion to extract entities, key phrases, language, information from images, and so forth. Transformations applied to content are through *skills*, which you combine into a single [*skillset*](create-skillset.md), one per indexer. As with data sources and indexes, a skillset is an independent component that you attach to an indexer. You can repurpose a skillset with other indexers, but each indexer can only use one skillset at a time.
 
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
| `"delimitedTextHeaders"` | String<br/>comma-delimited list<br/>user-defined| For [CSV blobs (preview)](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), specifies a comma-delimited list of column headers, useful for mapping source fields to destination fields in an index. |
| `"delimitedTextDelimiter"` | String<br/>single character<br/>user-defined | For [CSV blobs (preview)](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), specifies the end-of-line delimiter for CSV files where each line starts a new document (for example, `"|"`).  |
| `"firstLineContainsHeaders"` | Boolean<br/> true (default) <br/>false | For [CSV blobs (preview)](https://docs.microsoft.com/azure/search/search-howto-index-csv-blobs), indicates that the first (non-blank) line of each blob contains headers.|
| `"documentRoot"` | String<br/>user-defined path | For [JSON arrays](https://docs.microsoft.com/azure/search/search-howto-index-json-blobs#nested-json-arrays), given a structured or semi-structured document, you can specify a path to the array using this property. |
| `"dataToExtract"` | String<br/> `"storageMetadata"` <br/>`"allMetadata"` <br/> `"contentAndMetadata"` (default) | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage):<br/>Set to `"storageMetadata"` to index just the [standard blob properties and user-specified metadata](https://docs.microsoft.com/azure/storage/blobs/storage-properties-metadata). <br/>Set to `"allMetadata"` to extract metadata provided by the Azure blob storage subsystem and the [content-type specific metadata](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage#ContentSpecificMetadata) (for example, metadata unique to just .png files) are indexed. <br/>Set to `"contentAndMetadata"` to extract all metadata and textual content from each blob. <br/><br/>For [image-analysis in AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-image-scenarios), when `"imageAction"` is set to a value other than `"none"`, the `"dataToExtract"` setting tells the indexer which data to extract from image content. Applies to embedded image content in a .PDF or other application, or image files such as .jpg and .png, in Azure blobs.  |
| `"imageAction"` | String<br/> `"none"`<br/> `"generateNormalizedImages"`<br/> `"generateNormalizedImagePerPage"` | For [Azure blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage), set to`"none"` to ignore embedded images or image files in the data set. This is the default. <br/><br/>For [image-analysis in AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-image-scenarios), set to`"generateNormalizedImages"`  to extract text from images (for example, the word "stop" from a traffic Stop sign), and embed it as part of the content field. During image analysis, the indexer creates an array of normalized images as part of document cracking, and embeds the generated information into the content field. This action requires that `"dataToExtract"` is set to `"contentAndMetadata"`. A normalized image refers to additional processing resulting in uniform image output, sized and rotated to promote consistent rendering when you include images in visual search results (for example, same-size photographs in a graph control as seen in the [JFK demo](https://github.com/Microsoft/AzureSearch_JFK_Files)). This information is generated for each image when you use this option.  <br/><br/>If you set to `"generateNormalizedImagePerPage"`, PDF files will be treated differently in that instead of extracting embedded images, each page will be rendered as an image and normalized accordingly.  Non-PDF file types will be treated the same as if `"generateNormalizedImages"` was set.  <br/><br/>Setting the `"imageAction"` configuration to any value other than `"none"` requires that a [skillset](create-skillset.md) also be attached to that indexer.
| `"allowSkillsetToReadFileData"` | Boolean<br/> true <br/>false (default) | Setting the `"allowSkillsetToReadFileData"` parameter to `true` will create a path `/document/file_data` that is an object representing the original file data downloaded from your blob data source.  This allows you to pass the original file data to a [custom skill](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-web-api) for processing within the enrichment pipeline, or to the [Document Extraction skill](https://docs.microsoft.com/azure/search/cognitive-search-skill-document-extraction). The object generated will be defined as follows: `{ "$type": "file", "data": "BASE64 encoded string of the file" }` <br/><br/> Setting the `"allowSkillsetToReadFileData"` parameter to `true` requires that a [skillset](create-skillset.md) be attached to that indexer, that the `"parsingMode"` parameter is set to `"default"`, `"text"` or `"json"`, and the `"dataToExtract"` parameter is set to `"contentAndMetadata"` or `"allMetadata"`. |


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

## Request examples  
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

The second example demonstrates an AI enrichment, indicated by the reference to a skillset and [outputFieldMappings](#output-fieldmappings). [Skillsets](create-skillset.md) are high-level resources, defined separately. This example is an abbreviation of the indexer definition in the [AI enrichment tutorial](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob).

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

## Response  
 201 Created for a successful request.  

## See also

+ [Indexer overview](https://docs.microsoft.com/azure/search/search-indexer-overview)
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
