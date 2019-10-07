---
title: List Skillset (Azure Cognitive Search REST API)
description: Returns a list of cognitive search skillsets created in the current Azure Cognitive Search service..

ms.manager: nitinme
author: luiscabrer
ms.author: luisca

ms.service: search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: "05/02/2019"
---
# List Skillset (Azure Cognitive Search REST API)

  The **List Skillset** operation returns the list of skillsets in your Azure Cognitive Search service.  

```  
    GET https://[service name].search.windows.net/skillsets?api-version=2019-05-06 
    api-key: [admin key]  
```  

 The **api-version** is required. It is case-sensitive. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

 Because this request returns schema information, the **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 For a successful request: 200 OK. 

## See also  

+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)
