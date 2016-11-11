---
title: "Delete Index (Azure Search Service REST API)"
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
ms.assetid: 70456cdf-90b0-4519-89f7-2443420e7bac
caps.latest.revision: 27
author: "Brjohnstmsft"
ms.author: "brjohnst"
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
# Delete Index (Azure Search Service REST API)
  The **Delete Index** operation removes an index and associated documents from your Azure Search service. You can get the index name from the service dashboard in the Azure Preview portal, or from the API. See [List Indexes &#40;Azure Search Service REST API&#41;](list-indexes.md) for details.  

```  
DELETE https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
api-key: [admin key]  

```  

## Request  
 HTTPS is required for service requests. The **Delete Index** request can be constructed using the DELETE method.  

 The [index name] in the request URI specifies which index to delete from the indexes collection.  

 The `api-version` parameter is required. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for a list of available versions.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Delete Index** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 None.  

## Response  
 Status Code: 204 No Content  is returned for a successful response.  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
