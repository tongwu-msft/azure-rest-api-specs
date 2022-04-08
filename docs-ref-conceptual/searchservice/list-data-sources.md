---
title: "List Data Sources (Azure Cognitive Search REST API)"
description: Return a list of data source connection objects used by an Azure Cognitive Search indexer.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---
# List Data Sources (Azure Cognitive Search REST API)

The **List Data Sources** operation returns a list of the data sources in your Azure Cognitive Search service.  

```http
GET https://[service name].search.windows.net/datasources?api-version=[api-version]  
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
          "name": "datasource1",  
          "type": "azuresql",  
          ... other data source properties  
        }]  
    }  
```  

 You can filter the response down to just the properties you're interested in. For example, if you want only a list of data source names, use the OData **select** query option:  

```http
GET /datasources?api-version=2020-06-30&$select=name  
```  

 In this case, the response from the above example would appear as follows:  

```json
    {  
      "value" : [ { "name": "datasource1" }, ... ]  
    }  
```

> [!NOTE]
> If a data source has an [encryption key](/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve encrypted properties in that data source's definition. Without access to the encryption key, an `"<encrypted>"` placeholder is returned in place of the encrypted properties. Restoring access to the key allows the search service to retrieve the complete data source definition again.

## See also

+ [Azure Cognitive Search REST APIs](index.md)
+ [HTTP status codes](http-status-codes.md)
+ [Indexer operations](indexer-operations.md)
+ [Naming rules](naming-rules.md)
+ [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax)
+ [Support for OData](support-for-odata.md)  
