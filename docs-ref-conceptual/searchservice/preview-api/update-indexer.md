---
title: Update Indexer (api-version=2020-06-30-Preview)
description: Preview version of the Update Indexer REST API for Cognitive Search.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
---
# Update Indexer (Preview REST API)

**API Version: 2020-06-30-Preview**

> [!Important]
> This preview API adds support for the [cache property in Create Indexer](create-indexer.md) used for [incremental indexing](https://docs.microsoft.com/azure/search/cognitive-search-incremental-indexing-conceptual). If you are developing an indexer that has caching enabled, use the preview API to update the definition

You can update an existing indexer definition using an HTTP PUT request. Specify the name of the indexer to update on the request URI:  

```http
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

Updating an indexer definition does not automatically run it, but depending on your modifications and the associated a data source, a reset and rerun might be required.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to update. |
| api-version | Required. For preview features, the current version is `api-version=2020-06-30-Preview` (case-sensitive). See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|  

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).    

## Request Body

The request body syntax is the same as for [Create Indexer (2020-06-30-Preview)](create-indexer.md).

When updating an existing indexer, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the indexer definition with a GET, modify it, and then update it with PUT.  

## Response

For a successful request: 201 Created if a new indexer was created, and 204 No Content if an existing indexer was updated.  

## See also
  
+ [Azure Cognitive Search REST APIs](../index.md)
+ [HTTP status codes](../http-status-codes.md)
+ [Indexer operations](../indexer-operations.md)
+ [Naming rules](../naming-rules.md)  
