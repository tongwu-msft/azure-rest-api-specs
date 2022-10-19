---
title: Queue Storage error codes (REST API) - Azure Storage
description: Get error codes for Azure Queue Storage.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Queue Storage error codes

The following table lists error codes that an operation on Azure Queue Storage might return:   
  
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
  
## See also  
 [Common REST API error codes](Common-REST-API-Error-Codes.md)   
 [Blob Storage error codes](Blob-Service-Error-Codes.md)   
 [Table Storage error codes](Table-Service-Error-Codes.md)   
 [Troubleshoot API operations](Troubleshooting-API-Operations.md)   
 [HttpStatusCode enumeration](https://go.microsoft.com/fwlink/?LinkId=152845)   
 [Azure Storage REST API reference](Azure-Storage-Services-REST-API-Reference.md)
