---
title: "Get Synonym Map (Azure Search Service REST API) | Microsoft Docs"
description: "A content of a synonym map can be retrieved using REST API in Azure Search."
ms.date: "2017-03-13"
ms.prod: "azure"
ms.reviewer: ""
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
# Get Synonym Map (Azure Search Service REST API)

## Request
  The **Get Synonym Map** operation gets the synonym map definition from Azure Search.  

```  
GET https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

 The **api-version** is required. The current preview version is `2016-09-01-Preview`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

### Request Headers
  The following list describes the required and optional request headers.  

 |Request Header|Description|  
 |--------------------|-----------------|  
 |*Content-Type:*|Required. Set this to `application/json`|  
 |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Synonym Map** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

  You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

## Response  
 Status Code: 200 OK is returned for a successful response.  

 The response is similar to examples in [Create Synonym Map &#40;Azure Search Service REST API&#41;](create-synonym-map.md).  

```  
{   
    "name" : "synonymmap1",  
    "format" : "solr",  
    "synonyms" : "United States, United States of America, USA\n
    Washington, Wash. => WA"
}  

```  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
