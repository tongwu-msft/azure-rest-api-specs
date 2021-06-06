---
title: Create Share (FileREST API) - Azure Files
description: The Create Share operation creates a new Azure file share under the specified account. If the share with the same name already exists, the operation fails. 
author: wmgries

ms.date: 09/12/2020
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Create Share
The `Create Share` operation creates a new Azure file share under the specified account. While this API is fully supported, this is a legacy management API. We recommend using [File Shares - Create](/rest/api/storagerp/file-shares/create) provided by the storage resource provider (Microsoft.Storage) instead. To learn more about programmatically interacting with `FileShare` resources using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).
  
If the share with the same name already exists, the operation fails. The share resource includes metadata and properties for that share. It does not include a list of the files contained by the share.  

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |

## Request
The `Create Share` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare?restype=share`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share. Note that it may include only lower-case characters.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. A name-value pair to associate with the share as metadata.<br /><br /> Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).|  
|`x-ms-share-quota`|Optional. Supported in version 2015-02-21 and above. Specifies the maximum size of the share, in GiB.|  
|`x-ms-access-tier`|Optional. Supported in version 2019-12-12 and above. Specifies the access tier of the share. Valid values are `TransactionOptimized`, `Hot`, `Cool`. For detailed information about file share tiers see [Azure files storage tiers](/azure/storage/files/storage-files-planning#storage-tiers)|  
|`x-ms-enabled-protocols: <SMB | NFS>`|Optional. Supported in version 2020-02-10 and above. Specifies the enabled protocols on the share. If not specified, the default is SMB.<br /><br /><ul><li>`SMB`: The share can be accessed by SMBv3.0, SMBv2.1 and REST.</li><li>`NFS`: The share can be accessed by NFSv4.1.</li></ul>|  
|`x-ms-root-squash: <NoRootSquash | RootSquash | AllSquash>`|Optional. Supported in version 2020-02-10 and above. Specifies the root squashing behavior on the share when NFS is enabled. If not specified, the default is NoRootSquash. <br /><br /><ul><li>`NoRootSquash`: Turn off root squashing.</li><li>`RootSquash`: Map requests from uid/gid 0 to the anonymous uid/gid.</li><li>`AllSquash`: Map all uids and gids to the anonymous user.</li></ul>|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
  
### Request body
None.  
  
### Sample request

```
PUT https://myaccount.file.core.windows.net/myshare?restype=share HTTP/1.1  
  
Request Headers:  
x-ms-version: 2020-02-10  
x-ms-date: <date>  
x-ms-meta-Name: StorageSample  
x-ms-enabled-protocols: NFS
x-ms-root-squash: RootSquash
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 201 (Created).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the share, in quotes.|  
|`Last-Modified`|Returns the date and time the share was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the share or its properties or metadata updates the last modified time. Operations on files do not affect the last modified time of the share.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|
  
### Response body
None.  
  
### Sample response  
  
```
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Transfer-Encoding: chunked  
Date: <date>  
ETag: "0x8CB14C3E29B7E82"  
Last-Modified: <date>  
x-ms-version: 2020-02-10  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization
Only the account owner may call this operation.  
  
## Remarks
Shares are created immediately beneath the storage account. It's not possible to nest one share beneath another.  
  
You can specify metadata for a share at the time it is created by including one or more metadata headers on the request. The format for the metadata header is `x-ms-meta-name:value`.  
  
If a share by the same name is being deleted when `Create Share` is called, the server will return status code 409 (Conflict), with additional error information indicating that the share is being deleted.  
  
The share size quota can be used to limit the size of files stored on the share.  It does not limit the size of snapshots.  The overhead associated with files that is used in computing the billing size for the storage account is not accounted for in the quota.  
  
When the sum of the sizes of the files on the share exceeds the quota set on the share, attempts to increase the size of a file will fail, and creating new non-empty files (via REST) will fail. You will still be able to create empty files.  
  
Changing or setting the quota has no effect on billing. You will still be billed for the size of the files plus the overhead.  
  
## See also
[Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)