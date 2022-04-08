---
title: "Get Index (Azure Cognitive Search REST API)"
description: Return an index definition in JSON, but not its contents, from an Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Get Index (Azure Cognitive Search REST API)
The **Get Index** operation gets the index definition from Azure Cognitive Search.  

```http  
GET https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]   
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to return.   |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests for an object definition must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  


## Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response. See the example request JSON in [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md) for an example of the response payload. The Get Index response body and the Create Index response and response bodies are all of the same format.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
