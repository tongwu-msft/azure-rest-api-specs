---
title: Storage Analytics logged operations and status messages (REST API) - Azure Storage
description: Storage Analytics logging records the details for both successful and failed requests for your storage account.
author: pemari-msft

ms.date: 06/12/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Storage Analytics logged operations and status messages

This topic lists the storage service operations and status messages that are recorded by Storage Analytics.  

## Logged Request Status Messages

 The following table contains the status messages that are logged and reported in metrics data. A definition for each column is listed below:  

1.  **Status Message**: The status message for a request logged by Storage Analytics. This value is included in log entries and is the name of a column in each Metrics table.  

2.  **Description**: A description of the status message including HTTP verbs and status codes, if applicable.  

3.  **Billable**: A yes/no value that indicates whether or not the request is billable. For more information on billing in Azure Storage, see [Understanding Azure Storage Billing - Bandwidth, Transactions, and Capacity](/archive/blogs/windowsazurestorage/understanding-windows-azure-storage-billing-bandwidth-transactions-and-capacity).  

4.  **Availability**: A yes/no value that indicates whether or not the request is included in the availability calculation for a storage service or a specific API operation. All unexpected errors result in reduced availability for the storage service or the specified API operation.  

|Status Message|Information|Billable|Availability|  
|--------------------|-----------------|--------------|------------------|  
|**Success**|Successful request.|Yes|Yes|  
|**AnonymousSuccess**|Successful anonymous request.|Yes|Yes|  
|**SASSuccess**|Successful Shared Access Signature (SAS) request.|Yes|Yes|  
|**ThrottlingError**|Authorized request that returned an HTTP 503 status code.|No|No|  
|**AnonymousThrottlingError**|Anonymous request that returned an HTTP 503 status code.|No|No|  
|**SASThrottlingError**|SAS request that returned an HTTP 503 status code.|No|No|  
|**ClientTimeoutError**|Timed-out authorized request that returned an HTTP 500 status code. If the client’s network timeout or the request timeout is set to a lower value than expected by the storage service, this is an expected timeout. Otherwise, it is reported as a **ServerTimeoutError**.|Yes|Yes|  
|**AnonymousClientTimeoutError**|Timed-out anonymous request that returned an HTTP 500 status code. If the client’s network timeout or the request timeout is set to a lower value than expected by the storage service, this is an expected timeout. Otherwise, it is reported as an **AnonymousServerTimeoutError**.|Yes|Yes|  
|**SASClientTimeoutError**|Timed-out SAS request that returned an HTTP 500 status code. If the client’s network timeout or the request timeout is set to a lower value than expected by the storage service, this is an expected timeout. Otherwise, it is reported as an **SASServerTimeoutError**.|Yes|Yes|  
|**ServerTimeoutError**|Timed-out authorized request that returned an HTTP 500 status code. The timeout occurred due to a server error.|No|Yes|  
|**AnonymousServerTimeoutError**|Timed-out anonymous request that returned an HTTP 500 status code. The timeout occurred due to a server error.|No|Yes|  
|**SASServerTimeoutError**|Timed-out SAS request that returned an HTTP 500 status code. The timeout occurred due to a server error.|No|Yes|  
|**ClientOtherError**|Authorized request that failed as expected. This error can represent many 300-400 level HTTP status codes and conditions such as NotFound and ResourceAlreadyExists.|Yes|Yes|  
|**SASClientOtherError**|SAS request that failed as expected.|Yes|Yes|  
|**AnonymousClientOtherError**|Anonymous request that failed as expected, most commonly a request that failed a specified precondition.|Yes|Yes|  
|**ServerOtherError**|Authorized request that failed due to unknown server errors, most commonly returning an HTTP 500 status code.|No|Yes|  
|**AnonymousServerOtherError**|Anonymous request that failed due to unknown server errors, most commonly returning an HTTP 500 status code.|No|Yes|  
|**SASServerOtherError**|SAS request that failed due to unknown server errors, most commonly returning an HTTP 500 status code.|No|Yes|  
|**AuthorizationError**|Authorized request that failed due to unauthorized access of data or an authorization failure.|Yes|Yes|  
|**AnonymousAuthorizationError**|Anonymous request that failed due to unauthorized access of data or an authorization failure.|No|No|  
|**SASAuthorizationError**|SAS request that failed due to unauthorized access of data or an authorization failure.|Yes|Yes|  
|**NetworkError**|Authorized request that failed due to network errors. Most commonly occurs when a client prematurely closes a connection before timeout expiration.|Yes|Yes|  
|**AnonymousNetworkError**|Anonymous request that failed due to network errors. Most commonly occurs when a client prematurely closes a connection before timeout expiration.|Yes|Yes|  
|**SASNetworkError**|SAS request that failed due to network errors. Most commonly occurs when a client prematurely closes a connection before timeout expiration.|Yes|Yes|  

## Logged Operations

 The following table contains the operations that are logged for the corresponding storage service:  

|Storage Service|Operation|  
|---------------------|---------------|  
|[Blob Service REST API](Blob-Service-REST-API.md)|-   **AbortCopyBlob**<br />-  **AcquireBlobLease**<br />-   **AcquireContainerLease**<br />-   **BreakBlobLease**<br />-   **BreakContainerLease**<br />-   **ChangeBlobLease**<br />-  **AppendBlock**<br />- **ChangeContainerLease**<br />-   **ClearPage**<br />-   **CopyBlob**, including internal-only operations **CopyBlobSource** and **CopyBlobDestination**. These internal operations will only exist in logging data.<br />-   **CreateContainer**<br />-   **DeleteBlob**<br />-   **DeleteContainer**<br />-  **FindBlobsByTags**<br />- **GetAccountInformation**<br />- **GetBlob**<br />-   **GetBlobMetadata**<br />-   **GetBlobProperties**<br />-  **GetBlobServiceStats**<br />- **GetBlobTags**<br />- **GetBlockList**<br />-   **GetContainerACL**<br />-   **GetContainerMetadata**<br />-   **GetContainerProperties**<br />-   **GetBlobLeaseInfo**<br />-  **GetPageRanges**<br />-  **GetUserDelegationKey**<br />- **IncrementalCopyBlob**<br />- **ListBlobs**<br />-   **ListContainers**<br />-   **PutBlob**<br />-   **PutBlock**<br />-   **PutBlockFromURL**<br />- **PutBlockList**<br />-  **PutPage**<br />-  **QueryBlobContents**<br />-  **RenewBlobLease**<br />-   **RenewContainerLease**<br />-   **ReleaseBlobLease**<br />-   **ReleaseContainerLease**<br />-   **SetBlobMetadata**<br />-  **SetBlobExpiry**<br />- **SetBlobTags**<br />-  **SetBlobTier**<br />- **SetBlobProperties**<br />-   **SetContainerACL**<br />-   **SetContainerMetadata**<br />-   **SnapshotBlob**<br />-   **SetBlobServiceProperties**<br />-  **UndeleteBlob**<br />-  **GetBlobServiceProperties**<br />-   **BlobPreflightRequest**|
|[Azure Data Lake Storage Gen2 REST API](Data-Lake-Storage-Gen2.md)|-   **ListFilesystems**<br />-   **CreateFilesystem**<br />-   **DeleteFilesystem**<br />-   **GetFilesystemProperties**<br />-   **SetFilesystemProperties**<br />-   **ListFilesystemDir**<br />-   **ListFilesystemFile**<br />-   **CreatePathFile**<br />-   **CreatePathDir**<br />-   **DeleteFile**<br />-   **DeleteDirectory**<br />-   **GetFileProperties**<br />-   **SetFileProperties**<br />-   **SetPathAccessControl**<br />-   **GetPathAccessControl**<br />-   **GetPathStatus**<br />-   **AppendFile**<br />-   **FlushFile**<br />-   **LeaseFile**<br />-   **ReadFile**<br />-   **RenamePathFile**<br />-   **RenamePathDir**|
|[File service REST API](File-Service-REST-API.md)|-   **AbortCopyFile**<br />-   **AcquireFileLease**<br />-   **BreakFileLease**<br />-   **ChangeFileLease**<br />-   **ClearRange**<br />-   **ListFilesystemDir**<br />-   **CopyFile**<br />-   **CopyFileDestination**<br />-   **CopyFileDestination**<br />-   **CopyFileSource**<br />-   **CreateDirectory**<br />-   **GetFileProperties**<br />-   **CreateFile**<br />-   **CreateFileSnapshot**<br />-   **CreateShare**<br />-   **DeleteDirectory**<br />-   **DeleteFile**<br />-   **DeleteShare**<br />-   **FilePreflightRequest**<br />-   **FileSessionConnect**<br />-   **GetDirectoryMetadata**   **GetDirectoryProperties**<br />-  **GetEncryptionKey**<br />-   **GetFile**<br />-   **GetFileCopyInformation**<br />-   **GetFileMetadata**<br />-   **GetFilePermission**<br />-   **GetFileProperties**<br />-   **GetFileServiceProperties**<br />-   **GetFileShareUniqueId**<br />-   **GetPostMigrationFileInfo**<br />-   **CopyFileSource**<br />-   **GetShareAcl**<br />-   **GetShareMetadata**<br />-   **GetShareProperties**<br />-   **GetShareStats**<br />-   **ListFileRanges**<br />-   **ListFiles**<br />-   **ListFileSnapshots**<br />-   **ListHandles**<br />-   **ListShares**<br />-   **PutFilePermission**<br />-   **PutRange**<br />-   **GetFilePermission**<br />-   **GetFileProperties**<br />-   **GetFileServiceProperties**<br />-   **GetFileShareUniqueId**<br />-   **PutRangeFromURL**<br />-   **ReleaseFileLease**<br />-   **SetDirectoryMetadata**<br />-   **SetFileMetadata**<br />-   **SetFileMetadata**<br />-   **SetFileProperties**<br />-   **SetFileServiceProperties**<br />-   **SetShareAcl**<br />-   **SetShareMetadata**<br />-   **SetShareProperties**<br />-   **SnapshotShare** |
|[File service SMB API](/windows/win32/fileio/microsoft-smb-protocol-and-cifs-protocol-overview)|-   **Cancel**<br />-   **ChangeNotify**<br />-   **Close**<br />-   **Create**<br />-   **Echo**<br />-   **Flush**<br />-   **Ioctl**<br />-   **Lock**<br />-   **Logoff**<br />-   **Negotiate**<br />-   **OplockBreak**<br />-   **QueryDirectory**<br />-   **QueryInfo**<br />-   **Read**<br />-   **SessionSetup**<br />-   **SetInfo**<br />-   **TreeConnect**<br />-   **TreeDisconnect**<br />-   **Write**|
|[Table Service REST API](Table-Service-REST-API.md)|-   **EntityGroupTransaction**<br />-   **CreateTable**<br />-   **DeleteTable**<br />-   **DeleteEntity**<br />-   **InsertEntity**<br />-   **InsertOrMergeEntity**<br />-   **InsertOrReplaceEntity**<br />-   **QueryEntity**<br />-   **QueryEntities**<br />-   **QueryTable**<br />-   **QueryTables**<br />-   **UpdateEntity**<br />-   **MergeEntity**<br />-   **SetTableServiceProperties**<br />-   **GetTableServiceProperties**<br />-   **TablePreflightRequest**|
|[Queue Service REST API](Queue-Service-REST-API.md)|-   **ClearMessages**<br />-   **CreateQueue**<br />-   **DeleteQueue**<br />-   **DeleteMessage**<br />-   **GetQueueMetadata**<br />-   **GetQueue**<br />-   **GetMessage**<br />-   **GetMessageWrite** _(Called the Get Message API, and messages were returned. The queue was non-empty)_<br />-   **GetMessageRead** _(Called the Get Message API, and no messages were returned. The queue is empty)_<br />-   **GetMessages**<br />-   **ListQueues**<br />-   **PeekMessage**<br />-   **PeekMessages**<br />-   **PutMessage**<br />-   **SetQueueMetadata**<br />-   **SetQueueServiceProperties**<br />-   **GetQueueServiceProperties**<br />-   **UpdateMessage**<br />-   **QueuePreflightRequest**|

## See Also

 [About Storage Analytics Logging](About-Storage-Analytics-Logging.md)
 [About Storage Analytics Metrics](About-Storage-Analytics-Metrics.md)
 [Storage Analytics Metrics Table Schema](Storage-Analytics-Metrics-Table-Schema.md)
