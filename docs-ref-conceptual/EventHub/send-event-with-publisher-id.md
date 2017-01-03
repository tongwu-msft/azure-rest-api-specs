---
title: "Send event with publisher ID"
ms.custom: ""
ms.date: "2016-12-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: dcbcc335-0682-4373-a848-e5aacf7d8618
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Send event with publisher ID
Sends a new event to an Event Hub with a specified publisher ID.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/publishers/{publisherId}/messages`|  
  
### Request Headers  
 See [Common parameters and headers](event-hubs-runtime-rest.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
### Request Body  
 The body of the event message in plain text. For example:  
  
```  
{ “Location”: “Redmond”, "Temperature":"37.0" }  
```  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|201|Success.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
### Response Body  
 If the request is successful, the response body is empty. If the request is not successful, the body contains an error code and error message.  
  
## Examples  
 **Request**  
  
```  
POST https://your-namespace.servicebus.windows.net/your-event-hub/publisher/dev-01/messages?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
{ "DeviceId":"dev-01", "Temperature":"37.0" }  
  
```  
  
 **Response**  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/xml; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Tue, 23 Feb 2016 03:22:27 GMT  
Content-Length: 0  
  
```