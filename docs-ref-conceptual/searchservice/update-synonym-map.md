---
title: Update Synonym Map (Azure Cognitive Search REST API)
description: "A synonym map to expand or rewrite a search query can be updated using REST API in Azure Cognitive Search."
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Update synonym map (Azure Cognitive Search REST API)

Overwrites an existing synonym map definition with a revised version.

```http
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| synonym map name  | Required. The request URI specifies the name of the synonym map to update. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. |

## Request Headers 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body
 The request body syntax is the same as for [Create Synonym Map](create-synonym-map.md).  

 When updating an existing synonym map, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the definition with a GET, modify it, and then update it with PUT.  

## Response  
 For a successful request, "201 Created" if a new synonym map was created, and "204 No Content" if an existing synonym map was updated  

 By default the response body will be empty. However, if the `Prefer` request header is set to `return=representation`, the response body will contain the JSON for the synonym map that was updated or created. In this case, the success status code will be "201 Created" if a new synonym map was created and "200 OK" if an existing synonym map was updated.    

## See also

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
+ [Synonym map operations](synonym-map-operations.md)   
+ [Naming rules](naming-rules.md)  
