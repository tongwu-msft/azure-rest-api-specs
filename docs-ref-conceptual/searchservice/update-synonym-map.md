---
title: "Update Synonym Map (Azure Search Service REST API)"
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
ms.assetid: f756cd01-c266-4fd2-a7d0-ba05d49b439a
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
# Update synonym map (Azure Search Service REST API)
> [!NOTE]  
>  Please note that the Synonyms feature is currently in preview and only available in the latest preview api version `2016-09-01-Preview`.

  You can update an existing synonym map using an HTTP PUT request. You specify the name of the synonym map to update on the request URI:  

```  
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 The **api-version** is required. The current preview version is `2016-09-01-Preview`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Request  
 The request body syntax is the same as for [Create Synonym Map &#40;Azure Search Service REST API&#41;](create-synonym-map.md).  

## Response  
 For a successful request: 201 Created if a new synonym map was created, and 204 No Content if an existing synonym map was updated  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
