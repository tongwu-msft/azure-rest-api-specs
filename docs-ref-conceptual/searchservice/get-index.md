---
title: "Get Index (Azure Cognitive Search REST API)"
description: Return an index definition in JSON, but not its contents, from an Azure Cognitive Search service.
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
# Get Index (Azure Cognitive Search REST API)
The **Get Index** operation gets the index definition from Azure Cognitive Search.  

## Request  
HTTPS is required for service requests. The **Get Index** request can be constructed using the GET method.  

```  
GET https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
api-key: [admin key]  
```  

The `[index name]` in the request URI specifies which index to return from the indexes collection.  

The `[api-version]` is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

### Request Headers
The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Index** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Cognitive Search service](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.   

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response. See the example request JSON in [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md) for an example of the response payload. The Get Index response body and the Create Index response and response bodies are all of the same format.  

> [!NOTE]  
>  You can use a diagnostic tool such as Postman to view the response payload. See [Create an Azure Cognitive Search index in Postman using REST APIs](https://azure.microsoft.com/documentation/articles/search-get-started-postman/).  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)
