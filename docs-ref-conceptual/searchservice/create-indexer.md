---
title: "Create Indexer (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2017-04-27"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: f9224fad-842f-46a4-86da-87b6a6736725
caps.latest.revision: 13
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Create Indexer (Azure Search Service REST API)
  You can create a new indexer within an Azure Search service using an HTTP POST request.  

```  
POST https://[service name].search.windows.net/indexers?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 Alternatively, you can use PUT and specify the data source name on the URI. If the data source does not exist, it will be created.  

```  
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
```  

> [!NOTE]  
>  The maximum number of indexers allowed varies by pricing tier. The free service allows up to 3 indexers. Standard service allows 50 indexers. See [Service Limits](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/) for details.  

 The **api-version** is required. The current version is `2016-09-01`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The body of the request contains an indexer definition, which specifies the data source and the target index for indexing, as well as optional indexing schedule and parameters.  

 The syntax for structuring the request payload is as follows. A sample request is provided further on in this topic.  

```  
    {   
        "name" : "Required for POST, optional for PUT. The name of the indexer",  
        "description" : "Optional. Anything you want, or null",  
        "dataSourceName" : "Required. The name of an existing data source",  
        "targetIndexName" : "Required. The name of an existing index",  
        "schedule" : { Optional. See Indexing Schedule below. },  
        "parameters" : { Optional. See Indexing Parameters below. },  
        "fieldMappings" : { Optional. See Field Mappings below. },
        "disabled" : Optional boolean value indicating whether the indexer is disabled. False by default.
    }  
```  

### Indexer schedule  
 An indexer can optionally specify a schedule. If a schedule is present, the indexer will run periodically as per schedule. The scheduler is built-in; you cannot use an external scheduler. **Schedule** has the following attributes:  

-   **interval**: Required. A duration value that specifies an interval or period for indexer runs. The smallest allowed interval is 5 minutes; the longest is one day. It must be formatted as an XSD "dayTimeDuration" value (a restricted subset of an [ISO 8601 duration](http://www.w3.org/TR/xmlschema11-2/#dayTimeDuration) value). The pattern for this is: `"P[nD][T[nH][nM]]".` Examples:  `PT15M` for every 15 minutes, `PT2H` for every 2 hours.  

-   **startTime**: Required. A UTC datetime when the indexer should start running.  

### Indexer parameters  
 An indexer can optionally specify several parameters that affect its behavior. All of the parameters are optional.  

-   **maxFailedItems**: The number of items that can fail to be indexed before an indexer run is considered a failure. Default is 0. Information about failed items is returned by the [Get Indexer Status &#40;Azure Search Service REST API&#41;](get-indexer-status.md) operation.  

-   **maxFailedItemsPerBatch**: The number of items that can fail to be indexed in each batch before an indexer run is considered a failure. Default is 0.  

-   **batchSize:** Specifies the number of items that are read from the data source and indexed as a single batch in order to improve performance. The default depends on the data source type: it is 1000 for Azure SQL and DocumentDB, and 10 for Azure Blob Storage.

**Field Mappings**

You can use field mappings to map a field name in the data source to a different field name in the target index. For example, consider a source table with a field `_id`. Azure Search doesn't allow a field name starting with an underscore, so the field must be renamed. This can be done using the `fieldMappings` property of the indexer as follows:

	"fieldMappings" : [ { "sourceFieldName" : "_id", "targetFieldName" : "id" } ]

You can specify multiple field mappings:

	"fieldMappings" : [
		{ "sourceFieldName" : "_id", "targetFieldName" : "id" },
        { "sourceFieldName" : "_timestamp", "targetFieldName" : "timestamp" },
	 ]

Both source and target field names are case-insensitive.

To learn about scenarios where field mappings are useful, see [Search Indexer Field Mappings](https://docs.microsoft.com/azure/search/search-indexer-field-mappings).

<a name="FieldMappingFunctions"></a>
***Field Mapping Functions***

Field mappings can also be used to transform source field values using *field mapping functions*. For example, an arbitrary string value can be base64-encoded so it can be used to populate a document key field.

To learn more about when and how to use field mapping functions, see [Field Mapping Functions](https://docs.microsoft.com/azure/search/search-indexer-field-mappings#field-mapping-functions).

### Request body examples  
 The following example creates an indexer that copies data from the table referenced by the `ordersds` data source to the `orders` index on a schedule that starts on Jan 1, 2015 UTC and runs hourly. Each indexer invocation will be successful if no more than 5 items fail to be indexed in each batch, and no more than 10 items fail to be indexed in total.  

```  
    {  
        "name" : "myindexer",  
        "description" : "a cool indexer",  
        "dataSourceName" : "ordersds",  
        "targetIndexName" : "orders",  
        "schedule" : { "interval" : "PT1H", "startTime" : "2015-01-01T00:00:00Z" },  
        "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5 }  
    }  
```  

## Response  
 201 Created for a successful request.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
