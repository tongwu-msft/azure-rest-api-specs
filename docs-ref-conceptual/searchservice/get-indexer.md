---
title: "Get Indexer (Azure Search Service REST API) | Microsoft Docs"
description: Returns an indexer definition from an Azure Search service.
ms.date: "05/02/2019"
services: search
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
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
# Get Indexer (Azure Search Service REST API)
The **Get Indexer** operation gets the indexer definition from Azure Search.  

## Request  
HTTPS is required for all services requests. The **Get Indexer** request can be constructed using the GET method.  

```  
GET https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    api-key: [admin key]  
```  

The `[indexer name]` in the request URI specifies which indexer definition to return from the indexers collection.  

The `[api-version]` is required. The current version is `2019-05-06`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

### Request Headers
The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Indexer** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Search services](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.   

### Request Body  
 None. 

## Response  
 Status Code: 200 OK is returned for a successful response. The response is similar to examples in [Create Indexer &#40;Azure Search Service REST API&#41;](create-indexer.md):  

```  
{  
        "name" : "myindexer",  
        "description" : "a cool indexer",  
        "dataSourceName" : "ordersds",  
        "targetIndexName" : "orders",  
        "schedule" : { "interval" : "PT1H", "startTime" : "2015-01-01T00:00:00Z" },  
        "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5, "base64EncodeKeys": false }  
    }  
```  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions)  
