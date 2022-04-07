---
title: "Delete Data Source (Azure Cognitive Search REST API)"
description: Delete data source connection information used by an Azure Cognitive Search indexer.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---
# Delete Data Source (Azure Cognitive Search REST API)

The **Delete Data Source** operation removes a data source from your Azure Cognitive Search service.  

```http
DELETE https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]   
```  

If any indexers reference the data source that you're deleting, the delete operation will still proceed. However, those indexers will transition into an error state upon their next run.  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| datasource name  | Required. The request URI specifies the name of the data source to delete.   |
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
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
