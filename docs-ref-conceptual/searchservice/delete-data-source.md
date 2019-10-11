---
title: "Delete Data Source (Azure Cognitive Search REST API)"
description: Delete data source connection information used by an Azure Cognitive Search indexer.
ms.date: "05/02/2019"
ms.service: cognitive-search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Delete Data Source (Azure Cognitive Search REST API)
  The **Delete Data Source** operation removes a data source from your Azure Cognitive Search service.  

```  
DELETE https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
api-key: [admin key]  
```  

> [!NOTE]  
>  If any indexers reference the data source that you're deleting, the delete operation will still proceed. However, those indexers will transition into an error state upon their next run.  

 The **api-version** is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
