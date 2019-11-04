---
title: "Get Skillset Azure Cognitive Search REST API"
description: Returns a skillset definition from an Azure Cognitive Search service.
ms.manager: nitinme
author: luiscabrer
ms.author: luisca

ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: "05/02/2019"
---
# Get Skillset (Azure Cognitive Search REST API)


The **Get Skillset** operation gets the skillset definition from Azure Cognitive Search.  A skillset is a chain of skills, linked by input-output mappings, that performs enrichments during indexing to make raw content full-text-searchable in a search service

## Request  
HTTPS is required for all services requests. The **Get Skillset** request can be constructed using the GET method.  

```  
GET https://[service name].search.windows.net/skillsets/[skillset name]?api-version=2019-05-06
    api-key: [admin key]  
```  

 The **api-version** is required. It is case-sensitive. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

Because this request returns schema information, the **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

### Request Headers
The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Skillset** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Cognitive Search service](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.  

### Request Body  
None.  

## Response  
 Status Code: 200 OK is returned for a successful response. The response is similar to examples in [Create Skillset](create-skillset.md)

## See also  

+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)


