---
title: "Update Indexer (Azure Search Service REST API)"
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
ms.assetid: a4f55a3f-cf85-4fdb-822c-759310ca0bf1
caps.latest.revision: 9
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
# Update Indexer (Azure Search Service REST API)
  You can update an existing indexer using an HTTP PUT request. You specify the name of the indexer to update on the request URI:  
  
```  
    PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  
  
 The **api-version** is required. The current version is `2015-02-28`. [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md) has details, including more information about alternative versions.  
  
 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](../SearchServiceREST/service-rest.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  
  
## Request  
 The request body syntax is the same as for [Create Indexer &#40;Azure Search Service REST API&#41;](../SearchServiceREST/create-indexer.md).  
  
## Response  
 For a successful request: 201 Created if a new indexer was created, and 204 No Content if an existing indexer was updated.  
  
## See Also  
 [Azure Search Service REST](../SearchServiceREST/service-rest.md)   
 [HTTP status codes &#40;Azure Search&#41;](../SearchServiceREST/http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](../SearchServiceREST/indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](../SearchServiceREST/naming-rules.md)  
  
  