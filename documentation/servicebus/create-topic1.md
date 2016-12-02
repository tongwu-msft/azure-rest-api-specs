---
title: "Create Topic1"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b2c67f59-7d7d-4935-b165-d828ebe0b4e9
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
# Create Topic
Creates a new topic. Once created, this topic’s resource manifest is immutable. This operation is idempotent. Repeating the create call after a queue with same name has been created successfully, results in a “409 conflict” error message.  
  
 Please note the following:  
  
-   The topic is not immediately deleted. It is marked for deletion and the resource management agent retrieves this deletion request within 5 minutes. However, the UI should reflect this operation immediately according to the received HTTP code.  
  
-   The topic name is actually the URI path. The following regular expression validates each segment in the URI path after removing possible % encoding.  
  
-   The topic name should comply with the following RegEx.  
  
     `public static readonly Regex SafeMessagingEntityNameExpression = new Regex(@"^[\w-\.\$]*/?$", RegexOptions.Compiled | RegexOptions.ECMAScript);`  
  
     This means the following:  
  
    -   Entity segments can contain only letters, numbers, periods (.), hyphens (-), and underscores (_).  
  
    -   Multiple segments are allowed (for example, if queue name =  “a/b/c”, it contains three segments).  
  
    -   Forward slash (/) is not allowed as a prefix or suffix of the queue name.  
  
    -   Maximum number of characters is 50.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{Namespace}/Topics/{Topic Path}|HTTP/1.1|  
  
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
|**MaxTopicSizeInMegaBytes**|Unsigned Integer|Required.|This parameter specifies the maximum topic size in megabytes. Any attempt to enqueue a message that causes the topic to exceed this value will fail. Only user content counts towards this value. Settable at topic creation time and at runtime:<br /><br /> -   Range: 1–5*1024.<br /><br /> -   Default: 1\*1024.|  
|**TopicSizeinBytes**|Unsigned Integer|Read only. Not required at creation time.|This parameter reflects the actual number of bytes that messages in the topic currently occupy relative to the topic quota.<br /><br /> Range: 0 – **MaxTopicSizeinMegaBytes**|  
|**DefaultMessageTimeToLive**|XML Datetime|Optional.|Based on whether dead lettering is enabled, if a message has been stored in the topic for more than the specified time, it is automatically moved to the dead letter queue or deleted. This value is overwritten by a TTL specified on the message if the message TTL is smaller than the TTL set on the topic. This value is immutable after the topic has been created:<br /><br /> -   Range: 1 second – 14 days.<br /><br /> -   Default: 14 days.|  
|**RequiresDuplicateDetection**|Boolean|Optional.|Settable only at topic creation time.<br /><br /> -   Default for durable topic: False.|  
|**EnableDeadLetteringOnMessageExpiration**|Boolean|Optional.|Settable only at topic creation time.<br /><br /> -   Default: False.<br /><br /> This field determines how Service Bus handles a message with an expired TTL. If it is enabled and a message expires, Service Bus moves the message from the topic into the dead-letter subqueue for that topic. If disabled, the message is permanently deleted from the topic.|  
|**DuplicateDetectionHistoryTimeWindow**|Time Span|Optional.|A property that specifies the time span during which Service Bus detects message duplication.<br /><br /> -   Range: 1 second – 7 days.<br /><br /> -   Default: 10 minutes.|  
|**NumberOfSubscriptions**|Integer|Read only. Not required at creation time.|Number of topic subscriptions.|  
|**Status**|String|Read only.|One of the following values:<br /><br /> -   **Creating**: when still in the creation phase.<br />-   **Active**: by default after creation, or when the user activates it after last time suspended.<br />-   **Suspended**: when the user updates the entity to be suspended.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a topic with a name that contains special or encoded characters (for example, "test?Name=value&", which is encoded to "test%3FName%3Dvalue%26"), a (401) Unauthorized exception is generated.  
  
|Code|Description|  
|----------|-----------------|  
|201|Topic created successfully.|  
|400|Invalid request body.|  
|401|Authorization failure.|  
|403|Quota exceeded; queue not updated.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml;type=entry;charset=utf-8|  
  
### Response Body  
 The topic description is returned, because if some description properties were missing from the PUT request, they might contain default values.