---
title: Delete Blob (REST API) - Azure Storage
description: The Delete Blob operation marks the specified blob or snapshot for deletion. The blob is later deleted during garbage collection. 
author: pemari-msft
ms.date: 02/01/2021
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Delete Blob

The `Delete Blob` operation marks the specified blob or snapshot for deletion. The blob is later deleted during garbage collection.  
  
 Note that in order to delete a blob, you must delete all of its snapshots. You can delete both at the same time with the `Delete Blob` operation.  
  
## Request  

You can construct the `Delete Blob` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account. 
  
|DELETE method request URI|HTTP version|  
|-------------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?versionid=<DateTime>`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.
  
|DELETE method request URI|HTTP version|  
|-------------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob`|HTTP/1.1|  
  
For more information, see [Use Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters  

You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`snapshot`|Optional. The snapshot parameter is an opaque `DateTime` value that, when present, specifies the blob snapshot to delete. For more information on working with blob snapshots, see [Creating a snapshot of a blob](Creating-a-Snapshot-of-a-Blob.md).|  
|`versionid`|Optional, version 2019-12-12 and later. The `versionid` parameter is an opaque `DateTime` value that, when present, specifies the version of the blob to delete.|    
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
|`deletetype`|Optional, version 2020-02-10 or later. The value of `deletetype` can only be `permanent`.
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease.<br /><br /> To perform this operation on a blob with an active lease, specify the valid lease ID for this header. If a valid lease ID isn't specified on the request, the operation fails with status code 403 (Forbidden).|  
|`x-ms-delete-snapshots: {include, only}`|Required if the blob has associated snapshots. Specify one of the following options:<br /><br /> -   `include`: Delete the base blob and all of its snapshots.<br />-   `only`: Delete only the blob's snapshots, and not the blob itself.<br /><br /> Specify this header only for a request against the base blob resource. If this header is specified on a request to delete an individual snapshot, Blob Storage returns status code 400 (Bad Request).<br /><br /> If this header isn't specified on the request and the blob has associated snapshots, Blob Storage returns status code 409 (Conflict).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  
  
 This operation also supports the use of conditional headers to delete the blob only if a specified condition is met. For more information, see [Specifying conditional headers for Blob Storage operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request body  

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 202 (Accepted). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|--------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`x-ms-delete-type-permanent`|For version 2017-07-29 and later, Blob Storage returns `true` if the blob has been permanently deleted, and `false` if the blob has been soft-deleted.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
## Authorization  

The account owner can perform this operation. Additionally, anyone using a shared access signature that has permission to delete the blob can perform this operation.  
  
## Remarks  

If the blob has an active lease, the client must specify a valid lease ID on the request in order to delete it.  
  
If a blob has a large number of snapshots, it's possible that the `Delete Blob` operation will time out. If this happens, the client should retry the request.  
  
For version 2013-08-15 and later, the client can call `Delete Blob` to delete uncommitted blobs. An *uncommitted blob* is a blob that was created with calls to the [Put Block](Put-Block.md) operation, but never committed by using the [Put Block List](Put-Block-List.md) operation. For earlier versions, the client must commit the blob first before deleting it.
  
### Soft-delete feature disabled

When a blob is successfully deleted, it's immediately removed from the storage account's index, and it's no longer accessible to clients. The blob's data is later removed from the service during garbage collection.

### Soft-delete feature enabled

When a blob is successfully deleted, it's softly deleted, and it's no longer accessible to clients. Blob Storage retains the blob or snapshot for the number of days specified for the `DeleteRetentionPolicy` property of Blob Storage. For information about reading Blob Storage properties, see [Set Blob Storage properties](Set-Blob-Service-Properties.md).

After the specified number of days, the blob’s data is removed from the service during garbage collection. A softly deleted blob or snapshot is accessible by calling the [List Blobs](List-Blobs.md) operation, and specifying the `include=deleted` option.

You can restore soft-deleted blobs or snapshots by using [Undelete Blob](Undelete-Blob.md). For any other operation on soft-deleted blobs or snapshots, Blob Storage returns error 404 (Resource Not Found). 
  
### Permanent delete

With version 2020-02-10 and later, you can permanently delete a soft-deleted snapshot or version. To do so, you enable the feature. For more for information, see [Set Blob Storage properties](Set-Blob-Service-Properties.md).

> [!NOTE]
> The storage account must have versioning or snapshots enabled. Soft-delete must also be enabled on the storage account to soft-delete versions or snapshots of blobs in the account. Permanent delete only deletes soft-deleted snapshots or versions. 

Storage accounts with permanent delete enabled can use the `deletetype=permanent` query parameter to permanently delete a soft-deleted snapshot or deleted blob version.

If the query parameter presents any of the following, Blob Storage returns a 409 error (Conflict):

- The permanent delete feature isn't enabled for the storage account.
- Neither `versionid` nor `snapshot` are provided.
- The specified snapshot or version isn't soft-deleted.

Permanent delete also includes a shared access signature permission to permanently delete a blob snapshot or blob version. For more information, see [Create a service SAS](create-service-sas.md).

## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)

[Status and error codes](Status-and-Error-Codes2.md)

[Blob Storage error codes](Blob-Service-Error-Codes.md)

[Undelete Blob](Undelete-Blob.md)

[List Blobs](List-Blobs.md)