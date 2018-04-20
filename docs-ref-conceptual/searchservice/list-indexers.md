---
title: "List Indexers (Azure Search Service REST API)| Microsoft Docs"
description: Return a list of Azure Search indexers used for crawling external data for searchable content.
ms.date: "2018-04-20"
ms.prod: "azure"
ms.service: "search"
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
# List Indexers (Azure Search Service REST API)
  The **List Indexers** operation returns the list of indexers in your Azure Search service.  

```  
    GET https://[service name].search.windows.net/indexers?api-version=[api-version]  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

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

## See also  

+ [Azure Search Service REST](index.md)   
+ [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
+ [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
+ [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
+ [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
