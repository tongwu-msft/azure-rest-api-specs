---
title: Update Data Source (Azure Cognitive Search REST API)
description: Modify data source connection information used by Azure Cognitive Search indexers when crawling external data sources for searchable content.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---
# Update Data Source (Azure Cognitive Search REST API)

Overwrites an existing data source definition with a revised version.

```http
PUT https://[service name].search.windows.net/datasources/[data source name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| data source name  | Required. The request URI specifies the name of the data source to update.   |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. |


## Request Headers 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|   

## Request Body
The request body syntax is the same as for [Create Data Source](create-data-source.md).  

When updating an existing data source, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the data source definition with a GET, modify it, and then update it with PUT.  

## Response  
 For a successful request: 201 Created if a new data source was created, and 204 No Content if an existing data source was updated  

> [!NOTE]  
>  Some properties cannot be updated on an existing data source. For example, you cannot change the type of an existing data source.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
+ [Indexer operations](indexer-operations.md)   
+ [Naming rules](naming-rules.md)  
