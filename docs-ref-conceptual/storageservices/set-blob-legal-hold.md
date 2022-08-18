---
title: Set Blob Legal Hold (REST API)
titleSuffix: Azure Storage
description: The Set Blob Legal Hold operation sets the legal hold on a blob.
author: seanmcc-msft

ms.date: 07/16/2021
ms.service: storage
ms.topic: reference
ms.author: seanmcc
---

# Set Blob Legal Hold

The `Set Blob Legal Hold` operation sets the legal hold on a blob. This operation does not update the blob's ETag.  This API is available starting in version `2020-04-08`.

## Request
The `Set Blob Legal Hold` request may be constructed as follows. HTTPS is recommended. Replace myaccount with the name of your storage account and myblob with the blob name for which the legal hold is to be changed.

|Method|Request URI|HTTP Version|
|------------|-----------------|------------------|
|`PUT`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=legalhold`|HTTP/1.1| 

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
|`x-ms-legal-hold`|Optional. Indicates the legal hold to be set on the blob. For blob storage or general purpose v2 account, valid values are `true`/`false`.|
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  

### Request Body
None.

## Response
The response includes an HTTP status code and a set of response headers.

### Status Code
A successful operation returns status code 200 (OK).

For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).
### Response Headers
The response for this operation includes the headers below. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).

|Response Header|Description|
|------------|-----------------|
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and newer.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
|`x-ms-legal-hold`|Indicates the legal hold set on the blob. valid values are `true`/`false`.|

## Authorization
This operation can only be called by the storage account owner and by anyone with a Shared Access Signature that has permission to legal hold, the `i` SAS permission.

## Remarks
Setting the blob's legal hold on a blob storage or general purpose v2 account have the following restrictions:

* Setting legal hold on a snapshot or a version is allowed starting REST version 2020-06-12.
* When legal hold is set to true, user can't modify or delete the blob except some special operations, `PutBlockList/PutBlob/CopyBlob`, because these operations will generate a new version.

> [!NOTE]
> For detailed information about immutable storage, see [Immutable Storage](/azure/storage/blobs/storage-blob-immutable-storage).

## See Also

 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
