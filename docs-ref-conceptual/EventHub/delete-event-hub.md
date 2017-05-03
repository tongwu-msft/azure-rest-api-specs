---
title: "Delete Event Hub"
ms.custom: ""
ms.date: "2016-03-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6c3ec58b-bba9-4702-85b5-e3c9777e54d2
caps.latest.revision: 14
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Delete Event Hub
Deletes an Event Hub. This operation also removes all associated state.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{serviceNamespace}.servicebus.windows.net/{eventHubPath}`|  
  
### Request Headers  
 See [Common parameters and headers](../EventHub/event-hubs-management-rest-classic.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  
 If the request is successful, the response body is empty. If the request is not successful, the body contains an error code and error message.  
  
## Examples  
 **Request**  
  
```  
DELETE https://your-namespace.servicebus.windows.net/your-event-hub?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
```  
  
 **Response**  
  
```  
HTTP/1.1 200 OK  
Content-Length: 0  
Server: Microsoft-HTTPAPI/2.0  
Date: Wed, 25 Jun 2014 22:43:27 GMT  
```