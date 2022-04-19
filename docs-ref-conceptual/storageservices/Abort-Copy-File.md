---
title: Abort Copy File (FileREST API) - Azure Files
description: The Abort Copy File operation stops a pending Copy File operation, and leaves a destination file with zero length and full metadata.
author: wmgries

ms.date: 06/06/2021
ms.author: wgries
ms.service: storage
ms.topic: reference
---

# Abort Copy File

The `Abort Copy File` operation stops a pending `Copy File` operation, and leaves a destination file with zero length and full metadata. This operation applies to version 2015-02-21 and newer.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct the `Abort Copy File` request as follows. HTTPS is recommended.  
  
Beginning with version 2013-08-15, you can specify a shared access signature for the destination file if it's in the same account as the source file. Beginning with version 2015-04-05, you can also specify a shared access signature for the destination file if it's in a different storage account.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=copy&copyid=<id>`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the parent directory.|  
|`myfile`|The name of the file.|  
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

You can specify the following additional parameter on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds.|  
  
### Request headers

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This operation is available only in versions 2015-02-21 and later.<br /><br /> For more information, see [Versioning for the Azure Storage services](versioning-for-the-azure-storage-services.md).|  
|`x-ms-copy-action:abort`|Required.| 
|`x-ms-lease-id:<ID>`|Required if the destination file has an active lease. Available for versions 2019-02-02 and later. |
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit. This value is recorded in the analytics logs when you enable storage analytics logging. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|
  
### Request body

None.  
  
## Response  

The response includes an HTTP status code and a set of response headers.  
  
### Status code  

A successful operation returns status code 204 (*no content*). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).

### Response headers

The response for this operation includes the following headers. The response also includes additional standard HTTP headers. All standard headers conform to the HTTP/1.1 protocol specification.  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request.|  
|`x-ms-version`|Indicates the version of Azure Files used to run the request.|  
|`Date` or `x-ms-date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|  
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|
  
### Response body

None.  
  
## Authorization

Only the account owner can call this operation.  
  
## Remarks

When you stop a pending `Copy File` operation, the destination file's `x-ms-copy-status` header is set to `aborted`. Stopping a copy operation results in a destination file of zero length. However, the metadata for the destination file will have the new values copied from the source blob or file, or set explicitly in the `Copy File` operation call.  
  
You can only stop a copy operation that is pending. Trying to stop a copy that has completed, or failed, results in conflict error. Trying to stop a copy operation by using an incorrect copy ID also results in conflict error.
