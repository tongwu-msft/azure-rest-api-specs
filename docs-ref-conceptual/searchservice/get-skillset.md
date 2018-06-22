---
title: "Get Skillset (REST api-version=2017-11-11-Preview) - Azure Search  | Microsoft Docs"
description: Returns a cognitive search skillset definition from an Azure Search service.
ms.manager: cgronlun
author: luiscabrer
ms.author: luisca

services: search
ms.service: search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: 06/21/2018
---
# Get Skillset (Azure Search Service REST API - Preview)

**Applies to:** api-version-2017-11-11-Preview

  The **Get Skillset** operation gets the skillset definition from Azure Search.  

```  
GET https://[service name].search.windows.net/skillsets/[skillset name]?api-version=2017-11-11-Preview 
    api-key: [admin key]  
```  

 The **api-version** is required. It is case-sensitive. The current preview version for cognitive search is `api-version=2017-11-11-Preview`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 200 OK is returned for a successful response. The response is similar to examples in [Create Skillset](create-skillset.md):  

## See also  

+ [Cognitive search overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Learn the cognitive search REST APIs](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Predefined sklls](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)


