---
title: "Delete Index (Azure Cognitive Search REST API)"
description: Permanently delete an index definition and all content from an Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Delete Index (Azure Cognitive Search REST API)

The **Delete Index** operation permanently removes an index and its contents from your Azure Cognitive Search service. This operation is final, with no recovery option. Make sure you have a master copy of your index definition code, data ingestion code, and a backup of the external data source in case a rebuild is required.
  
```http  
DELETE https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

If you attempt to delete an index that is currently mapped to an [alias](preview-api/alias-operations.md), the operation will fail with 400 (Bad Request) and an error message stating that the alias(es) that's mapped to that index must be deleted or mapped to a different index before the index can be deleted.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to delete.   |
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
 Status Code: 204 No Content  is returned for a successful response.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes](http-status-codes.md)   
+ [Create Index](create-index.md)   
