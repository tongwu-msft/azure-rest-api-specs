---
title: "Create Subscription2"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7fbbf52f-67f1-4cae-95b3-1c6e1234fd7f
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
# Create Subscription
Creates a new subscription. Once created, the subscription resource manifest is immutable. This operation is not idempotent. Repeating the create call after a subscription with same name (under same topic and namespace) has been created successfully, results in a 409 Conflict error message.  
  
 If you create a subscription with a name that contains special or encoded characters (for example, "test?Name=value&", which gets encoded to "test%3FName%3Dvalue%26"), a (401) Unauthorized exception is generated.  
  
 Note the following subscription name restrictions:  
  
1.  Can only contain only letters, numbers, periods (.), hyphens (-), and underscores (_).  
  
2.  Multiple segments not allowed.  
  
3.  Forward slash (/) not allowed as a prefix or suffix of the subscription name.  
  
4.  Maximum number of characters is 50.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/Topics/Subscriptions/{Subscription Name}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|application/xml;type=entry;charset=utf-8|  
|Namespace|Management Endpoint url|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 The following table describes the key elements of the request body:  
  
|Property Name|Type|Description|  
|-------------------|----------|-----------------|    
|DefaultMessageTimeToLive|XML Datetime|Based on whether dead lettering is enabled, if a message has been stored in the topic for more than the specified time it is automatically moved to the dead letter queue, or deleted. This value is overwritten by a TTL specified on the message if the message TTL is smaller than the TTL set on the topic. This value is immutable after the topic has been created:<br /><br /> -   Range: 1 second – 14 days.<br /><br /> -   Default: 14 days.|  
|LockDuration|XML Datetime|This setting determines the amount of time, in seconds, in which a message should be locked for processing by a receiver. After this period, the message is unlocked and available for consumption by the next receiver. Settable only at topic creation time:<br /><br /> -   Range: 0–5 min. 0 means that the message is not locked.<br /><br /> -   Default: 30s.|  
|RequiresSession|Boolean|Settable only at topic creation time. If set to `true`, the topic is session aware and only `SessionReceiver` is supported. Session-aware topics are not supported through REST.<br /><br /> -   Default: False.|  
|EnableDeadLetteringOnMessageExpiration|Boolean|Settable only at subscription creation time.<br /><br /> -   Default: False.<br /><br /> This field determines how Service Bus handles a message with an expired TTL. If `true` and a message expires, Service Bus moves the message from the topic into the dead-letter subqueue for that topic. If `false`, the message is permanently deleted from the topic.|  
|DeadLetteringOnFilterEvaluationExceptions||Determines how Service Bus handles a message that causes an exception during a subscription filter evaluation. If `true`, the message that caused the exception is moved to the subscription’s dead-letter queue. Otherwise, it is discarded. By default, this parameter is set to `true`, enabling you to investigate the cause of the exception. It can occur from a malformed message, or incorrect assumptions being made in the filter about the form of the message. Settable only at topic creation time.<br /><br /> -   Default: true|  
|EnableBatchedOperations||Enables or disables service-side batching behavior when performing operations for the specific queue. When enabled, Service Bus collects/batches multiple operations to the backend, to be more efficient in the connection. If you want lower operation latency, you can disable this feature.<br /><br /> **Default:** false|  
|MaxDeliveryCount|Unsigned Integer|The maximum number of times Service Bus tries to deliver a message before the message is dead-lettered or discarded.<br /><br /> -   **Default:** 10|  
|MessageCount|Unsigned Integer|Reports the number of messages in the subscription not dequeued yet, as reported by the monitoring system.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a namespace with a name that contains special or encoded characters (for example, "test?Name=value&", which gets encoded to "test%3FName%3Dvalue%26"), a (401) Unauthorized exception is generated.  
  
|Code|Description|  
|----------|-----------------|  
|201|Subscription created successfully.|  
|400|Invalid request body.|  
|401|Authorization failure.|  
|403|Quota exceeded; subscription not created.|  
|409|The specified subscription already exists (or the specified path is already occupied).|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
 None.  
  
### Response Body  
 The subscription description is returned, because when the PUT request does not specify values for all attributes of the subscription, some description properties can contain default values.