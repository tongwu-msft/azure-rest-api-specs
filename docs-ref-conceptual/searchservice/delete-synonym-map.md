---
title: "Delete Synonym Map (Azure Cognitive Search REST API)"
description: "A synonym map can be deleted using REST API in Azure Cognitive Search."
ms.date: "05/02/2019"
ms.service: search
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
# Delete Synonym Map (Azure Cognitive Search REST API)

## Request  
  The **Delete Synonym Map** operation removes a synonym map from your Azure Cognitive Search service.  

```  
DELETE https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

> [!NOTE]  
>  Please ensure that no field in a search index is referencing the synonym map that you are deleting. The delete operation will still proceed but searches against the fields will fail with 400 (Bad Request) with the error message that the synonym map has been deleted.

 The **api-version** is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

### Request Headers  
  The following table describes the required and optional request headers.  

 |Request Header|Description|  
 |--------------------|-----------------|  
 |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Delete Synonym Map** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

  You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Cognitive Search REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
