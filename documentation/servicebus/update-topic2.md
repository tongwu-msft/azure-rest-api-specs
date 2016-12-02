---
title: "Update Topic2"
ms.custom: ""
ms.date: "06/02/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2d93e405-b07f-4f1f-b051-dd9c19bef534
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
# Update Topic
Updates a topic. The updated descriptor is sent in the request body. The API updates the topic entries in the FE/BE entries.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{Namespace}/Topics/{Topic Path}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|x-ms-version|**2012-03-01**|  
|If-Match|*|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 The following table describes the key elements of the request body. These are the only properties that you can update. The body must include the full topic description, even if you are only changing one property. The recommended flow is as follows:  
  
1.  Get topic description.  
  
2.  Update the required elements.  
  
3.  Pass in the updated description.  
  
|Property Name|Type|Description|  
|-------------------|----------|-----------------|    
|**DefaultMessageTimeToLive**|XML Datetime|Based on whether dead lettering is enabled, if a message has been stored in the topic for more than the specified time, it is automatically moved to the dead-letter queue or deleted. This value is overwritten by a TTL specified on the message if the message TTL is smaller than the TTL set on the topic. This value is immutable after the topic has been created:<br /><br /> -   Range: 1 second – 14 days.<br /><br /> -   Default: 14 days.|  
|**DuplicateDetectionHistoryTimeWindow**|Time Span|A property that specifies the time span during which Service Bus detects message duplication.<br /><br /> -   Range: 1 second – 7 days.<br /><br /> -   Default: 10 minutes.|  
|**EnableFilteringMessagesBeforePublishing**|Boolean|A property that specifies whether or not to apply filtering before publishing the message. For more information, see <xref:Microsoft.ServiceBus.Messaging.TopicDescription.EnableFilteringMessagesBeforePublishing%2A>.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a topic with a name that contains special or encoded characters (for example, "test?Name=value&", which gets encoded to "test%3FName%3Dvalue%26"), a (401) Unauthorized exception is generated.  
  
|Code|Description|  
|----------|-----------------|  
|200|Successfully updated topic description.|  
|401|Authorization failure.|  
|404|Entity does not exist under this namespace.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179382.aspx).  
  
### Response Headers  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml;type=entry;charset=utf-8|  
  
### Response Body  
 If this operation is successful, an updated topic descriptor is returned in the response body.