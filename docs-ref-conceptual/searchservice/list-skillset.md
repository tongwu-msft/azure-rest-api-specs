---
title: List Skillset (REST api-version=2017-11-11-Preview) - Azure Search | Microsoft Docs
description: Returns a list of cognitive search skillsets created in the current Azure Search service..

ms.manager: cgronlun
author: luiscabrer
ms.author: luisca

services: search
ms.service: search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: 01/08/2019
---
# List Skillset (Azure Search Service REST API - Preview)

**Applies to:** api-version-2017-11-11-Preview

  The **List Skillset** operation returns the list of skillsets in your Azure Search service.  

```  
    GET https://[service name].search.windows.net/skillsets?api-version=2017-11-11-Preview  
    api-key: [admin key]  
```  

 The **api-version** is required. It is case-sensitive. The current preview version for cognitive search is `api-version=2017-11-11-Preview`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

 Because this request returns schema information, the **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 For a successful request: 200 OK. 

## See also  

+ [Cognitive search overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Learn the cognitive search REST APIs](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Predefined skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)
