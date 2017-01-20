---
title: "Unlock Message"
ms.custom: ""
ms.date: "05/12/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b685475c-7be6-415b-95b9-e72f32a62a7a
caps.latest.revision: 9
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
# Unlock Message
Unlocks a message for processing by other receivers on a specified subscription. This operation deletes the lock object, causing the message to be unlocked. Before the operation is called, a receiver must first lock the message.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath}/messages/{messageId&#124;sequenceNumber}/{lockToken}<br /><br /> or<br /><br /> http{s}://{serviceNamespace}.servicebus.windows.net/{topicPath}/subscriptions/{subscriptionName}/messages/{messageId&#124;sequenceNumber}/{lockToken}|HTTP/1.1|  
  
### URI Parameters  
 The URI is provided in the Location header of the peeked message, or you can construct it from the parts described in the following table.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`messageId`|The ID of the message to be unlocked as returned in **BrokerProperties{MessageId}** by the **Peek Message** operation.|  
|`sequence-number`|The sequence number of the message to be unlocked as returned in **BrokerProperties{SequenceNumber}** by the **Peek Message** operation.|  
|`lockToken`|The token of the lock of the message to be unlocked as returned by the **Peek Message** operation in **BrokerProperties{LockToken}**.|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
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
|200|Message successfully unlocked.|  
|401|Authorization failure.|  
|404|No message was found with the specified **MessageId** or **LockToken**.|  
|410|Specified queue or subscription does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179382.aspx).  
  
### Response Headers  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
  
### Response Body  
 None.  
  
## Example  
 The following HTTP request unlocks a message:  
  
```  
PUT https://your-namespace.servicebus.windows.net/HttpClientSampleQueue/messages/31907572-1647-43c3-8741-631acd554d6f/7da9cfd5-40d5-4bb1-8d64-ec5a52e1c547?timeout=60 HTTP/1.1  
Authorization: SharedAccessSignature sr=rukochbay&sig=rg9iGsK0ZyYlvhIqyH5IS5tqmeb08h8FstjHLPj3%2f8g%3d&se=1404265946&skn=RootManageSharedAccessKey  
Host: your-namespace.servicebus.windows.net  
Content-Length: 0  
```  
  
 Service Bus returns the following response:  
  
```  
HTTP/1.1 200 OK  
Transfer-Encoding: chunked  
Content-Type: application/xml; charset=utf-8  
Server: Microsoft-HTTPAPI/2.0  
Date: Tue, 01 Jul 2014 23:00:35 GMT  
  
0  
```  
  
## See Also  
 [Service Bus HTTP Client sample](http://code.msdn.microsoft.com/windowsazure/Service-Bus-HTTP-client-fe7da74a)