---
title: "Count Documents (Azure Cognitive Search REST API)"
description: Return a count of total number of documents in an Azure Cognitive Search index.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Count Documents (Azure Cognitive Search REST API)
  The **Count Documents** operation retrieves a count of the number of documents in a search index. The `$count` syntax is part of the OData protocol.  

```http  
GET https://[service name].search.windows.net/indexes/[index name]/docs/$count?api-version=[api-version]  
  Content-Type: application/json   
  api-key: [admin or query key]    
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The `[index name]` in the request URI tells the service to return a count of all items in the docs collection of the specified index.    |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|


## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Count Documents** request can specify either an admin key or query key for the `api-key`.| 

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](/azure/search/search-security-api-keys#find-existing-keys).

## Request Body  
 None.  

## Response  
 Status Code: 200 OK is returned for a successful response.  

 The response body contains the count value as an integer formatted in plain text.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes](http-status-codes.md)   
 [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax)   
 [Search results page](/azure/search/search-pagination-page-layout)