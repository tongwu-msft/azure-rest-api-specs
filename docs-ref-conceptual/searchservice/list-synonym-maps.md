---
title: "List Synonym Maps (Azure Cognitive Search REST API)"
description: "A list of synonym maps can be retrieved using REST API in Azure Cognitive Search."
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# List Synonym Maps (Azure Cognitive Search REST API)

The **List Synonym Maps** operation returns a list of the synonym maps in your Azure Cognitive Search service.  

```http
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests about objects in your service must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

None.

## Response

For a successful request: 200 OK. Here is an example response body:  

```json
    {  
      "value" : [  
        {  
          "name": "synonymmap1",  
          "format": "solr",  
          ... other synonym map properties  
        }]  
    }  
```  

 You can filter the response down to just the properties you're interested in. For example, if you want only a list of synonym map names, use the OData **select** query option:  

```http
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]&$select=name
api-key: [admin key]  
```  

 In this case, the response from the above example would appear as follows:  

```json  
    {  
      "value" : [ { "name": "synonymmap1" }, ... ]  
    }  
```

> [!NOTE]
> If a synonym map has an [encryption key](/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve encrypted properties in that synonym map's definition. Without access to the encryption key, an `"<encrypted>"` placeholder is returned in place of the encrypted properties. Restoring access to the key allows the search service to retrieve the complete synonym map definition again.

## See also

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
+ [Synonym map operations](synonym-map-operations.md)   
+ [Naming rules](naming-rules.md)   
+ [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax)   
+ [Support for OData](support-for-odata.md)  
