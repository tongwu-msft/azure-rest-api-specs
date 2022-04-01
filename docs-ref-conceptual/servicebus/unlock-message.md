---
title: "Unlock Message"
description: API reference documentation for the operations available in the Unlock Message REST API, a RESTful web service for managing Unlock Message resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b685475c-7be6-415b-95b9-e72f32a62a7a
caps.latest.revision: 9
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
# Unlock Message
Unlocks a message for processing by other receivers on a specified subscription. This operation deletes the lock object, causing the message to be unlocked. Before the operation is called, a receiver must first lock the message.  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|`http{s}://{serviceNamespace}.servicebus.windows.net/{queuePath}/messages/{messageId&#124;sequenceNumber}/{lockToken}`<br /><br /> or<br /><br /> `http{s}://{serviceNamespace}.servicebus.windows.net/{topicPath}/subscriptions/{subscriptionName}/messages/{messageId&#124;sequenceNumber}/{lockToken}|HTTP/1.1`|  
  
### URI Parameters  
 The URI is provided in the Location header of the peeked message, or you can construct it from the parts described in the following table.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`messageId`|The ID of the message to be unlocked as returned in `BrokerProperties{MessageId}` by the **Peek Message** operation.|  
|`sequence-number`|The sequence number of the message to be unlocked as returned in `BrokerProperties{SequenceNumber}` by the **Peek Message** operation.|  
|`lockToken`|The token of the lock of the message to be unlocked as returned by the **Peek Message** operation in `BrokerProperties{LockToken}`.|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization|Specify one of the following:<ul><li> Azure Active Directory (Azure AD) JSON Web Token (JWT) token. <br/>Example: `Authorization: Bearer <Azure AD JWT token>`. <br/>For information on generating an Azure AD token, see [Authenticate from an application](get-azure-active-directory-token.md).</li><li>A SAS token. <br/>Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. <br/>For information on generating a SAS token, see [Generate a Shared Access Signature token](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas#generate-a-shared-access-signature-token) and [Generate SAS token](https://docs.microsoft.com/rest/api/eventhub/generate-sas-token).</li></ul> |    
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and the response body.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|200|Message successfully unlocked.|  
|401|Authorization failure.|  
|404|No message was found with the specified `MessageId` or `LockToken`.|  
|410|Specified queue or subscription does not exist.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/windowsazure/dd179382.aspx).  
  
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
 [Service Bus HTTP Client sample](https://code.msdn.microsoft.com/Service-Bus-HTTP-client-fe7da74a)