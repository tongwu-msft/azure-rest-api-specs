---
title: Delete Share (FileREST API) - Azure Files
description: The Delete Share operation deletes the specified share or share snapshot.
author: wmgries

ms.date: 08/09/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Delete Share
The `Delete Share` operation deletes the specified share or share snapshot. While this API is fully supported, this is a legacy management API. We recommend using [File Shares - Delete](/rest/api/storagerp/file-shares/delete) provided by the storage resource provider (Microsoft.Storage) instead. To learn more about programmatically interacting with `FileShare` resources using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request
The `Delete Share` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.file.core.windows.net/myshare?restype=share`|HTTP/1.1|  
|`DELETE`|`https://myaccount.file.core.windows.net/myshare?sharesnapshot=<DateTime>&restype=share`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
## URI parameters
The following additional parameters can be specified in the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`sharesnapshot`|Optional. Version 2017-04-17 and newer. The sharesnapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to delete |
|`timeout`|Optional. The timeout parameter is expressed in seconds.  For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|
  
## Request headers
 The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-delete-snapshots: { include, include-leased }`| Optional if the share has associated snapshots. Specify one of following options:<br /><ul><li>`include`: Delete the base share and all of its snapshots.</li><li>`include-leased`: Delete the base share and all of its snapshots, even if one or more of the snapshots have active share leases.</li></ul> |
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
|`x-ms-lease-id: <ID>`|Required if the destination file share has an active lease. Available for versions 2020-02-10 and newer. If the request does not include the lease ID or it is not valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination file share does not currently have an active lease, the operation will also fail with status code 412 (Precondition Failed).|
  
## Request body
None.  
  
## Sample request
  
```  
DELETE https://myaccount.file.core.windows.net/myshare?restype=share HTTP/1.1  
  
Request Headers:  
x-ms-version: 2014-02-14  
x-ms-date: Mon, 27 Jan 2014 22:50:32 GMT  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ= TBD  
```  
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
## Status code
A successful operation returns status code 202 (Accepted).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
## Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?LinkId=73147).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date` or `x-ms-date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
## Response body
None.  
  
## Authorization
Only the account owner may call this operation.  
  
## Remarks
When a share is deleted, a share with the same name cannot be recreated for at least 30 seconds. While the share is being deleted, attempts to recreate a share of the same name will fail with status code 409 (Conflict), with the service returning additional error information indicating that the share is being deleted. All other operations, including operations on any files under the share, will fail with status code 404 (Not Found) while the share is being deleted.  

Deleting a share that has snapshots is currently not allowed. The share snapshots can be individually deleted or can be deleted together with the share using the `x-ms-delete-snapshots=include` header as stated above.

This header `x-ms-delete-snapshots` should be specified only for a request against the base share resource. If this header is specified on a request to delete an individual snapshot, the file service returns status code 400 (InvalidQueryParameterValue). If this header is not specified on the delete request and the share has associated snapshots, the file service returns status code 409 (ShareHasSnapshots).
  
## See also
[Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)
