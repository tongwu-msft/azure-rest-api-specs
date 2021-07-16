---
title: Reset Skills  (2021-04-30-Preview)
description: Preview version of the Reset Skills REST API for Azure Cognitive Search.
ms.date: 07/20/2021

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Reset Skills (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> This preview API is used for incremental enrichment when you want to rebuild all or part of the cache. The entire API is  a preview feature. For more information, see [incremental indexing](https://docs.microsoft.com/azure/search/cognitive-search-incremental-indexing-conceptual) and [indexer reset](https://docs.microsoft.com/azure/search/search-howto-run-reset-indexers).

The **Reset Skills** request selectively processes one or more skills on the next indexer run. For indexers that have caching enabled, you can explicitly request processing for skill updates that the indexer cannot detect. For example, if you make external changes, such as revisions to a custom skill, you can use this API to rerun the skill. Outputs, such as a knowledge store or search index, are refreshed using reusable data from the cache and new content per the updated skill.

You can reset an existing [skillset](https://docs.microsoft.com/rest/api/searchservice/create-skillset) using an HTTP POST, specifying the name of the skillset to update on the request URI. 

```http  
POST https://[servicename].search.windows.net/skillsets/[skillset name]/resetskills?api-version=[api-version]
    Content-Type: application/json
    api-key: [admin key]
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required. The request URI specifies the name of the skillset to reset. |
| api-version | Required. For preview features, the current version is `api-version=2020-06-30-Preview`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).  

## Request Body

The body of the request is an array of skill names.

```json
{   
    "skillNames" : ["<SKILL-1>", "SKILL-n"]
}  
```

## Response  

Status Code: 204 No Content for a successful response. 

## See also

+ [Search REST APIs](https://docs.microsoft.com/rest/api/searchservice)
+ [HTTP status codes](https://docs.microsoft.com/rest/api/searchservice/http-status-codes)  
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Configure caching and incremental enrichment](https://docs.microsoft.com/azure/search/search-howto-incremental-index)
+ [Incremental enrichment](https://docs.microsoft.com/azure/search/cognitive-search-incremental-indexing-conceptual)