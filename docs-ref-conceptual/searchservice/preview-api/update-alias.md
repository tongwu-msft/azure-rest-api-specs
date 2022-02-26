---
title: "Update Alias (Azure Cognitive Search REST API)"
description: Update an alias to route requests to a new index
ms.date: 03/01/2022

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: dereklegenzoff
ms.author: delegenz
ms.manager: nitinme
---
# Update Alias (Azure Cognitive Search REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> The entire API is a preview feature. For more information, see [aliases]().

In Azure Cognitive Search, an alias is a secondary name that can be used to refer to an index for querying, indexing, and other operations. Updating an alias allows you to map that alias to a new search index. This is valuable for swapping indexes.

```http
PUT https://[service name].search.windows.net/aliases/[alias name]?api-version=[api-version]      
  Content-Type: application/json  
  api-key: [admin key]  
```  

> [!NOTE]
> An update to an alias may take up to 10 seconds to propogate through the system so you should wait at least 10 seconds before deleting the index that the alias was previously mapped to. 

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| alias name  | Required. The request URI specifies the name of the alias to update. |
| api-version | Required. The current stable version is `api-version=2021-04-30-preview`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body
The request body syntax is the same as for [Create Alias](create-alias.md).  

When updating an existing alias, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the definition with a GET, modify it, and then update it with PUT.  


## Response
For a successful request, "201 Created" if a new alias was created, and "204 No Content" if an existing alias was updated.

## See also  

+ [Aliases]()