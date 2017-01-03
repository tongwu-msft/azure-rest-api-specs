---
title: "Update Data Source (Azure Search Service REST API)"
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
ms.assetid: f756cd01-c266-4fd2-a7d0-ba05d49b439a
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
# Update Data Source (Azure Search Service REST API)
  You can update an existing data source using an HTTP PUT request. You specify the name of the data source to update on the request URI:  

```  
PUT https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2016-09-01`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The request body syntax is the same as for [Create Data Source &#40;Azure Search Service REST API&#41;](create-data-source.md).  

## Response  
 For a successful request: 201 Created if a new data source was created, and 204 No Content if an existing data source was updated  

> [!NOTE]  
>  Some properties cannot be updated on an existing data source. For example, you cannot change the type of an existing data source.  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
