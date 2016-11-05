---
title: "Reset Indexer (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to: 
  - "Azure"
ms.assetid: e36fa72a-a924-4e19-b7da-cd8f132c8963
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
# Reset Indexer (Azure Search Service REST API)
  The **Reset Indexer** operation resets the change tracking state associated with the indexer. This allows you to trigger from-scratch re-indexing (for example, if your data source schema has changed), or to change the data change detection policy for a data source associated with the indexer. See [Create Indexer &#40;Azure Search Service REST API&#41;](../SearchServiceREST/create-indexer.md) for information about change tracking state.  
  
```  
    POST https://[service name].search.windows.net/indexers/[indexer name]/reset?api-version=[api-version]  
    api-key: [admin key]  
```  
  
 The **api-version** is required. The current version is `2015-02-28`. [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md) has details, including more information about alternative versions.  
  
 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](../SearchServiceREST/service-rest.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  
  
## Response  
 Status Code: 204 No Content for a successful response.  
  
## See Also  
 [Azure Search Service REST](../SearchServiceREST/service-rest.md)   
 [HTTP status codes &#40;Azure Search&#41;](../SearchServiceREST/http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](../SearchServiceREST/indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](../SearchServiceREST/naming-rules.md)   
 [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md)   
 [Limits and constraints (Azure Search)](http://msdn.microsoft.com/en-us/a8b1e21e-7703-4718-8e29-c8825354b3ec)  
  
  