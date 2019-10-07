---
title: "Reset Indexer (Azure Cognitive Search REST API)"
description: Rebuild an index created by an Azure Cognitive Search indexer.
ms.date: "05/02/2019"
ms.service: search

ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
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
# Reset Indexer (Azure Cognitive Search REST API)
  The **Reset Indexer** operation resets the change tracking state associated with the indexer. This allows you to trigger from-scratch re-indexing (for example, if your data source schema has changed), or to change the data change detection policy for a data source associated with the indexer. See [Create Indexer &#40;Azure Cognitive Search REST API&#41;](create-indexer.md) for information about change tracking state.  

```  
    POST https://[service name].search.windows.net/indexers/[indexer name]/reset?api-version=[api-version]  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content for a successful response.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
+ [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
+ [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
