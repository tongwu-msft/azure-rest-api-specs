---
title: "Delete Skillset (REST api-version=2017-11-11-Preview) - Azure Search "
description: Permanently delete a cognitive search skillset definition from an Azure Search service.
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
# Delete Skillset (Azure Search Service REST API - Preview)

**Applies to:** api-version-2017-11-11-Preview

  The **Delete Skillset** operation removes a skillset from your Azure Search service.  

```  
DELETE https://[service name].search.windows.net/skillsets/[skillset name]?api-version=2017-11-11-Preview 
    api-key: [admin key]  
```  

 When a skillset is deleted, any indexers currently in execution that reference the skillset run to completion, but no further references will be made. Attempts to use a non-existent skillset will result in HTTP status code 404 Not Found.  

 The **api-version** is required. It is case-sensitive. The current preview version for cognitive search is `api-version=2017-11-11-Preview`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  

+ [Cognitive search overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Learn the cognitive search REST APIs](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [Predefined skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)
