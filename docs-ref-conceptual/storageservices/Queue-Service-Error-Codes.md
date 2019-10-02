---
title: Queue service error codes (REST API) - Azure Storage
description: Queue service error codes.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Queue service error codes

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
