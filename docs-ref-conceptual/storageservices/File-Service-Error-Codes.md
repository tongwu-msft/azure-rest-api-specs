---
title: Azure Files error codes (REST API) - Azure Storage
description: Get error codes for Azure Files operations.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Azure Files error codes

The following table lists error codes that an operation might return against the Azure Files service:  
  
|Error code|HTTP status code|User message|  
|----------------|----------------------|------------------|  
|CannotDeleteFileOrDirectory|Conflict (409)|The file or directory could not be deleted because it is in use by an SMB client.|  
|ClientCacheFlushDelay|Internal Server Error (500)|The specified resource state could not be flushed from an SMB client in the specified time.|  
|DeletePending|Conflict (409)|The specified resource is marked for deletion by an SMB client.|  
|DirectoryNotEmpty|Conflict (409)|The specified directory is not empty.|  
|FileLockConflict|Conflict (409)|A portion of the specified file is locked by an SMB client.|  
|InvalidFileOrDirectoryPathName|Bad Request (400)|File or directory path is too long.|  
|InvalidFileOrDirectoryPathName|Bad Request (400)|File or directory path has too many subdirectories.|  
|ParentNotFound|Not Found (404)|The specified parent path does not exist.|  
|ReadOnlyAttribute|Conflict (409)|The specified resource is read-only and cannot be modified at this time.|  
|ShareAlreadyExists|Conflict (409)|The specified share already exists.|  
|ShareBeingDeleted|Conflict (409)|The specified share is being deleted. Try operation later.|  
|ShareDisabled|Forbidden (403)|The specified share is disabled by the administrator.|  
|ShareNotFound|Not Found (404)|The specified share does not exist.|  
|SharingViolation|Conflict (409)|The specified resource may be in use by an SMB client.|  
|ShareSnapshotInProgress|Conflict (409)|Another Share Snapshot operation is in progress.|
|ShareSnapshotCountExceeded|Conflict (409)|The total number of snapshots for the share is over the limit.|
|ShareSnapshotOperationNotSupported|Bad Request (400)|The operation is not supported on a share snapshot.|
|ShareHasSnapshots|Conflict (409)|The share has snapshots and the operation requires no snapshots.|
|ContainerQuotaDowngradeNotAllowed|Conflict (409)|Cannot downgrade quota at this moment. Please check share properties for the next allowed quota downgrade time.|

## See also  

 [Status and error codes](Status-and-Error-Codes2.md)
