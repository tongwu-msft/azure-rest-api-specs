---
title: Rename Directory (REST API) - Azure Storage
description: The Rename Directory operation renames a directory and can optionally set system properties for the directory.
author: daniewo

ms.date: 11/05/2021
ms.service: storage
ms.topic: reference
ms.author: daniewo
---

# Rename Directory
The `Rename Directory` operation renames a directory and can optionally set system properties for the directory. This API is available beginning in version 2021-04-10.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request
The `Rename Directory` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/mydirectory?restype=directory&comp=rename`|HTTP/1.1| 
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the parent directory.|  
|`mydirectory`|The name of the target directory.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-file-rename-source:name`|Required. Name of the directory to be renamed.|
|`x-ms-file-rename-replace-if-exists`|Optional. If the destination file already exists, overwrite the file.|
|`x-ms-file-ignore-readonly`|Optional. If destination file exists with readonly attribute, overwrite the file.<br /><br /> If true, `x-ms-replace-if-exists` must also be true.|  
| `x-ms-file-permission` | Optional if `x-ms-file-permission-key` is not specified. This permission is the security descriptor for the directory specified in the [Security Descriptor Definition Language (SDDL)](/windows/win32/secauthz/security-descriptor-definition-language). This header can be used if the permissions size is over 8 KiB, otherwise the `x-ms-file-permission-key` may be used. If specified, it must have an owner, group, and [discretionary access control list (DACL)](/windows/win32/secauthz/access-control-lists). A value of `preserve` may be passed to keep an existing value unchanged.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-permission-key` | Optional if `x-ms-file-permission` is not specified. The key of the permission to be set for the file. This can be created using the `Create-Permission` API.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-attributes` | Optional. The file system attributes to be set on the directory. See the list of [available attributes](#file-system-attributes). A value of `preserve` may be passed to keep an existing value unchanged. If this property is not specified on the request, then the property will be preserved for the file. |
| `x-ms-file-creation-time` | Optional. The Coordinated Universal Time (UTC) creation time property for a directory. A value of `preserve` may be passed to keep an existing value unchanged. If this property is not specified on the request, then the property will be preserved for the file. |
| `x-ms-file-last-write-time` | Optional. The Coordinated Universal Time (UTC) last write property for a directory. A value of `preserve` may be passed to keep an existing value unchanged. If this property is not specified on the request, then the property will be preserved for the file. |
|`x-ms-source-lease-id:<ID>`|Required if the source directory has an active lease. |
|`x-ms-destination-lease-id:<ID>`|Required if the destination file has an active lease. |
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
|`x-ms-meta-name:value`|Optional. Sets a name-value pair for the file.<br /><br /> Each call to this operation replaces all existing metadata attached to the file. <br /><br /> Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference). If this property is not specified on the request, then the property will be preserved for the file. |
  
### Request body
None.  
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the file, in quotes.|  
|`Last-Modified`|Returns the date and time the file was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). Any operation that modifies the directory or its properties updates the last modified time. Operations on files do not affect the last modified time of the directory.|
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date` or `x-ms-date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
| `x-ms-file-permission-key` | The key of the permission of the file. |
| `x-ms-file-attributes` | The file system attributes on the file. See the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | The UTC date/time value that represents the creation time property for the file. |
| `x-ms-file-last-write-time` | The UTC date/time value that represents the last write time property for the file.  |
| `x-ms-file-change-time` | The UTC date/time that value that represents the change time property for the file. |
| `x-ms-file-file-id` | The file ID of the file. |
| `x-ms-file-parent-id` | The parent file ID of the file. |
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|

### Response body
None.  
  
## Authorization
Only the account owner may call this operation.  

#### File system attributes
| Attribute | Win32 file attribute | Definition |
|-----------|----------------------|------------|
| ReadOnly | FILE_ATTRIBUTE_READONLY | A directory that is read-only. |
| Hidden | FILE_ATTRIBUTE_HIDDEN | The directory is hidden. It is not included in an ordinary directory listing. |
| System | FILE_ATTRIBUTE_SYSTEM | A directory that the operating system uses a part of, or uses exclusively. |
| None | FILE_ATTRIBUTE_NORMAL | A directory that does not have other attributes set. This attribute is valid only when used alone. |
| Directory | FILE_ATTRIBUTE_DIRECTORY | The handle that identifies a directory. |
| Archive | FILE_ATTRIBUTE_ARCHIVE | A directory that is an archive directory. Applications typically use this attribute to mark files for backup or removal. |
| Offline | FILE_ATTRIBUTE_OFFLINE | The data of a directory is not available immediately. This file system attribute is presented primarily to provide compatibility with Windows - Azure Files does not support with offline storage options. |
| NotContentIndexed | FILE_ATTRIBUTE_NOT_CONTENT_INDEXED | The directory is not to be indexed by the content indexing service. |
| NoScrubData | FILE_ATTRIBUTE_NO_SCRUB_DATA | The user data stream not to be read by the background data integrity scanner. This file system attribute is presented primarily to provide compatibility with Windows. |
  
## Remarks
If the target is a directory, then the directory must not exist.

`Rename Directory` is not supported on a share snapshot, which is a read-only copy of a share. An attempt to perform this operation on a share snapshot will fail with 400 (InvalidQueryParameterValue).

If properties are not specified, defualt behavior of `preserve` or `now` will be set.

If the directory has an active lease, the client must specify a valid lease ID on the request in order to rename the directory. If the client does not specify a lease ID, or specifies an invalid lease ID, the File service returns status code 412 (Precondition Failed). If the client specifies a lease ID but the directory does not have an active lease, the File service also returns status code 412 (Precondition Failed).

## See also 
[Operations on Directories](Operations-on-Directories.md)
