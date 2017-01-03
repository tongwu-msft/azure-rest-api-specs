---
title: "Send Message Batch"
ms.custom: ""
ms.date: "2016-09-06"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 34e898a3-49d7-4c63-a4e8-83a05ec550c8
caps.latest.revision: 7
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
# Send Message Batch
Sends a batch of messages to a Service Bus queue or topic.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath&#124;topicPath}/messages|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers. In addition to the listed properties, the header can contain custom properties. See the example.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies one of the following:<br /><br /> -   A WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to **WRAP access_token=”{swt}”**.<br />-   A SAS token.|  
|Content-Type|Set to **application/vnd.microsoft.servicebus.json**.|  
|x-ms-retrypolicy|(Optional) Set to `NoRetry` to disable automatic retry on send operations in the case of transient errors.|  
  
### Request Body  
 The request body contains the JSON-encoded message batch.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|201|Message successfully sent to queue or topic.|  
|400|Bad request.|  
|401|Authorization failure.|  
|403|Quota exceeded or message too large.|  
|410|Specified queue or topic does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 **Content-type** as passed in.  
  
### Response Body  
 None.  
  
## Example  
 The following HTTP request sends a batch of three messages to a queue or topic. The first message has a <xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.TimeToLive%2A> value of 40 seconds, the second message has a custom message property “Priority”, and the third message has the custom message properties “Priority” and “Customer”.  
  
```  
POST https://your-namespace.servicebus.windows.net/HttpClientSampleQueue/messages?timeout=60 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace&sig=Fg8yUyR4MOmXfHfj55f5hY4jGb8x2Yc%2b3%2fULKZYxKZk%3d&se=1404256819&skn=RootManageSharedAccessKey  
Content-Type: application/vnd.microsoft.servicebus.json  
Host: your-namespace.servicebus.windows.net  
Content-Length: 18  
Expect: 100-continue  
  
[  
  {  
    "Body":”This is the first message",  
    "BrokerProperties":{"Label":"M1","TimeToLiveTimeSpan":"0.00:00:40"}  
  },  
  {  
    "Body":”This is the second message",  
    "BrokerProperties":{"Label":"M2"},  
    "UserProperties":{"Priority":"Low"}  
  },  
  {  
    "Body":”This is the third message",  
    "BrokerProperties":{"Label":"M3"},  
    "UserProperties":{"Priority":"Medium","Customer":"ABC"}  
  }  
]  
  
```  
  
 Service Bus returns the following response:  
  
```  
HTTP/1.1 201 Created  
Transfer-Encoding: chunked  
Content-Type: application/xml; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Tue, 01 Jul 2014 23:00:22 GMT  
  
0  
```  
  
## See Also  
 [Service Bus HTTP Client sample](http://code.msdn.microsoft.com/windowsazure/Service-Bus-HTTP-client-fe7da74a)