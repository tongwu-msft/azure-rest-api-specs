---
title: List Aliases (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: A list of aliases can be retrieved using REST API in Azure Cognitive Search
ms.date: 03/01/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: dereklegenzoff
ms.author: delegenz
ms.manager: nitinme
---
# List Aliases (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> The entire API is a preview feature.

The **List Aliases** operation returns a list of the aliases in your Azure Cognitive Search service.  

```http
GET https://[service name].search.windows.net/aliases?api-version=[api-version]      
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
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
For a successful request: 200 OK. Here is an example response body:  

```json
    {  
      "value" : [  
        {  
          "name": "my-alias",  
          "indexes": [
                "my-index"
            ]
        }]  
    }  
```  

You can filter the response down to just the properties you're interested in. For example, if you want only a list of alias names, use the OData **select** query option:  

```http
GET https://[service name].search.windows.net/aliases?api-version=[api-version]&$select=name
api-key: [admin key]  
```  

 In this case, the response from the above example would appear as follows:  

```json  
    {  
      "value" : [ { "name": "my-alias" }, ... ]  
    }  
```

## See also  

+ [Create an index alias in Azure Cognitive Search](/azure/search/search-how-to-alias)   