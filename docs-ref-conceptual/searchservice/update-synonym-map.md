---
title: "Update Synonym Map (Azure Search Service REST API) | Microsoft Docs"
description: "A synonym map to expand or rewrite a search query can be updated using REST API in Azure Search."
ms.date: "2016-11-09"
ms.prod: "azure"
ms.service: "search"
ms.topic: "language-reference"
author: "mhko"
ms.author: "nateko"
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
# Update synonym map (Azure Search Service REST API)

## Request
  You can update an existing synonym map using an HTTP PUT request. You specify the name of the synonym map to update on the request URI:  

```  
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
```  
 The **api-version** is required. The current preview version is `2017-11-11`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

### Request Headers  
  The following table describes the required and optional request headers.  

 |Request Header|Description|  
 |--------------------|-----------------|  
 |*Content-Type:*|Required. Set this to `application/json`|  
 |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Update Synonym Map** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

  You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body
 The request body syntax is the same as for [Create Synonym Map &#40;Azure Search Service REST API&#41;](create-synonym-map.md).  

## Response  
 For a successful request, "201 Created" if a new synonym map was created, and "204 No Content" if an existing synonym map was updated  

 By default the response body will be empty. However, if the `Prefer` request header is set to `return=representation`, the response body will contain the JSON for the synonym map that was updated or created. In this case, the success status code will be "201 Created" if a new synonym map was created and "200 OK" if an existing synonym map was updated.    

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)  
