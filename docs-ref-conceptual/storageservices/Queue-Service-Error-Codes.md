---
title: "Queue Service Error Codes"
ms.custom: na
ms.date: 2017-04-27
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: aaf9617a-85c8-4e7b-aca6-acd95d596faa
caps.latest.revision: 21
author: robinsh
manager: timlt
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Queue Service Error Codes
The error codes listed in the following table may be returned by an operation on the Queue service.  
  
|Error code|HTTP status code|User message|  
|----------------|----------------------|------------------|  
|InvalidMarker|Bad Request (400)|The specified marker is invalid.|  
|MessageNotFound|Not Found (404)|The specified message does not exist.|  
|MessageTooLarge|Bad Request (400)|The message exceeds the maximum allowed size.|  
|PopReceiptMismatch|Bad Request (400)|The specified pop receipt did not match the pop receipt for a dequeued message.|  
|QueueAlreadyExists|Conflict (409)|The specified queue already exists.|  
|QueueBeingDeleted|Conflict (409)|The specified queue is being deleted.|  
|QueueDisabled|Conflict (409)|The specified queue has been disabled by the administrator.|  
|QueueNotEmpty|Conflict (409)|The specified queue is not empty.|  
|QueueNotFound|Not Found (404)|The specified queue does not exist.|  
  
## See Also  
 [Common REST API Error Codes](Common-REST-API-Error-Codes.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Table Service Error Codes](Table-Service-Error-Codes.md)   
 [Troubleshooting API Operations](Troubleshooting-API-Operations.md)   
 [HttpStatusCode Enumeration](http://go.microsoft.com/fwlink/?LinkId=152845)   
 [Storage Services REST](Azure-Storage-Services-REST-API-Reference.md)
