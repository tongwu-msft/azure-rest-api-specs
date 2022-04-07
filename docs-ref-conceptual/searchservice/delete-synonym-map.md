---
title: "Delete Synonym Map (Azure Cognitive Search REST API)"
description: "A synonym map can be deleted using REST API in Azure Cognitive Search."
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Delete Synonym Map (Azure Cognitive Search REST API)

The **Delete Synonym Map** operation removes a synonym map from your Azure Cognitive Search service.  

```http 
DELETE https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

If you delete a synonym map that is referenced on a field in an index, the delete operation will proceed but searches against the fields will fail with 400 (Bad Request) and an error message stating that the synonym map has been deleted.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| synonym map name  | Required. The request URI specifies the name of the synonym map to delete.   |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Delete requests must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body  
 None.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
+ [Synonym map operations](synonym-map-operations.md)   
+ [Naming rules](naming-rules.md)  
