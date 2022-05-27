---
title: Create Directory (FileREST API) - Azure Files
description: The Create Directory operation creates a new directory under the specified share or parent directory. The directory resource includes the properties for that directory. It doesn't include a list of the files or subdirectories contained by the directory.
author: wmgries

ms.date: 03/05/2022
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Create Directory

The `Create Directory` operation creates a new directory under the specified share or parent directory. The directory resource includes the properties for that directory. It doesn't include a list of the files or subdirectories contained by the directory.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct the `Create Directory` request as follows. We recommend that you use HTTPS.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/myparentdirectorypath/mydirectory?restype=directory`|HTTP/1.1|  
  
Replace the path components in the request URI with your own, as shown in the following table:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`myparentdirectorypath`|Optional. The path to the parent directory where *mydirectory* is to be created. If the parent directory path is omitted, the directory will be created within the specified share.<br /><br /> If the parent directory is specified, it must already exist within the share before you can create *mydirectory*.|  
|`mydirectory`|The name of the directory to create.|  
  
For more information about path-naming restrictions, see [Name and reference shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

  You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Set time-outs for File service operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request body

None.  
  
### Request headers

The required and optional request headers are described in the following table:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. Version 2015-02-21 or later. A name-value pair to associate with the directory as metadata.<br /><br /> Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).|
| `x-ms-file-permission: { inherit ¦ <SDDL> }` | In version 2019-02-02 through 2021-04-10, this header is required if `x-ms-file-permission-key` isn't specified. As of version 2021-06-08, both headers are optional. This permission is the security descriptor for the directory that's specified in the [Security Descriptor Definition Language (SDDL)](/windows/win32/secauthz/security-descriptor-definition-language). This header can be used if the permissions size is over 8 kibibytes (KiB). Otherwise, you can use `x-ms-file-permission-key`. If it's specified, it must have an owner, group, and [discretionary access control list (DACL)](/windows/win32/secauthz/access-control-lists). You can pass a value of `inherit` to inherit from the parent directory.<br /><br />**Note**: You can specify either `x-ms-file-permission` or `x-ms-file-permission-key`. If neither header is specified, the default value of `inherit` is used. |
| `x-ms-file-permission-key: <PermissionKey>` | The key of the permission to be set for the directory. In version 2019-02-02 through 2021-04-10, this header is required if `x-ms-file-permission` isn't specified. As of version 2021-06-08, both headers are optional. You can create this key by using the `Create-Permission` API.<br /><br />**Note**: You can specify either `x-ms-file-permission` or `x-ms-file-permission-key`. If neither header is specified, the default value of `inherit` is used for the `x-ms-file-permission` header. |
| `x-ms-file-attributes` | Required: version 2019-02-02 through 2021-04-10. Optional: version 2021-06-08 and later. The file system attributes to be set on the directory. See the list of [available attributes](#file-system-attributes). The default value is Directory. |
| `x-ms-file-creation-time: { now ¦ <DateTime> }` | Required: version 2019-02-02 to 2021-04-10. Optional: version 2021-06-08 and newer. The Coordinated Universal Time (UTC) creation time property for the directory. You can use a value of `now` to indicate the time of the request. The default value is `now`. |
| `x-ms-file-last-write-time: { now ¦ <DateTime> }` |Required: version 2019-02-02 through 2021-04-10. Optional: version 2021-06-08 or later. The Coordinated Universal Time (UTC) last write property for the directory. You can use a value of `now` to indicate the time of the request. The default value is `now`. |
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
| `x-ms-file-change-time: { now ¦ <DateTime> }` | Optional. The Coordinated Universal Time (UTC) change time property for the directory, in the ISO 8601 format. Version 2021-06-08 and newer. You can use a value of `now` to indicate the time of the request. The default value is `now`. |
  
### Sample request  
  
```  
PUT https://myaccount.file.core.windows.net/myshare/myparentdirectorypath/mydirectory? restype=directory HTTP/1.1  
  
Request headers:  
x-ms-version: 2014-02-14  
x-ms-date: Mon, 27 Jan 2014 22:50:32 GMT  
x-ms-meta-Category: Images  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
## Response

The response includes an HTTP status code and a set of response headers.  
  
### Status code

A successful operation returns status code 201 (Created).
  
For more information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers

The response for this operation includes the headers that are described in the following table. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|Contains a value that represents the version of the directory, enclosed in quotation marks.|  
|`Last-Modified`|Returns the date and time when the directory was last modified. The date format follows RFC 1123. For more information, see [Represent date/time values in headers](Representation-of-Date-Time-Values-in-Headers.md). Any operation that modifies the directory or its properties updates the last modified time. Operations on files don't affect the last modified time of the directory.|  
|`x-ms-request-id`|Uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshoot API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the Azure Files version that was used to execute the request.|  
|`Date`|A UTC date/time value that's generated by the service, which indicates the time when the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2017-04-17 or later. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
| `x-ms-file-permission-key` | The key of the permission of the directory. |
| `x-ms-file-attributes` | The file system attributes on the directory. See the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | The UTC date/time value that represents the creation time property for the directory. |
| `x-ms-file-last-write-time` | The UTC date/time value that represents the last write time property for the directory.  |
| `x-ms-file-change-time` | The UTC date/time that value that represents the change time property for the directory. |
| `x-ms-file-file-id` | The file ID of the directory. |
| `x-ms-file-parent-id` | The parent file ID of the directory. |
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request and the value contains no more than 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header isn't present in the response.|  
  
### Response body

None.  
  
### Sample response  
  
```
Response status:  
HTTP/1.1 201 Created  
  
Response headers:  
Transfer-Encoding: chunked  
Date: Mon, 27 Jan 2014 23:00:12 GMT  
ETag: "0x8CB14C3E29B7E82"  
Last-Modified: Mon, 27 Jan 2014 23:00:06 GMT  
x-ms-version: 2014-02-14  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization

Only the account owner may call this operation.  

#### File system attributes

| Attribute | Win32 file attribute | Definition |
|-----------|----------------------|------------|
| ReadOnly | FILE_ATTRIBUTE_READONLY | A directory that's read-only. |
| Hidden | FILE_ATTRIBUTE_HIDDEN | The directory is hidden. It isn't included in an ordinary directory listing. |
| System | FILE_ATTRIBUTE_SYSTEM | A directory that the operating system uses a part of, or uses exclusively. |
| None | FILE_ATTRIBUTE_NORMAL | A directory that doesn't have other attributes set. This attribute is valid only when it's used alone. |
| Directory | FILE_ATTRIBUTE_DIRECTORY | The handle that identifies a directory. |
| Archive | FILE_ATTRIBUTE_ARCHIVE | A directory that's an archive directory. Applications ordinarily use this attribute to mark files for backup or removal. |
| Offline | FILE_ATTRIBUTE_OFFLINE | The data of a directory isn't available immediately. This file system attribute is presented primarily to provide compatibility with Windows. Azure Files doesn't support it with offline storage options. |
| NotContentIndexed | FILE_ATTRIBUTE_NOT_CONTENT_INDEXED | The directory isn't to be indexed by the content indexing service. |
| NoScrubData | FILE_ATTRIBUTE_NO_SCRUB_DATA | The user data stream that's *not* to be read by the background data integrity scanner. This file system attribute is presented primarily to provide compatibility with Windows. |
  
## Remarks
If a directory by the same name is being deleted when `Create Directory` is called, the server returns status code 409 (Conflict), and it provides additional error information that indicates that the directory is being deleted.  
  
If a directory or file with the same name already exists, the operation fails with status code 409 (Conflict). If the parent directory doesn't exist, the operation fails with status code 412 (Precondition Failed).  
  
It isn't possible to create a directory hierarchy with a single `Create Directory` operation. You can create the directory only if its immediate parent already exists, as specified in the path. If the parent directory doesn't exist, the operation fails with status code 412 (Precondition Failed).  

`Create Directory` isn't supported on a share snapshot, which is a read-only copy of a share. An attempt to perform this operation on a share snapshot will fail with 400 (InvalidQueryParameterValue)

## See also
[Operations on directories](Operations-on-Directories.md)
