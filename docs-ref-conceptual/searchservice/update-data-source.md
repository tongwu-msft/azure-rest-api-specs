---
title: "Update Data Source (Azure Search Service REST API) | Microsoft Docs"
description: Modify data source connection information used by Azure Search indexers when crawling external data sources for searchable content.
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
# Update Data Source (Azure Search Service REST API)
  You can update an existing data source using an HTTP PUT request. You specify the name of the data source to update on the request URI:  

```  
PUT https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The request body syntax is the same as for [Create Data Source &#40;Azure Search Service REST API&#41;](create-data-source.md).  

## Response  
 For a successful request: 201 Created if a new data source was created, and 204 No Content if an existing data source was updated  

> [!NOTE]  
>  Some properties cannot be updated on an existing data source. For example, you cannot change the type of an existing data source.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
