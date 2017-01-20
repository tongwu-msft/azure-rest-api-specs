---
title: "Peek-Lock Message (Non-Destructive Read)"
ms.custom: ""
ms.date: "05/13/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3a4a7461-8b1b-4b58-8cf2-ce7b1f09017d
caps.latest.revision: 12
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
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
# Peek-Lock Message (Non-Destructive Read)
This operation atomically retrieves and locks a message from a queue or subscription for processing. The message is guaranteed not to be delivered to other receivers (on the same queue or subscription only) during the lock duration specified in the queue/subscription description. When the lock expires, the message becomes available to other receivers. In order to complete processing of the message, the receiver should issue a delete command with the lock ID received from this operation. To abandon processing of the message and unlock it for other receivers, an [Unlock Message](unlock-message.md) command should be issued, otherwise the lock duration period can expire.  
  
 This operation should be used in applications that require *At-Least-Once* delivery assurances. If the receiver does not delete the message before processing succeeds, this ensures that another receiver is able to attempt processing after the lock duration period expires.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath}/messages/head<br /><br /> or<br /><br /> http{s}://{serviceNamespace}.servicebus.windows.net/{topicPath}/subscriptions/{subscriptionName}/messages/head|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers. In addition to the listed properties, the header can contain custom properties. See the example.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies one of the following:<br /><br /> -   A WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to **WRAP access_token=”{swt}”**.<br />-   A SAS token.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and the response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|201|Message successfully retrieved and locked.|  
|204|No messages available within the specified timeout period.|  
|400|Bad request.|  
|401|Authorization failure.|  
|410|Specified queue or subscription does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
|Location|The URI of the locked message. You can use this URI to unlock or delete the message.|  
|BrokerProperties|JSON-encoded **BrokerProperties** of the received message. The **LockToken** property represents the lock ID for the returned message. The **SequenceNumber** property represents the sequence number of the returned message.|  
  
### Response Body  
 The response body is the message body of the retrieved message.  
  
## Example  
 The following HTTP request locks and returns message from a queue:  
  
```  
POST https://your-namespace.servicebus.windows.net/HttpClientSampleQueue/messages/head?timeout=60 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace&sig=Fg8yUyR4MOmXfHfj55f5hY4jGb8x2Yc%2b3%2fULKZYxKZk%3d&se=1404256819&skn=RootManageSharedAccessKey  
Host: your-namespace.servicebus.windows.net  
Content-Length: 0  
```  
  
 Service Bus returns the following response. The message contains the custom properties `Priority` and `Customer`:  
  
```  
HTTP/1.1 201 Created  
Transfer-Encoding: chunked  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Location: https://your-namespace.servicebus.windows.net/httpclientsamplequeue/messages/2/7da9cfd5-40d5-4bb1-8d64-ec5a52e1c547  
Server: Microsoft-HTTPAPI/2.0  
BrokerProperties: {"DeliveryCount":1,"EnqueuedSequenceNumber":0,"EnqueuedTimeUtc":"Wed, 02 Jul 2014 01:32:27 GMT","Label":"M1","LockToken":"7da9cfd5-40d5-4bb1-8d64-ec5a52e1c547","LockedUntilUtc":"Wed, 02 Jul 2014 01:33:27 GMT","MessageId":"31907572164743c38741631acd554d6f","SequenceNumber":2,"State":"Active","TimeToLive":10}  
Priority: "High"  
Customer: "12345,ABC"  
Date: Wed, 02 Jul 2014 01:32:27 GMT  
  
12  
This is a message.  
0  
```  
  
## See Also  
 [Service Bus HTTP Client sample](http://code.msdn.microsoft.com/windowsazure/Service-Bus-HTTP-client-fe7da74a)