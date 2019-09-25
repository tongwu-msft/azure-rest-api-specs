---
title: Create Directory (REST) - Azure Storage
description: The Create Directory operation creates a new directory under the specified share or parent directory. The directory resource includes the properties for that directory. It does not include a list of the files or subdirectories contained by the directory.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Create Directory

The `Create Directory` operation creates a new directory under the specified share or parent directory. The directory resource includes the properties for that directory. It does not include a list of the files or subdirectories contained by the directory.  
  
## Request  
 The `Create Directory` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/myparentdirectorypath/mydirectory?restype=directory`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
|*myparentdirectorypath*|Optional. The path to the parent directory where *mydirectory* is to be created. If the parent directory path is omitted, the directory will be created within the specified share.<br /><br /> If specified, the parent directory must already exist within the share before *mydirectory* can be created.|  
|*mydirectory*|The name of the directory to create.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Body  
 None.  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. Version 2015-02-21 and newer. A name-value pair to associate with the directory as metadata.<br /><br /> Metadata names must adhere to the naming rules for [C# identifiers](https://docs.microsoft.com/dotnet/csharp/language-reference).|
| `x-ms-file-permission` | Required if `x-ms-file-permission-key` is not specified. Version 2019-02-02 and newer. This permission is the security descriptor for the directory specified in the [Security Descriptor Definition Language (SDDL)](https://docs.microsoft.com/windows/win32/secauthz/security-descriptor-definition-language). This header can be used if the permissions size is over 8 KiB, otherwise the `x-ms-file-permission-key` may be used. If specified, it must have an owner, group, and [discretionary access control list (DACL)](https://docs.microsoft.com/windows/win32/secauthz/access-control-lists). A value of `inherit` may be passed to inherit from the parent directory.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-permission-key` | Required if `x-ms-file-permission` is not specified. Version 2019-02-02 and newer. The key of the permission to be set for the directory. This can be created using the `Create-Permission` API.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-attributes` | Required. Version 2019-02-02 and newer. The file system attributes to be set on the directory. See the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | Required. Version 2019-02-02 and newer. The Coordinated Universal Time (UTC) creation time property for the directory. A value of `now` may be used to indicate the time of the request. |
| `x-ms-file-last-write-time` | Required. Version 2019-02-02 and newer. The Coordinated Universal Time (UTC) last write property for the directory. A value of `now` may be used to indicate the time of the request. |
  
### Sample Request  
  
```  
PUT https://myaccount.file.core.windows.net/myshare/myparentdirectorypath/mydirectory? restype=directory HTTP/1.1  
  
Request Headers:  
x-ms-version: 2014-02-14  
x-ms-date: Mon, 27 Jan 2014 22:50:32 GMT  
x-ms-meta-Category: Images  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the directory, in quotes.|  
|`Last-Modified`|Returns the date and time the directory was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). Any operation that modifies the directory or its properties updates the last modified time. Operations on files do not affect the last modified time of the directory.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Azure File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2017-04-17 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
| `x-ms-file-permission-key` | The key of the permission of the directory. |
| `x-ms-file-attributes` | The file system attributes on the directory. See the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | The UTC date/time value that represents the creation time property for the directory. |
| `x-ms-file-last-write-time` | The UTC date/time value that represents the last write time property for the directory.  |
| `x-ms-file-change-time` | The UTC date/time that value that represents the change time property for the directory. |
| `x-ms-file-file-id` | The file ID of the directory. |
| `x-ms-file-parent-id` | The parent file ID of the directory. |
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
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
 If a directory by the same name is being deleted when `Create Directory` is called, the server will return status code 409 (Conflict), with additional error information indicating that the directory is being deleted.  
  
 If a directory or file with the same name already exists, the operation fails with status code 409 (Conflict). If the parent directory does not exist, then the operation fails with status code 412 (Precondition Failed).  
  
 It is not possible to create a directory hierarchy with a single `Create Directory` operation. The directory will only be created if its immediate parent already exists, as specified in the path. If the parent directory does not exist, then the operation fails with status code 412 (Precondition Failed).  

 `Create Directory` is not supported on a share snapshot, which is a read-only copy of a share. An attempt to perform this operation on a share snapshot will fail with 400 (InvalidQueryParameterValue)

## See Also  
 [Operations on Directories](Operations-on-Directories.md)
