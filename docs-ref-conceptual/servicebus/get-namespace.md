---
title: "Get Namespace"
description: API reference documentation for the operations available in the Get Namespace REST API, a RESTful web service for managing Get Namespace resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8c9afcf5-a98c-401a-a0b0-e9e0d8a569a3
caps.latest.revision: 6
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
# Get Namespace

> [!IMPORTANT]
> This API is [**obsolete and retired**](/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

Returns the description for the specified namespace.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|GET|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{namespace name}|HTTP/1.1|  
  
### Request Headers  
 None.  
  
### Request Body  
 None  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Successfully retrieved namespace description.|  
|401|Authorization failure. Returned when user does not have credentials to retrieve namespace description. This could be due to a suspended subscription.|  
|404|Namespace does not exist, or namespace name contains invalid characters.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml; type=entry; charset=utf-8|  
  
### Response Body  
 None
