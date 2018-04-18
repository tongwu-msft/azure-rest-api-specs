---
title: "Get Index (Azure Search Service REST API) | Microsoft Docs"
description: Return an index definition in JSON, but not its contents, from an Azure Search service.
ms.date: "2017-06-23"
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
# Get Index (Azure Search Service REST API)
  The **Get Index** operation gets the index definition from Azure Search.  

```  
GET https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
api-key: [admin key]  
```  

## Request  
 HTTPS is required for service requests. The **Get Index** request can be constructed using the GET method.  

 The `[index name]` in the request URI species which index to return from the indexes collection.  

 The `api-version` parameter is required. The current version is `api-version=2017-11-11`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Index** request must include an `api-key` set to an admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response. See the example request JSON in [Create Index &#40;Azure Search Service REST API&#41;](create-index.md) for an example of the response payload. The Get Index response body and the Create Index response and response bodies are all of the same format.  

> [!NOTE]  
>  You can use a diagnostic tool such as Fiddler to view the response payload. See [How to use Fiddler to evaluate and test Azure Search REST APIs](https://azure.microsoft.com/documentation/articles/search-fiddler/).  

## See also  
 [Azure Search Service REST](index.md)
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
