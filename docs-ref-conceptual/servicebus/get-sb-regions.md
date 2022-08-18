---
title: "Get SB Regions"
description: API reference documentation for the operations available in the Get SB Regions REST API, a RESTful web service for managing Get SB Regions resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c450dd08-ccf9-454f-8cf2-d59d8f884f74
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
# Get SB Regions

> [!IMPORTANT]
> This API is [**obsolete and retired**](/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

Retrieves the list of regions that support the creation and management of Service Bus service namespaces.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|GET|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Regions/|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|Set to **application/xml;type=entry;charset=utf-8**.|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|201|List of regions retrieved successfully|  
|400|Invalid request body.|  
|500|Internal/unhandled exception.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml;type=collection;charset=utf-8|  
  
### Response Body  
 The response contains a list of regions that Service Bus currently supports.
