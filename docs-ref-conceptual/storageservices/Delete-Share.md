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

The `Delete Share` operation deletes the specified share or share snapshot. This API is fully supported, but be aware that this is a legacy management API.

It's a good idea to use [File Shares - Delete](/rest/api/storagerp/file-shares/delete) instead. It's provided by the storage resource provider (Microsoft.Storage). To learn more about programmatically interacting with `FileShare` resources by using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request

You can construct the `Delete Share` request as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`DELETE`|`https://myaccount.file.core.windows.net/myshare?restype=share`|HTTP/1.1|  
|`DELETE`|`https://myaccount.file.core.windows.net/myshare?sharesnapshot=<DateTime>&restype=share`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
## URI parameters

You can specify the following additional parameters in the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`sharesnapshot`|Optional. Version 2017-04-17 and later. The `sharesnapshot` parameter is an opaque `DateTime` value that, when present, specifies the share snapshot to delete. |
|`timeout`|Optional. The `timeout` parameter is expressed in seconds.  For more information, see [Setting timeouts for Azure Files operations](Setting-Timeouts-for-File-Service-Operations.md).|
  
## Request headers

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-delete-snapshots: { include, include-leased }`| Optional if the share has associated snapshots. Specify one of following options:<br /><ul><li>`include`: Delete the base share and all of its snapshots.</li><li>`include-leased`: Version 2020-02-10 and later. Delete the base share and all of its snapshots, even if one or more of the snapshots have active share leases.</li></ul> |
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
|`x-ms-lease-id: <ID>`|Required if the destination file share has an active lease. Available for version 2020-02-10 and later. If the request doesn't include the lease ID or it isn't valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified, and the destination file share doesn't currently have an active lease, the operation also fails with status code 412 (Precondition Failed).|
  
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

A successful operation returns status code 202 (Accepted). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
## Response headers

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?LinkId=73147).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files used to run the request.|  
|`Date` or `x-ms-date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|  
  
## Response body

None.  
  
## Authorization

Only the account owner can call this operation.  
  
## Remarks

When you delete a share, you can't create a share with the same name for at least 30 seconds. While the share is being deleted, attempts to re-create a share of the same name will fail with status code 409 (Conflict). The service returns additional error information, indicating that the share is being deleted. All other operations, including operations on any files under the share, will fail with status code 404 (Not Found) while the share is being deleted.  

Currently, deleting a share that has snapshots isn't allowed. The share snapshots can be individually deleted, or can be deleted together with the share, by using the `x-ms-delete-snapshots=include` header.

You should only specify `x-ms-delete-snapshots` for a request against the base share resource. If you specify this header on a request to delete an individual snapshot, Azure Files returns status code 400 (Invalid Query Parameter Value). If this header isn't specified on the delete request, and the share has associated snapshots, the Azure Files returns status code 409 (Share Has Snapshots).
  
## See also

[Operations on shares (Azure Files)](Operations-on-Shares--File-Service-.md)