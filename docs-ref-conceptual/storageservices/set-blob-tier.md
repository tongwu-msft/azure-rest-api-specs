---
title: Set Blob Tier (REST API) - Azure Storage
description: The Set Blob Tier operation sets the access tier on a blob.
author: pemari-msft

ms.date: 06/02/2021
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Set Blob Tier

The `Set Blob Tier` operation sets the access tier on a blob. The operation is allowed on a page blob in a premium storage account and on a block blob in a blob storage or general purpose v2 account. A premium page blob's tier (`P1`/`P2`/`P3`/`P4` etc.) determines the allowed size, IOPS, and bandwidth of the blob. A block blob's tier determines `Hot`/`Cool`/`Archive` storage type. This operation does not update the blob's ETag.

For detailed information about block blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).  

## Request
The `Set Blob Tier` request may be constructed as follows. HTTPS is recommended. Replace myaccount with the name of your storage account and myblob with the blob name for which the tier is to be changed.

|Method|Request URI|HTTP Version|
|------------|-----------------|------------------|
|`PUT`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=tier`|HTTP/1.1| 

### URI Parameters
The following additional parameters may be specified on the request URI.

|Parameter|Description|
|-------------|-----------|
|`snapshot`|Optional. The snapshot parameter is an opaque `DateTime` value that, when present, specifies the blob snapshot to set tier on. For more information on working with blob snapshots, see [Creating a Snapshot of a Blob](Creating-a-Snapshot-of-a-Blob.md)|  
|`versionid`|Optional for versions 2019-12-12 and newer. The versionid parameter is an opaque `DateTime` value that, when present, specifies the version of the blob to set tier on.| 
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|

### Request Headers
The following table describes required and optional request headers.

|Request Header|Description|
|------------|-----------------|
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-access-tier`|Required. Indicates the tier to be set on the blob. For a list of allowed premium page blob tiers, see [High-performance Premium Storage and managed disks for VMs](/azure/virtual-machines/windows/disks-types#premium-ssd). For blob storage or general purpose v2 account, valid values are `Hot`/`Cool`/`Archive`. For detailed information about standard blob account blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
|`x-ms-rehydrate-priority`|Optional. Indicates the priority with which to rehydrate an archived blob. Supported on version 2019-02-02 and newer for block blobs. Valid values are `High`/`Standard`. The priority can be set on a blob only once for versions prior to 2020-06-12; this header will be ignored on subsequent requests. The default priority setting is `Standard`.<br /><br /> Beginning with version 2020-06-12, the rehydration priority can be updated after it was previously set. The priority setting can be changed from `Standard` to `High` by calling **Set Blob Tier** with this header set to `High` and setting `x-ms-access-tier` to the same value as previously set. The priority setting cannot be lowered from `High` to `Standard`. |

 This operation also supports the use of conditional headers to tier the blob only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  

### Request Body
None.

## Response
The response includes an HTTP status code and a set of response headers.

### Status Code
A successful operation returns status code 200 (OK) if the new tier takes effect immediately, or status code 202 (Accepted) if the transition to the new tier is pending.
For premium account page blob operation returns status code 200 (OK).
For block blobs, below table describes the http status codes returned based on current tier and requested tier of the blob:

|Tier|Set to hot tier|Set to cool tier|Set to archive tier|
|----------------|----------------------|------------------|------------------|  
|Blob in hot tier|200|200|200|
|Blob in cool tier|200|200|200|
|Blob in archive tier|202|202|200|
|Blob in archive tier, rehydrating to hot|202|409|409|
|Blob in archive tier, rehydrating to cool|409|202|409|

For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).
### Response Headers
The response for this operation includes the headers below. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).

|Response Header|Description|
|------------|-----------------|
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and newer.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  

## Authorization
This operation can only be called by the storage account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.

## Remarks
Setting a blob's tier for page blobs in premium accounts have the following restrictions:
  * The new blob tier may not be lower than the existing one.
  * The new blob tier should be able to accommodate the blob's content length. For a list of tiers and allowed content length, see [High-performance Premium Storage and managed disks for VMs](/azure/virtual-machines/windows/disks-types#premium-ssd).

Setting the block blob's tier on a blob storage or general purpose v2 account have the following restrictions:
  * Setting tier on a snapshot is allowed starting REST version 2019-12-12.
  * Snapshots tiered to archive cannot be rehydrated back into the snapshot. i.e the snapshot cannot be brought back to Hot/Cool tier. Only way to retrieve the data from an archived snapshot or version is to copy that to a new blob.
  * If the version is a root blob then that can be rehydrated back to Hot or Cool.
  * Snapshots or Versions in archived state are not allowed to be promoted to root.
  * When versioning is enabled, delete of root blob when in rehydrate pending will result in cancellation of rehydrate and the version will be in Archived state.
  * If a blob is overwritten when in rehydrate pending and softdeleted state, it will result in cancellation of rehydrate and the version or softdeleted snapshot will be in Archived state.

The list of supported tiers is not restricted by the request version, and new tiers may be added in the future.

> [!NOTE]
>  For detailed information about block blob level tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).

## See Also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
