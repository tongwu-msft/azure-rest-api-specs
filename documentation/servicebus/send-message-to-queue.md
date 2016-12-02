---
title: "Send Message"
ms.custom: ""
ms.date: "2016-09-06"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c582a561-4719-4526-98a8-70d2daa4fc78
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
# Send Message
Sends a message to a Service Bus queue or topic.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath&#124;topicPath}/messages|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers. In addition to the listed properties, the header can contain custom properties. See the example.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specifies one of the following:<br /><br /> -   A WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to **WRAP access_token=”{swt}”**.<br />-   A SAS token.|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
|**BrokerProperties**|JSON-encoded set of <xref:Microsoft.ServiceBus.Messaging.BrokeredMessage> properties.|  
|x-ms-retrypolicy|(Optional) Set to `NoRetry` to disable automatic retry on send operations in the case of transient errors.|  
  
### Request Body  
 The request body is the message payload.  
  
 If the message is to be received via a protocol other than HTTP/HTTPS, the message body must be serialized; for example, with an XML <xref:System.Runtime.Serialization.DataContractSerializer>. For example:  
  
```c#  
MemoryStream ms = new MemoryStream();  
DataContractSerializer serializer = new DataContractSerializer(typeof(string));  
serializer.WriteObject(ms, "This is a message.");  
byte[] body = ms7.ToArray();  
```  
  
 The preceding code produces the following message body:  
  
```xml  
<string xmlns="http://schemas.microsoft.com/2003/10/Serialization/">This is a message.</string>  
```  
  
 You can receive and process the message with the following code:  
  
```c#  
BrokeredMessage message = queueClient.Receive();  
string body = message.GetBody<string>(new DataContractSerializer(typeof(string)));  
```  
  
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
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179382.aspx).  
  
### Response Headers  
 **Content-type** as passed in.  
  
### Response Body  
 None.  
  
## Example  
 The following HTTP request sends a message to a queue or topic. The message has the following properties:  
  
 Label: “M1”  
  
 TimeToLive: 10 seconds  
  
 State: Active  
  
 Message body: “This is a message.”  
  
 In addition to the **BrokeredProperties**, the message carries the following custom properties: *Priority* = “High” and *Customer* = “12345,ABC”.  
  
```  
POST https://your-namespace.servicebus.windows.net/HttpClientSampleQueue/messages?timeout=60 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace&sig=Fg8yUyR4MOmXfHfj55f5hY4jGb8x2Yc%2b3%2fULKZYxKZk%3d&se=1404256819&skn=RootManageSharedAccessKey  
BrokerProperties: {"Label":"M1","State":"Active","TimeToLive":10}  
Priority: High  
Customer: 12345,ABC  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Host: your-namespace.servicebus.windows.net  
Content-Length: 18  
Expect: 100-continue  
  
This is a message.  
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