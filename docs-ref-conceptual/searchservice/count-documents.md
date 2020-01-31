---
title: "Count Documents (Azure Cognitive Search REST API)"
description: Return a count of total number of documents in an Azure Cognitive Search index.
ms.date: 01/30/2020
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
# Count Documents (Azure Cognitive Search REST API)
  The **Count Documents** operation retrieves a count of the number of documents in a search index. The `$count` syntax is part of the OData protocol.  

```http  
GET https://[service name].search.windows.net/indexes/[index name]/docs/$count?api-version=[api-version]  
Accept: text/plain   
api-key: [admin or query key] 
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| servicename | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The `[index name]` in the request URI tells the service to return a count of all items in the docs collection of the specified index.    |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|


## Request Header 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Count Documents** request can specify either an admin key or query key for the `api-key`.| 

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).

## Request Body  
 None.  

## Response  
 Status Code: 200 OK is returned for a successful response.  

 The response body contains the count value as an integer formatted in plain text.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)  
 [Search results page](https://docs.microsoft.com/azure/search/search-pagination-page-layout)