---
title: "List Indexers (Azure Search Service REST API)"
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
ms.assetid: 5f114b0f-80f2-43bb-9bdd-3c7550fa9808
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
# List Indexers (Azure Search Service REST API)
  The **List Indexers** operation returns the list of indexers in your Azure Search service.  

```  
    GET https://[service name].search.windows.net/indexers?api-version=[api-version]  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2015-02-28`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 For a successful request: 200 OK. Here is an example response body:  

```  
{  
      "value" : [  
      {  
        "name" : "myindexer",  
        "description" : "a cool indexer",  
        "dataSourceName" : "ordersds",  
        "targetIndexName" : "orders",  
        ... other indexer properties  
      }]  
    }  
```  

 Note that you can filter the response down to just the properties you're interested in. For example, if you want only a list of indexer names, use the OData **$select** query option:  

```  
GET /indexers?api-version=2014-10-20-Preview&$select=name  
```  

 In this case, the response from the above example would appear as follows:  

```  
{  
      "value" : [ { "name": "myindexer" } ]  
    }  
```  

 This is a useful technique to save bandwidth if you have a lot of indexers in your Search service.  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
   
