---
title: "Delete Skillset (Azure Cognitive Search REST API)"
description: Permanently delete a skillset definition from an Azure Cognitive Search service.
ms.manager: nitinme
author: luiscabrer
ms.author: luisca

ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: "05/02/2019"
---
# Delete Skillset (Azure Cognitive Search REST API)


  The **Delete Skillset** operation removes a skillset and its contents from your Azure Cognitive Search service.  

```  
DELETE https://[service name].search.windows.net/skillsets/[skillset name]?api-version=2019-05-06
    api-key: [admin key]  
```  

 When a skillset is deleted, any indexers currently in execution that reference the skillset run to completion, but no further references will be made. Attempts to use a non-existent skillset will result in HTTP status code 404 Not Found.  

 The **api-version** is required. It is case-sensitive. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  

+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [Built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)
