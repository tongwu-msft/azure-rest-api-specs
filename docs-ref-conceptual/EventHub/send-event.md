---
title: "Send event"
ms.custom: ""
ms.date: "2017-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 494a54d0-d28f-4415-96a1-b3c2848eb133
caps.latest.revision: 15
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Send event
Sends a new event to an Event Hub.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/messages`|  
  
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
 The following HTTP request sends an event with no BrokerProperties or UserProperties:  
  
```  
POST https://your-namespace.servicebus.windows.net/your-event-hub/messages?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
  
{ "DeviceId":"dev-01", "Temperature":"37.0" }  
  
```  
  
 The following is a request with BrokerProperties:  
  
```  
POST https://your-namespace.servicebus.windows.net/your-event-hub/messages?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
BrokerProperties: {"CorrelationId","32119834-65f3-48c1-b366-619df2e4c400"}  
  
{ "DeviceId":"dev-01", "Temperature":"37.0" }  
  
```  
  
 The following is a request with UserProperties:  
  
```  
POST https://your-namespace.servicebus.windows.net/your-event-hub/messages?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
Alert: Strong Wind  
  
{ "DeviceId":"dev-01", "Temperature":"37.0" }  
  
```  
  
 Service Bus returns the following response:  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/xml; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Tue, 23 Feb 2016 03:22:27 GMT  
Content-Length: 0  
  
```