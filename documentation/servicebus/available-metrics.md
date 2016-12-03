---
title: "Available Metrics"
ms.custom: ""
ms.date: "05/13/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1732a9b5-d23a-467e-8421-1870c6f1387b
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
# Available Metrics
## Available Metrics  
 Telemetry data includes the following metrics:  
  
|Metric Name|Applicable Entities|Metric Key|Description|  
|-----------------|-------------------------|----------------|-----------------|  
|**Length**|Queue, Subscription|LEN|Number of messages in the queue or subscription at the end of the selected interval.|  
|**Size**|Queue, Topic|SIZE|Number of bytes the entity occupies regardless of the number of messages at the end of selected interval.|  
|**Incoming messages**|Queue, Topic|INMSGS|Total number of incoming messages in selected interval.|  
|**Outgoing messages**|Queue, Topic|OUTMSGS|Total number of outgoing messages in selected interval.|  
|**Successful operations**|Queue, Topic, Subscription|SUCCREQ|Total number of successful run-time operations. Management operations, such as entity update operation, are not counted.|  
|**Failed operations**|Queue, Topic, Subscription|FAILREQ|Total number of failed operations. This is the sum of the following three failed operations counters.|  
|**Internal Server Errors**|Queue, Topic, Subscription|INTERR|Total number of internal server errors exceptions sent back to sender/receiver while performing run-time operations. This type of error is due to either service-side or network problems.|  
|**Server Busy Errors**|Queue, Topic, Subscription|SVRBSY|Service Bus generates this type of error when it throttles the sender or receiver because there are not enough resources to process the requests.|  
|**User Errors** (Other Errors)|Queue, Topic, Subscription|MISCERR|These types of errors are due to faults at the sender/receiver side, such as providing bad parameters, not enough credentials, or trying to perform an operation on a nonexistent entity.|  
|**Incoming Requests**|Queue, Topic, Subscription|INREQS|Total number of incoming requests.|