---
title: "Reset Indexer (Azure Cognitive Search REST API)"
description: Rebuild an index created by an Azure Cognitive Search indexer.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---
# Reset Indexer (Azure Cognitive Search REST API)

The **Reset Indexer** operation resets the change tracking state of indexed documents so that you can rebuild the index from scratch on the next run. A reset might be required if the data source schema has changed, or if you are modifying the change detection policy. For information about change tracking state, see [Create Data Source](create-data-source.md).  

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/reset?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to reset. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Reset requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.| 

## Request Body  
 None. 


## Response  
 Status Code: 204 No Content for a successful response.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
+ [Indexer operations](indexer-operations.md)   
+ [Naming rules](naming-rules.md)   
