---
title: "Delete Synonym Map (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-11-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 4ec79d3b-48fe-455c-b781-fa9f11fafa19
caps.latest.revision: 10
author: "mhko"
ms.author: "nateko"
manager: "jhubbard"
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
# Delete Synonym Map (Azure Search Service REST API)
> [!NOTE]  
>  Please note that the Synonyms feature is currently in preview and only available in the latest preview api version `2016-09-01-Preview`.

The **Delete Synonym Map** operation removes a synonym map from your Azure Search service.  

```  
DELETE https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

> [!NOTE]  
>  Please ensure that no field in a search index is referencing the synonym map that you are deleting. The delete operation will still proceed but searches against the fields will fail with 400 (Bad Request) with the error message that the synonym map has been deleted.

 The **api-version** is required. The current version is `2016-09-01-Preview`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
