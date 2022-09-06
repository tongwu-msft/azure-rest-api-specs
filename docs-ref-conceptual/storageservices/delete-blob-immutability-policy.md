---
title: Delete Blob Immutability Policy (REST API)
titleSuffix: Azure Storage
description: The Delete Blob Immutability Policy operation deletes the immutability policy on a blob.
author: seanmcc-msft
ms.date: 07/16/2021
ms.service: storage
ms.topic: reference
ms.author: seanmcc
---

# Delete Blob Immutability Policy

The `Delete Blob Immutability Policy` operation deletes the immutability policy on a blob. This operation doesn't update the blob's `ETag`. This API is available in version 2020-06-12 and later.

## Request

You can construct the `Delete Blob Immutability Policy` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account, *mycontainer* with the name of your container, and *myblob* with the blob name for which the immutability policy will be deleted.

|Method|Request URI|HTTP version|
|------------|-----------------|------------------|
|`DELETE`|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=immutabilityPolicies`|HTTP/1.1| 

### URI parameters

You can specify the following additional parameters on the request URI.

|Parameter|Description|
|-------------|-----------|
|`snapshot`|Optional. The snapshot parameter is an opaque `DateTime` value that, when present, specifies the blob snapshot to set the tier on. For more information on working with blob snapshots, see [Creating a snapshot of a blob](Creating-a-Snapshot-of-a-Blob.md).|  
|`versionid`|Optional for version 2019-12-12 and later. The `versionid` parameter is an opaque `DateTime` value that, when present, specifies the version of the blob to set the tier on.| 
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|

### Request headers

The following table describes required and optional request headers.

|Request header|Description|
|------------|-----------------|
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  

This operation also supports the use of conditional headers to set the blob only if a specified condition is met. For more information, see [Specifying conditional headers for Blob Storage operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  

### Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

### Status code

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).

### Response headers

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).

|Response header|Description|
|------------|-----------------|
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|
|`x-ms-version`|Indicates the version of Blob Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  

## Authorization

The storage account owner can call this operation. Additionally, anyone with a shared access signature who has permission to the immutability policy, the `i` SAS permission, can call this operation.

## Remarks

Note the following if you delete the blob's immutability policy on Blob Storage or on a general purpose v2 account:

* Deleting the immutability policy on a snapshot or a version is allowed with version 2020-06-12 and later.
* The immutability policy must be in unlocked mode to be deleted.

For more information, see [Immutable storage](/azure/storage/blobs/storage-blob-immutable-storage).

## See also

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md)
