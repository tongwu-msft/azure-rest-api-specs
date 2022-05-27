---
title: Create Share (FileREST API) - Azure Files
description: The Create Share operation creates a new Azure Files share under the specified account. If the share with the same name already exists, the operation fails. 
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Create Share
The `Create Share` operation creates a new Azure Files share under the specified account. Although this API is fully supported, this is a legacy management API. We recommend that you instead use [File Shares - Create](/rest/api/storagerp/file-shares/create), which is provided by the Azure Storage resource provider (Microsoft.Storage). To learn more about how to programmatically interact with `FileShare` resources by using the Azure Storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).
  
If a share with the same name already exists, the operation fails. The share resource includes metadata and properties for that share. It doesn't include a list of the files that are contained in the share.  

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| Server Message Block (SMB) | ![Yes](./media/yes-icon.png) |
| Network File System (NFS) | ![Yes](./media/yes-icon.png) |

## Request

You can construct the `Create Share` request as shown here. We recommend that you use HTTPS.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare?restype=share`|HTTP/1.1|  
  
Replace the path components that are shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share. The name can contain only lowercase characters.|  
  
For more information about path-naming restrictions, see [Name and reference shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Set time-outs for File service operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers

The required and optional request headers are described in the following table:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. A name-value pair to associate with the share as metadata.<br /><br /> Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).|  
|`x-ms-share-quota`|Optional. Supported in version 2015-02-21 and later. Specifies the maximum size of the share, in gibibytes (GiB).|  
|`x-ms-access-tier`|Optional. Supported in version 2019-12-12 and later. Specifies the access tier of the share. Valid values are `TransactionOptimized`, `Hot`, and `Cool`. For detailed information about file share tiers, see [Azure Files storage tiers](/azure/storage/files/storage-files-planning#storage-tiers).|  
|`x-ms-enabled-protocols: <SMB \| NFS>`|Optional. Supported in version 2020-02-10 and later. Specifies the enabled protocols on the share. If they're not specified, the default is SMB.<br /><br />- `SMB`: The share can be accessed by SMBv3.0, SMBv2.1, and REST.<br />- `NFS`: The share can be accessed by NFSv4.1. A premium account is required for this option.</li></ul>|  
|`x-ms-root-squash: <NoRootSquash \| RootSquash \| AllSquash>`|Optional. Supported in version 2020-02-10 and later. Specifies the root squashing behavior on the share when NFS is enabled. If it's not specified, the default is NoRootSquash. <br /><br />- `NoRootSquash`: Turn off root squashing.<br />- `RootSquash`: Map requests from uid/gid 0 to the anonymous uid/gid.<br />- `AllSquash`: Map all uids and gids to the anonymous user.</li></ul>|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
  
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
  
For more information, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|Contains a value that represents the version of the share, enclosed in quotation marks.|  
|`Last-Modified`|Returns the date and time when the share was last modified. The date format follows RFC 1123. For more information, see [Represent date/time values in headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the share or its properties or metadata updates the last modified time. Operations on files don't affect the last modified time of the share.|  
|`x-ms-request-id`|Uniquely identifies the request, and you can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the Azure Files version that was used to execute the request.|  
|`Date`|A UTC date/time value that's generated by the service, which indicates the time when the response was initiated.|
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request and the value contains no more than 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, it isn't present in the response.|
  
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
Shares are created immediately within the storage account. It's not possible to nest one share within another.  
  
You can specify metadata for a share when you create it by including one or more metadata headers on the request. The format for the metadata header is `x-ms-meta-name:value`.  
  
If a share by the same name is being deleted when you call `Create Share`, the server returns status code 409 (Conflict), and additional error information indicates that the share is being deleted.  
  
You can use the share size quota to limit the size of files that are stored on the share. The quota doesn't limit the size of snapshots.  The overhead that's associated with files and used to compute the billing size for the storage account isn't accounted for in the quota.  
  
When the sum of the sizes of the files on the share exceeds the quota that's set on the share, attempts to increase the size of a file will fail, and creating new non-empty files (via REST) will fail. You'll still be able to create empty files.  
  
Changing or setting the quota has no effect on billing. You are still billed for the size of the files plus the overhead.  
  
## See also
[Operations on Azure Files shares](Operations-on-Shares--File-Service-.md)
