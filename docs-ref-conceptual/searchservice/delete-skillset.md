---
title: "Delete Skillset (Azure Cognitive Search REST API)"
description: Permanently delete a skillset definition from an Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Delete Skillset (Azure Cognitive Search REST API)

The **Delete Skillset** operation removes a skillset and its contents from your Azure Cognitive Search service.  

```http  
DELETE https://[service name].search.windows.net/skillsets/[skillset name]?api-version=[api-version]
  Content-Type: application/json  
  api-key: [admin key]  
```  

 When a skillset is deleted, any indexers currently in execution that reference the skillset run to completion, but no further references will be made. Attempts to use a non-existent skillset will result in HTTP status code 404 Not Found.  

  ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required. The request URI specifies the name of the skillset to delete.   |
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

+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](/azure/search/cognitive-search-tutorial-blob)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
