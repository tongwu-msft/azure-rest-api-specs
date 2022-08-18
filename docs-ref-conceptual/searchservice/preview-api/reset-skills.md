---
title: Reset Skills (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: Preview version of the Reset Skills REST API for Azure Cognitive Search.
ms.date: 07/20/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---

# Reset Skills (Preview REST API)

**API Version: 2021-04-30-Preview, 2020-06-30-Preview**

> [!Important]
> This entire API is a preview feature that was introduced in 2020-06-30-Preview. It supports [cached enrichments](/azure/search/cognitive-search-incremental-indexing-conceptual) and [reset scenarios](/azure/search/search-howto-run-reset-indexers).

The **Reset Skills** request selectively processes one or more skills on the next indexer run. For indexers that have caching enabled, you can explicitly request processing for skill updates that the indexer cannot detect. For example, if you make external changes, such as revisions to a custom skill, you can use this API to rerun the skill. Outputs, such as a knowledge store or search index, are refreshed using reusable data from the cache and new content per the updated skill.

You can reset an existing [skillset](/rest/api/searchservice/create-skillset) using an HTTP POST, specifying the name of the skillset to update on the request URI. 

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
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Reset requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.| 

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

+ [Search REST APIs](/rest/api/searchservice)
+ [HTTP status codes](/rest/api/searchservice/http-status-codes)  
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Configure caching and incremental enrichment](/azure/search/search-howto-incremental-index)
+ [Incremental enrichment](/azure/search/cognitive-search-incremental-indexing-conceptual)