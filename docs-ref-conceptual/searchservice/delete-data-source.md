---
title: "Delete Data Source (Azure Search Service REST API) | Microsoft Docs"
description: Delete data source connection information used by an Azure Search indexer.
ms.date: "04/20/2018"
ms.prod: "azure"
ms.service: "search"
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
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
# Delete Data Source (Azure Search Service REST API)
  The **Delete Data Source** operation removes a data source from your Azure Search service.  

```  
DELETE https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
api-key: [admin key]  
```  

> [!NOTE]  
>  If any indexers reference the data source that you're deleting, the delete operation will still proceed. However, those indexers will transition into an error state upon their next run.  

 The **api-version** is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
