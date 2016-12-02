---
title: "Update Queue3"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b436e4ec-ecba-4647-af90-3db0362fa8e2
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
# Update Queue
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
|**DefaultMessageTimeToLive**|XML Datetime|Based on whether dead lettering is enabled, if a message has been stored in the queue for more than the specified time, it is automatically moved to the dead-letter queue, or deleted. This value is overwritten by a TTL specified on the message if the message TTL is smaller than the TTL set on the queue. This value is immutable after the queue has been created:<br /><br /> -   Range: 1 second – 14 days.<br /><br /> -   Default: 14 days.|  
|**LockDuration**|XML Datetime|This setting determines the amount of time in seconds for which a message should be locked for processing by a receiver. After this period, the message is unlocked and available for consumption by the next receiver. Settable only at queue creation time:<br /><br /> -   Range: 0–5 min. 0 means that the message is not locked.<br /><br /> -   Default: 30 seconds.|  
|**EnableDeadLetteringOnMessageExpiration**|Boolean|Settable only at queue creation time.<br /><br /> -   Default: False.<br /><br /> This field governs how Service Bus handles a message with an expired TTL. If **true** and a message expires, Service Bus moves the message from the queue into the queue’s dead-letter subqueue. If **false**, the message is permanently deleted from the queue.|  
|**DuplicateDetectionHistoryTimeWindow**|Time Span|A property that specifies the time span during which Service Bus detects message duplication.<br /><br /> -   Range: 1 second–7 days.<br /><br /> -   Default: 10 minutes.|  
|**MaxDeliveryCount**|Unsigned Integer|The maximum number of times Service Bus will try to deliver a message before being dead-lettered or discarded. The default is 10.|  
  
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
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 None.