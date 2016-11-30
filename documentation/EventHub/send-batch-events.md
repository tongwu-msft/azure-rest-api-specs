---
title: "Send batch events"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a21d4925-bdfc-4c3c-a1eb-e4434cd1d2a2
caps.latest.revision: 5
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Send batch events
Sends a new batched message event to an Event Hub. Batching reduces the number of messages that are transmitted by merging information from multiple messages into a single batch of messages. This reduces the number of connections established, and reduces network bandwidth by reducing the number of packet headers that are sent over the network.  
  
 Sending a batch of messages is not that different from sending a single event to an Event Hub. To enable sending batch events to an Event Hub using the REST API, the following requirements must be met:  
  
1.  Implement the logic to create batched messages.  
  
2.  The message body must be a valid JSON payload and follow a convention to describe each message.  
  
3.  Set the Content-Type header to "**application/vnd.microsoft.servicebus.json**".  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{servicebusNamespace}.servicebus.windows.net/{eventHubPath}/messages`|  
  
### Request Headers  
 See [Common parameters and headers](event-hubs-runtime-rest.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
### Additional Request Headers  
  
|Request Header|Required or Optional|Description|  
|--------------------|--------------------------|-----------------|  
|Content-Type|Required|Set to “**application/vnd.microsoft.servicebus.json**”.|  
  
### Request Body  
 JSON payload that contains the content of multiple messages. For example:  
  
```json  
[{"Body":"Message1",{"Body":"Message2"},{"Body":"Message3"}]  
```  
  
 The **BrokerProperties** and **UserProperties** cannot be set in headers when sending batch events (they will be ignored). Instead, send them as part of the request body. For example, setting **BrokerProperties** in batched events:  
  
```json  
[{"Body":"Message1", "BrokerProperties":{"Name":"CorrelationId","Value":"32119834-65f3-48c1-b366-619df2e4c400"}},{"Body":"Message2"},{"Body":"Message3"}]  
```  
  
 Setting **CustomProperties** in batched events:  
  
```json  
[{"Body":"Message1", "UserProperties":{"Alert":"Strong Wind"}}, {"Body":"Message2"}, {"Body":"Message3"}]  
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
POST https://your-namespace.servicebus.windows.net/your-event-hub/messages?timeout=60&api-version=2014-01 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=your-sas-key&se=1456197782&skn=RootManageSharedAccessKey  
Content-Type: application/vnd.microsoft.servicebus.json  
Host: your-namespace.servicebus.windows.net  
  
[{"Body":"Message1", "UserProperties":{"Alert":"Strong Wind"}},{"Body":"Message2"},{"Body":"Message3"}]  
  
```  
  
 **Response**  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/xml; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Tue, 23 Feb 2016 03:22:27 GMT  
Content-Length: 0  
  
```