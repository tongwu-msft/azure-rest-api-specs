---
title: "Update Indexer (Azure Search Service REST API) | Microsoft Docs"
description: Modify an Azure Search indexer used for crawling external data sources for searchable content.
ms.date: "2016-11-09"
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
# Update Indexer (Azure Search Service REST API)
  You can update an existing indexer using an HTTP PUT request. You specify the name of the indexer to update on the request URI:  

```  
    PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The request body syntax is the same as for [Create Indexer &#40;Azure Search Service REST API&#41;](create-indexer.md).  

## Response  
 For a successful request: 201 Created if a new indexer was created, and 204 No Content if an existing indexer was updated.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
