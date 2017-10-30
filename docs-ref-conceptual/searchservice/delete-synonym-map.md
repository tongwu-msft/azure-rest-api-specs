---
title: "Delete Synonym Map (Azure Search Service REST API) | Microsoft Docs"
description: "A synonym map can be deleted using REST API in Azure Search."
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
> Synonyms is a preview feature and is not intended to be used in production code. Preview features are subject to change and are exempt from the service level agreement (SLA).

## Request  
  The **Delete Synonym Map** operation removes a synonym map from your Azure Search service.  

```  
DELETE https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

> [!NOTE]  
>  Please ensure that no field in a search index is referencing the synonym map that you are deleting. The delete operation will still proceed but searches against the fields will fail with 400 (Bad Request) with the error message that the synonym map has been deleted.

 The **api-version** is required. The current preview version is `2016-09-01-Preview`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

### Request Headers  
  The following table describes the required and optional request headers.  

 |Request Header|Description|  
 |--------------------|-----------------|  
 |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Delete Synonym Map** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

  You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
