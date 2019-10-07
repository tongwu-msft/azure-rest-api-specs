---
title: "Get Synonym Map (Azure Cognitive Search REST API)"
description: "A content of a synonym map can be retrieved using REST API in Azure Cognitive Search."
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
# Get Synonym Map (Azure Cognitive Search REST API)

The **Get Synonym Map** operation gets the synonym map definition from Azure Cognitive Search.  

## Request
  
HTTPS is required for all service requests. The **Get Synonym Map** request is constructed using HTTP GET.
```  
GET https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

The `[synonymmap name]` in the request URI specifies which synonym map to return from the synonymmaps collection.  

The `[api-version]` is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

### Request Headers
The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Synonym Map** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Cognitive Search service](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.  

### Request Body  
None.  

## Response  
 Status Code: 200 OK is returned for a successful response.  

 The response is similar to examples in [Create Synonym Map &#40;Azure Cognitive Search REST API&#41;](create-synonym-map.md).  

```  
{   
    "name" : "synonymmap1",  
    "format" : "solr",  
    "synonyms" : "United States, United States of America, USA\n
    Washington, Wash. => WA"
}  

```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Cognitive Search REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
