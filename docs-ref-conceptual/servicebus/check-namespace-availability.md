---
title: "Check Namespace Availability"
description: API reference documentation for the operations available in the Check Namespace Availability REST API, a RESTful web service for managing Check Namespace Availability resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e6fd412c-adbc-4596-a176-5a5cfe85d025
caps.latest.revision: 9
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
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
# Check Namespace Availability

> [!IMPORTANT]
> This API is [**obsolete and retired**](/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

Checks the availability of the given service namespace across all Microsoft Azure subscriptions. This is useful because the domain name is created based on the namespace name.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|GET|https://management.core.windows.net/{subscription ID}/services/ServiceBus/CheckNamespaceAvailability/?namespace=\<namespaceValue>|HTTP/1.1|  
  
 The API requires a mandatory query parameter called `namespace`. If the query parameter is not specified (or other query parameters are specified in addition or instead of `namespace`), the API returns HTTP Status code – 400 (bad request).  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|Set to **application/xml;charset=utf-8**.|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success; namespace available.|  
|400|Invalid request body.|  
|405|Method not allowed. A method other than HTTP GET was used.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml;type=collection;charset=utf-8|  
  
### Response Body  
 None.
