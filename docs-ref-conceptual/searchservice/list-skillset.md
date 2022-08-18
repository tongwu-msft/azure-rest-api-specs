---
title: List Skillset (Azure Cognitive Search REST API)
description: Returns a list of cognitive search skillsets created in the current Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# List Skillset (Azure Cognitive Search REST API)

The **List Skillset** operation returns the list of skillsets in your Azure Cognitive Search service.  

```http
GET https://[service name].search.windows.net/skillsets?api-version=[api-version]
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

For a successful request: 200 OK.

> [!NOTE]
> If a skillset has an [encryption key](/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve encrypted properties in that skillset's definition. Without access to the encryption key, an `"<encrypted>"` placeholder is returned in place of the encrypted properties. Restoring access to the key allows the search service to retrieve the complete skillset definition again.

## See also  

+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](/azure/search/cognitive-search-custom-skill-interface)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
