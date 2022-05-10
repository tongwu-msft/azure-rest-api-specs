---
title: Get Alias (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: The content of an alias can be retrieved using REST API in Azure Cognitive Search
ms.date: 03/01/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: dereklegenzoff
ms.author: delegenz
ms.manager: nitinme
---
# Get Alias (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> The entire API is a preview feature.

The **Get Alias** operation gets the alias definition from Azure Cognitive Search.  

```http
GET https://[service name].search.windows.net/aliases/[alias name]?api-version=[api-version]      
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| alias name  | Required. The request URI specifies the name of the alias to update. |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

None.


## Response
Status Code: 200 OK is returned for a successful response.  

The response body will look similar to the example below.

```json
{   
  "name" : "my-alias",  
  "indexes" : ["my-index"]
}  
```  

## See also  

+ [Create an index alias in Azure Cognitive Search](/azure/search/search-how-to-alias)   