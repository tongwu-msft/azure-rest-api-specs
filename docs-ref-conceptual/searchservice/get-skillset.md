---
title: "Get Skillset Azure Search Service REST API | Microsoft Docs"
description: Returns a cognitive search skillset definition from an Azure Search service.
ms.manager: cgronlun
author: luiscabrer
ms.author: luisca

services: search
ms.service: search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: "05/02/2019"
---
# Get Skillset (Azure Search Service REST API)


The **Get Skillset** operation gets the skillset definition from Azure Search.  A skillset is a chain of skills, linked by input-output mappings, that performs enrichments during indexing to make raw content full-text-searchable in Azure Search.

## Request  
HTTPS is required for all services requests. The **Get Skillset** request can be constructed using the GET method.  

```  
GET https://[service name].search.windows.net/skillsets/[skillset name]?api-version=2019-05-06
    api-key: [admin key]  
```  

 The **api-version** is required. It is case-sensitive. The current version is `api-version=2019-05-06`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

Because this request returns schema information, the **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

### Request Headers
The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Skillset** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Search services](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.  

### Request Body  
None.  

## Response  
 Status Code: 200 OK is returned for a successful response. The response is similar to examples in [Create Skillset](create-skillset.md)

## See also  

+ [Cognitive search overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Learn the cognitive search REST APIs](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Predefined skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)


