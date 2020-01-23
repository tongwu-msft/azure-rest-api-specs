---
title: "Update Indexer (Azure Cognitive Search REST API)"
description: Modify an Azure Cognitive Search indexer used for crawling external data sources for searchable content.
ms.date: "05/02/2019"

ms.service: cognitive-search
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
# Update Indexer (Azure Cognitive Search REST API)
  You can update an existing indexer definition using an HTTP PUT request. Specify the name of the indexer to update on the request URI:  

```http
    PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  
 Updating an indexer definition does not automatically run it, but depending on your modifications and the associated a data source, a reset and rerun might be required.

 The **api-version** is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The request body syntax is the same as for [Create Indexer &#40;Azure Cognitive Search REST API&#41;](create-indexer.md).  

## Response  
 For a successful request: 201 Created if a new indexer was created, and 204 No Content if an existing indexer was updated.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
