---
title: "Run Indexer (Azure Search Service REST API)  | Microsoft Docs"
description: Trigger Azure Search indexing when using an indexer to crawl external data for searchable content.
ms.date: "04/20/2018"
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
# Run Indexer (Azure Search Service REST API)
  In addition to running periodically on a schedule, an indexer can also be invoked on demand via the **Run Indexer** operation:  

```  
POST https://[service name].search.windows.net/indexers/[indexer name]/run?api-version=[api-version]  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 202 Accepted is returned for a successful response.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
