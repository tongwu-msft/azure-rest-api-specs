---
title: "Get Skillset Azure Cognitive Search REST API"
description: Returns a skillset definition from an Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Get Skillset (Azure Cognitive Search REST API)

The **Get Skillset** operation gets the skillset definition from Azure Cognitive Search. A skillset is a chain of skills, linked by input-output mappings, that performs enrichments during indexing to make raw content full-text-searchable in a search service

```http  
GET https://[service name].search.windows.net/skillsets/[skillset name]?api-version=[api-version]
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required. The request URI specifies the name of the skillset to return. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests for an object definition in your service must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

None.  

## Response

Status Code: 200 OK is returned for a successful response. The response is similar to examples in [Create Skillset](create-skillset.md)

> [!NOTE]
> If the skillset has an [encryption key](/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve the skillset definition. Without access to the encryption key, a 400 Bad Request is returned. Restoring access to the key allows the search service to retrieve the skillset definition again.

## See also  

+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](/azure/search/cognitive-search-custom-skill-interface)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
