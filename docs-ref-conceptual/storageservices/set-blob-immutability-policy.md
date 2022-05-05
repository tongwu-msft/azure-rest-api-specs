---
title: Set Blob Immutability Policy (REST API)
titleSuffix: Azure Storage
description: The Set Blob Immutability Policy operation sets the immutability policy on a blob.
author: seanmcc-msft

ms.date: 07/16/2021
ms.service: storage
ms.topic: reference
ms.author: seanmcc
---

# Set Blob Immutability Policy

The `Set Blob Immutability Policy` operation sets the immutability policy on a blob. This operation does not update the blob's ETag.  This API is available starting in version `2020-06-12`.

## Request
The `Set Blob Immutability Policy` request may be constructed as follows. HTTPS is recommended. Replace myaccount with the name of your storage account and myblob with the blob name for which the immutability policy is to be changed.

|Method|Request URI|HTTP Version|
|------------|-----------------|------------------|
|`PUT`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=immutabilityPolicies`|HTTP/1.1| 

### URI parameters
The following additional parameters may be specified on the request URI.

|Parameter|Description|
|-------------|-----------|
|`snapshot`|Optional. The snapshot parameter is an opaque `DateTime` value that, when present, specifies the blob snapshot to set tier on. For more information on working with blob snapshots, see [Creating a Snapshot of a Blob](Creating-a-Snapshot-of-a-Blob.md)|  
|`versionid`|Optional for versions 2019-12-12 and newer. The versionid parameter is an opaque `DateTime` value that, when present, specifies the version of the blob to set tier on.| 
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|

### Request headers
The following table describes required and optional request headers.

|Request Header|Description|
|------------|-----------------|
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-immutability-policy-until-date`|Required. Indicates the 'retention until' date to be set on the blob. This is the date until which the blob can be protected from being modified or deleted. For blob storage or general purpose v2 account, valid values are with RFC1123 format.  Past times are not valid.|
|`x-ms-immutability-policy-mode`|Optional. If not specified, default value is `Unlocked`. Indicates the immutability policy mode to be set on the blob. For blob storage or general purpose v2 account, valid values are `Unlocked`/`Locked`. `unlocked` indicates the user may change the policy by increasing or decreasing the retention-until date. `locked` indicates that these actions are prohibited.|
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  

 This operation also supports the use of conditional headers to set the blob only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  

### Request body
None.

## Response
The response includes an HTTP status code and a set of response headers.

### Status code
A successful operation returns status code 200 (OK).

For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).
### Response headers
The response for this operation includes the headers below. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).

|Response Header|Description|
|------------|-----------------|
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and newer.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
|`x-ms-immutability-policy-until-date`|Indicates the 'retention until' date to be set on the blob. This is the date until which the blob can be protected from being modified or deleted.|
|`x-ms-immutability-policy-mode`|Indicates the immutability policy mode set on the blob. Values are `unlocked`/`locked`. `unlocked` indicates the user may change the policy by increasing or decreasing the retention-until date. `locked` indicates that these actions are prohibited.|

## Authorization
This operation can only be called by the storage account owner and by anyone with a Shared Access Signature that has permission to immutability policy, the `i` SAS permission.

## Remarks
Setting the blob's immutability policy on a blob storage or general purpose v2 account have the following restrictions:

* Setting immutability policy on a snapshot or a version is allowed starting REST version 2020-06-12.
* When immutability policy in unlocked mode, user can update the retention until date. When immutability policy in locked mode, user can only extend the retention until date. Immutability policy mode can be set from unlocked to locked, but not the reverse.
* When there is immutability policy on a blob, and there is also default immutability policy on container or account, the blob immutability policy will take over the control and make effect.
* For blob level immutability policy, `PutBlockList/PutBlob/CopyBlob` operations are allowed, becuase these operations will generate a new version.
* When immutability policy in unlocked mode, user can delete immutability policy with below API:

|Method|Request URI|HTTP Version|
|------------|-----------------|------------------|
|`Delete`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=immutabilityPolicies`|HTTP/1.1| 

> [!NOTE]
> For detailed information about immutable storage, see [Immutable Storage](/azure/storage/blobs/storage-blob-immutable-storage).

## See Also

 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
