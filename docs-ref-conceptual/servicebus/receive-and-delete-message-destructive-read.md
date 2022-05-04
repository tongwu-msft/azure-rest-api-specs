---
title: "Receive and Delete Message (Destructive Read)"
description: Learn how this operation receives a message from a queue or subscription, and removes the message from that queue or subscription in one atomic operation.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: beab2bcc-5b06-40fe-a24a-ffbafc5247b1
caps.latest.revision: 11
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
# Receive and Delete Message (Destructive Read)
This operation receives a message from a queue or subscription, and removes the message from that queue or subscription in one atomic operation.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|DELETE|`http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath}/messages/head`<br /><br /> or<br /><br /> `http{s}://{serviceNamespace}.servicebus.windows.net/{topicPath}/subscriptions/{subscriptionName}/messages/head|HTTP/1.1`|  
  
### Request Headers  
 The following table describes required and optional request headers. In addition to the listed properties, the header may contain custom properties. See the example.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specify one of the following token values:<ul><li> Azure Active Directory (Azure AD) JSON Web Token (JWT) token. <br/>Example: `Authorization: Bearer <Azure AD JWT token>`. <br/>For information on generating an Azure AD token, see [Authenticate from an application](get-azure-active-directory-token.md).</li><li>A SAS token. <br/>Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. <br/>For information on generating a SAS token, see [Generate a Shared Access Signature token](/azure/service-bus-messaging/service-bus-sas) and [Generate SAS token](../EventHub/generate-sas-token.md).</li></ul> |   
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Message successfully retrieved and deleted.|  
|204|No messages available within the specified timeout period.|  
|400|Bad request.|  
|401|Authorization failure.|  
|410|Specified queue or subscription does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
### Response Body  
 The response body is the message body of the retrieved message.  
  
## Example  
 The following HTTP request receives and deletes a message from a queue:  
  
```  
DELETE https://your-namespace.servicebus.windows.net/HttpClientSampleQueue/messages/head?timeout=60 HTTP/1.1  
Authorization: SharedAccessSignature sr=your-namespace&sig=Fg8yUyR4MOmXfHfj55f5hY4jGb8x2Yc%2b3%2fULKZYxKZk%3d&se=1404256819&skn=RootManageSharedAccessKey  
Host: your-namespace.servicebus.windows.net  
Content-Length: 0  
```  
  
 Service Bus returns the following response. The message contains the custom properties “Priority” and “Customer”:  
  
```  
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/atom+xml;type=entry;charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
BrokerProperties: {"DeliveryCount":1,"EnqueuedSequenceNumber":0,"EnqueuedTimeUtc":"Tue, 01 Jul 2014 23:00:23 GMT","Label":"M1","MessageId":"3a146f76afee41648677887ffced72d8","SequenceNumber":1,"State":"Active","TimeToLive":10}  
Priority: "High"  
Customer: "12345,ABC"  
Date: Tue, 01 Jul 2014 23:00:23 GMT  
  
12  
This is a message.  
0  
```  
  
## See Also  
 [Service Bus HTTP Client sample](https://code.msdn.microsoft.com/Service-Bus-HTTP-client-fe7da74a)