---
title: "Delete Indexer (Azure Search Service REST API)"
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
ms.assetid: f057afe7-ab60-4c04-b08f-cbe57212c21d
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
# Delete Indexer (Azure Search Service REST API)
  The **Delete Indexer** operation removes an indexer from your Azure Search service.  

```  
DELETE https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    api-key: [admin key]  
```  

 When an indexer is deleted, the indexer executions in progress at that time will run to completion, but no further executions will be scheduled. Attempts to use a non-existent indexer will result in HTTP status code 404 Not Found.  

 The **api-version** is required. The current version is `2015-02-28`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)  
