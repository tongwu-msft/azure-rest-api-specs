---
title: "Get Index (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to: 
  - "Azure"
ms.assetid: d14566aa-13f9-434f-bb1f-9853e1509188
caps.latest.revision: 29
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
# Get Index (Azure Search Service REST API)
  The **Get Index** operation gets the index definition from Azure Search.  
  
```  
GET https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
api-key: [admin key]  
```  
  
## Request  
 HTTPS is required for service requests. The **Get Index** request can be constructed using the GET method.  
  
 The `[index name]` in the request URI species which index to return from the indexes collection.  
  
 The `api-version` parameter is required. See [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md) for a list of available versions.  
  
### Request Headers  
 The following table describes the required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Index** request must include an `api-key` set to an admin key (as opposed to a query key).|  
  
 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  
  
### Request Body  
 None.  
  
## Response  
 Status Code: "200 OK" is returned for a successful response. See the example JSON in [Create Index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/create-index.md) for an example of the response payload.  
  
> [!NOTE]  
>  You can use a diagnostic tool such as Fiddler to view the response payload. See [How to use Fiddler to evaluate and test Azure Search REST APIs](https://azure.microsoft.com/documentation/articles/search-fiddler/).  
  
## See Also  
 [Azure Search Service REST](../SearchServiceREST/service-rest.md)   
 [HTTP status codes &#40;Azure Search&#41;](../SearchServiceREST/http-status-codes.md)   
 [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md)  
  
  