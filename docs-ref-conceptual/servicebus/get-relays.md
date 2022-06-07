---
title: "Get Relays"
description: API reference documentation for the operations available in the Get Relays REST API, a RESTful web service for managing Get Relays resources in Azure.
ms.custom: ""
ms.date: "05/15/2015"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: fbb229b5-e1db-4f0b-a1a3-f73983ea842c
caps.latest.revision: 7
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
# Get Relays

> [!IMPORTANT]
> This API is [**obsolete and retired**](/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

This operation enumerates the publicly-available relay endpoints in a service namespace.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|GET|https://management.core.windows.net/{subscription ID}/services/ServiceBus/ Namespaces/{Namespace}/Relays/$skip={skip}&$top={top}<br /><br /> where {skip} is the number of entries to skip, and {top} is the number of entries to retrieve.|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Namespace|Management Endpoint URL|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Successfully retrieved relay endpoints policies.|  
|401|Authorization failure. Returned when user does not have credentials to retrieve namespaces relay endpoints policies. This could be due to suspended subscription.|  
|404|Entity does not exist under this namespace.|  
|500|Internal/unhandled exception.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml;type=collection;charset=utf-8|  
  
### Response Body  
 The API returns an XML AtomPub document that represents each relay endpoint policy, with the following elements:  
  
|Property Name|Type|Description|  
|-------------------|----------|-----------------|  
|**Name**|String|Endpoint name|  
|**Listener Type**|String|Group of listeners type. Valid values:<br /><br /> -   Unicast<br />-   Multicast<br />-   DirectConnection<br />-   HybridConnection<br />-   RelayedConnection<br />-   RelayedHttp|  
|**NumberOfListeners**|Integer|Number of current active listeners|
