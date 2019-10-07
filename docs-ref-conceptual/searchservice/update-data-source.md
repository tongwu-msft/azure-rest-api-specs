---
title: "Update Data Source (Azure Cognitive Search REST API)"
description: Modify data source connection information used by Azure Cognitive Search indexers when crawling external data sources for searchable content.
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
# Update Data Source (Azure Cognitive Search REST API)
  You can update an existing data source using an HTTP PUT request. You specify the name of the data source to update on the request URI:  

```  
PUT https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The request body syntax is the same as for [Create Data Source &#40;Azure Cognitive Search REST API&#41;](create-data-source.md).  

## Response  
 For a successful request: 201 Created if a new data source was created, and 204 No Content if an existing data source was updated  

> [!NOTE]  
>  Some properties cannot be updated on an existing data source. For example, you cannot change the type of an existing data source.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
