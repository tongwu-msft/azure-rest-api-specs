---
title: Set Blob Tier (REST API) - Azure Storage
description: The Set Blob Tier operation sets the access tier on a blob.
author: pemari-msft

ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Set Blob Tier

The `Set Blob Tier` operation sets the access tier on a blob. The operation is allowed on a page blob in a premium storage account and on a block blob in a blob storage or general purpose v2 account. A premium page blob's tier determines the allowed size, IOPS, and bandwidth of the blob. A block blob's tier determines `Hot`/`Cool`/`Archive` storage type. This operation does not update the blob's ETag.

For detailed information about block blob level tiering see [Hot, cool and archive storage tiers](https://docs.microsoft.com/azure/storage/storage-blob-storage-tiers).  

## Request
The `Set Blob Tier` request may be constructed as follows. HTTPS is recommended. Replace myaccount with the name of your storage account and myblob with the blob name for which the tier is to be changed.

|Method|Request URI|HTTP Version|
|------------|-----------------|------------------|
|`PUT`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=tier`|HTTP/1.1| 

### URI Parameters
The following additional parameters may be specified on the request URI.

|Parameter|Description|
|-------------|-----------|
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|

### Request Headers
The following table describes required and optional request headers.

|Request Header|Description|
|------------|-----------------|
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-access-tier`|Required. Indicates the tier to be set on the blob. For a list of allowed premium page blob tiers, see [High-performance Premium Storage and managed disks for VMs](/azure/virtual-machines/windows/disks-types#premium-ssd). For blob storage or general purpose v2 account, valid values are `Hot`/`Cool`/`Archive`. For detailed information about standard blob account blob level tiering see [Hot, cool and archive storage tiers](https://docs.microsoft.com/azure/storage/storage-blob-storage-tiers).
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](http://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
|`x-ms-rehydrate-priority`|Optional. Indicates the priority with which to rehydrate an archived blob. Supported on version 2019-02-02 and newer for Block blobs. Valid values are `High`/`Standard`. The priority can be set on a blob only once. This header will be ignored on subsequent requests to the same blob. Default priority without this header is `Standard`. Setting priority is in preview. |

### Request Body
None.

## Response
The response includes an HTTP status code and a set of response headers.

### Status Code
A successful operation returns status code 200 (OK) if the new tier takes effect immediately, or status code 202 (Accepted) if the transition to the new tier is pending.
For premium account page blob operation returns status code 200 (OK).
For block blobs, below table describes the http status codes returned based on current tier and requested tier of the blob:

||Set to `Hot`|Set to `Cool`|Set to `Archive`|
|----------------|----------------------|------------------|------------------|  
|Blob in `Hot` Tier|200|200|200|
|Blob in `Cool` Tier|200|200|200|
|Blob in `Archive` Tier|202|202|200|
|Blob in `Archive` tier rehydrating to `Hot`|202|409|409|
|Blob in `Archive` tier rehydrating to `Cool`|409|202|409|

For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).
### Response Headers
The response for this operation includes the headers below. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).

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

Setting the block blob's tier on a blob storage or general purpose v2 account have the following restriction:
  * Setting the tier on a snapshot or a block blob with snapshots is not allowed.
  
The list of supported tiers is not restricted by the request version, and new tiers may be added in the future. 

> [!NOTE]
>  For detailed information about block blob level tiering see [Hot, cool and archive storage tiers](https://docs.microsoft.com/azure/storage/storage-blob-storage-tiers).

## See Also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
