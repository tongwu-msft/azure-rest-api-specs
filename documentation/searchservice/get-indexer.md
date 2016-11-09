---
title: "Get Indexer (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-11-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 071f6791-d8b7-42fe-9f49-9b012034cb3b
caps.latest.revision: 10
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
# Get Indexer (Azure Search Service REST API)
  The **Get Indexer** operation gets the indexer definition from Azure Search.  

```  
GET https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2015-02-28`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

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

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)  
