---
title: Undelete Blob (REST API) - Azure Storage
description: The Undelete Blob operation restores the contents and metadata of a soft-deleted blob, and any associated soft-deleted snapshots.
author: pemari-msft
ms.date: 01/07/2022
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Undelete Blob

The `Undelete Blob` operation restores the contents and metadata of a soft-deleted blob, and any associated soft-deleted snapshots.

`Undelete Blob` is supported only on version 2017-07-29 or later.  
  
## Request  

You can construct the `Undelete Blob` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.  
  
|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=undelete`|HTTP/1.1|  
  
### Emulated storage service URI  

When you make a request against the emulated storage service, specify the emulator hostname and Azure Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.  
  
|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/ devstoreaccount1/mycontainer/myblob?comp=undelete`|HTTP/1.1|  
  
For more information, see [Use Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters  

You can specify the following additional parameter on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers (all blob types)  

The following table describes required and optional request headers for all blob types.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|   
|`x-ms-undelete-source`|Optional. Version 2020-08-04 and later. Only for accounts enabled with hierarchical namespace. The path of the soft-deleted blob to undelete. The format is `blobPath?deletionid=<id>`. The account and container name aren't included in the path. `DeletionId` is the unique identifier of the soft-deleted blob. You can retrieve it by listing soft-deleted blobs with the `List Blobs` REST API for accounts enable with hierarchical namespace. The path should be percent encoded.| 
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|
  
### Request body  

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Syntax|Description|  
|------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Blob Storage used to run the request.|  
|`Date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
### Response body  

None.  
  
## Authorization  

The account owner can call the `Undelete Blob` operation. Additionally, anyone with a shared access signature who has permission to write to this blob or its container can call the operation. Finally, a security principal who is assigned a role with the `Microsoft.Storage/storageAccounts/blobServices/containers/write` action can also call the operation.  
  
## Remarks  

When you undelete a soft-deleted blob, the blob and any associated snapshots are available for operations by using other APIs. When you undelete a blob that isn't soft-deleted or has no soft-deleted snapshots, the operation succeeds without any changes.
  
## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)
[Delete Blob](Delete-Blob.md)
