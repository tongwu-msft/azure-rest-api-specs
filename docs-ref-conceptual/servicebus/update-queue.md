---
title: "Update Queue"
description: API reference documentation for the operations available in the Update Queue REST API, a RESTful web service for managing Update Queue resources in Azure.
ms.custom: ""
ms.date: "01/17/2021"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b436e4ec-ecba-4647-af90-3db0362fa8e2
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
# Update Queue

> [!IMPORTANT]
> This API is [**obsolete and retired**](/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.

Updates the queue description and sends the updates status to the FE/BE to update corresponding DB entries.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{Namespace}/Queues/{Queue Path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|application/xml;type=entry;charset=utf-8|  
|If-Match|*|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 The following table describes the key elements of the request body. These are the only properties that you can update. The body must include the full queue description, even if you are only changing one property. The recommended flow is as follows:  
  
1.  Get queue description.  
  
2.  Update the required elements.  
  
3.  Pass in the updated description.  
  
|Property Name|Type|Description|  
|-------------------|----------|-----------------|  
||||  
| **authorizationRules** |  AuthorizationRule[] | An array of authorization rules. | 
| **autoDeleteOnIdle** | String | Indicates whether an entity to be automatically deleted when it's idle for a certain time. | 
| **deadLetteringOnMessageExpiration**| Boolean | Settable only at queue creation time.<br /><br /> -   Default: False.<br /><br /> This field governs how Service Bus handles a message with an expired TTL. If **true** and a message expires, Service Bus moves the message from the queue into the queue’s dead-letter subqueue. If **false**, the message is permanently deleted from the queue.|  
| **defaultMessageTtl** | XML Datetime | Based on whether dead lettering is enabled, if a message has been stored in the queue for more than the specified time, it is automatically moved to the dead-letter queue, or deleted. This value is overwritten by a TTL specified on the message if the message TTL is smaller than the TTL set on the queue. This value is immutable after the queue has been created:<br /><br /> -   Range: 1 second – 14 days.<br /><br /> -   Default: 14 days.|  
| **duplicateDetectionHistoryTimeWindow** | Time Span | A property that specifies the time span during which Service Bus detects message duplication.<br /><br /> -   Range: 1 second–7 days.<br /><br /> -   Default: 10 minutes.|  
| **enableBatchedOperations** | Boolean | Indicate whether you want batched operations to be enabled or not. | 
| **forwardDeadLetteredMessagesTo** | String | Specify where you want the dead-lettered messages to be forwarded. |
| **forwardTo** | String | Specify where you want the messages to be forwarded. | 
| **lockDuration** | XML Datetime | This setting determines the amount of time in seconds for which a message should be locked for processing by a receiver. After this period, the message is unlocked and available for consumption by the next receiver. Settable only at queue creation time:<br /><br /> -   Range: 0–5 min. 0 means that the message is not locked.<br /><br /> -   Default: 30 seconds.|  
| **maxDeliveryCount** | Unsigned Integer | The maximum number of times Service Bus will try to deliver a message before being dead-lettered or discarded. The default is 10.|  
| **maxSizeInMegabytes** | Unsigned Integer | The maximum size in mega bytes. |
| **status** | EntityStatus | Status of the entity. | 
| **userMetadata** | String | User metadata. | 

These properties can't be updated: `requireSession`, `requiresDuplicateDetection`, `enablePartitioning`, and `name`. 

   
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a queue with a name that contains special or encoded characters (for example, "test?Name=value&", which gets encoded to "test%3FName%3Dvalue%26"), a (401) Unauthorized exception will be generated.  
  
|Code|Description|  
|----------|-----------------|  
|200|Successfully updated queue description.|  
|401|Authorization failure.|  
|404|Entity does not exist under this namespace.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](https://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 None.
