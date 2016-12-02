---
title: "Create Queue2"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 403c8a05-b9dd-48a4-a05a-7a7b140c63aa
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
# Create Queue
Creates a new queue. Once created, the queue resource manifest is immutable. This operation is idempotent. Repeating the create call after a queue with same name has been created successfully, results in a 409 Conflict error message.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{Namespace}/Queues/{Queue Path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|application/xml;type=entry;charset=utf-8|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 The following table describes the key elements of the request body:  
  
|Property Name|Type|Required|Description|  
|-------------------|----------|--------------|-----------------|  
||||  
|**MaxQueueSizeInMegaBytes**|Unsigned Integer|Required|This parameter specifies the maximum queue size in megabytes. Any attempt to enqueue a message that causes the queue to exceed this value will fail. Only user content counts towards this value. Settable at queue creation time and at runtime:<br /><br /> -   Range: 1–5*1024.<br /><br /> -   Default: 1\*1024.|  
|**QueueSizeinBytes**|Unsigned Integer|Read only. Not required at creation.|This parameter reflects the actual bytes that messages in the queue currently occupy toward the queue’s quota.<br /><br /> Range: 0 –**MaxTopicSizeinMegaBytes**|  
|**QueueDepth**|Unsigned Integer|Read-only. Not required at creation.|This parameter shows the number of messages currently in the queue.|  
|**DefaultMessageTimeToLive**|XML Datetime|Optional, default is 14 days.|Based on whether dead lettering is enabled, if a message has been stored in the queue for more than the specified time, it is automatically moved to the dead-letter queue or deleted. This value is overwritten by a TTL specified on the message if the message TTL is smaller than the TTL set on the queue. This value is immutable after the queue has been created:<br /><br /> -   Range: 1 second – 14 days.<br /><br /> -   Default: 14 days.|  
|**LockDuration**|XML Datetime|Optional, default is 30 seconds.|This setting determines the amount of time in seconds for which a message should be locked for processing by a receiver. After this period, the message is unlocked and available for consumption by the next receiver. Settable only at queue creation time:<br /><br /> -   Range: 0–5 min. 0 means that the message is not locked.<br /><br /> -   Default: 30 seconds.|  
|**RequiresSession**|Boolean|Optional|Settable only at queue creation time. If set to `true`, the queue will be session aware and only the `SessionReceiver` is supported. Session-aware queues are not supported through REST.<br /><br /> -   Default: False.|  
|**RequiresDuplicateDetection**|Boolean|Optional|Settable only at queue creation time.<br /><br /> -   Default for durable queue: **false**.|  
|**EnableDeadLetteringOnMessageExpiration**|Boolean|Optional|Settable only at queue creation time.<br /><br /> -   Default: **false**.<br /><br /> This field determines how Service Bus handles a message with an expired TTL. If **true** and a message expires, Service Bus moves the message from the queue into the queue’s dead-letter subqueue. If it is **false**, the message is permanently deleted from the queue.|  
|**DuplicateDetectionHistoryTimeWindow**|Time Span|Optional.|A property that specifies the time span during which Service Bus detects message duplication.<br /><br /> -   Range: 1 second–7 days.<br /><br /> -   Default: 10 minutes.|  
|**Status**|String|Read-only. Not required at creation.|Can be one of the following values:<br /><br /> -   **Creating**: when still in creation phase.<br />-   **Active**: by default after creation, or when user activates it after last time suspended.<br />-   **Suspended**: when user updates the entity to be suspended.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a queue with a name that contains special or encoded characters (for example, "test?Name=value&", which gets encoded to "test%3FName%3Dvalue%26"), a (400) Invalid request exception is generated.  
  
|Code|Description|  
|----------|-----------------|  
|201|Queue created.|  
|400|Invalid request body.|  
|401|Authorization failure.|  
|403|Quota exceeded; queue not created.|  
|409|The specified queue already exists (or the specified path is already occupied).|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179357.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 The queue description is returned. If they were missing from the PUT request, some description properties might contain default values.