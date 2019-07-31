---
title: "Create File"
ms.custom: na
ms.date: 2016-06-29
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 211d8e61-05b5-420d-bd4b-8cee40e0c3de
caps.latest.revision: 12
author: wmgries
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Create File
The `Create File` operation creates a new file or replaces a file. Note that calling `Create File` only initializes the file. To add content to a file, call the `Put Range` operation.  
  
## Request  
 The `Create File` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
|*mydirectorypath*|Optional. The path to the directory where the file is to be created. If the directory path is omitted, the file will be created within the specified share.<br /><br /> If specified, the directory must already exist within the share before the file can be created.|  
|*myfile*|The name of the file to create.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Optional. Must be zero if present.|  
|`x-ms-content-length: byte value`|Required. This header specifies the maximum size for the file, up to 1 TiB.|  
|`Content-Type &#124; x-ms-content-type`|Optional. The MIME content type of the file. The default type is `application/octet-stream`.|  
|`Content-Encoding &#124; x-ms-content-encoding`|Optional. Specifies which content encodings have been applied to the file. This value is returned to the client when the [Get File](Get-File.md) operation is performed on the file resource and can be used to decode file content.|  
|`Content-Language &#124; x-ms-content-language`|Optional. Specifies the natural languages used by this resource.|  
|`Cache-Control &#124; x-ms-cache-control`|Optional. The File service stores this value but does not use or modify it.|  
|`x-ms-content-md5`|Optional. Sets the file's MD5 hash.|  
|`x-ms-content-disposition`|Optional. Sets the file's `Content-Disposition` header.|  
|`x-ms-type: file`|Required. Set this header to `file`.|  
|`x-ms-meta-name:value`|Optional. Name-value pairs associated with the file as metadata. Metadata names must adhere to the naming rules for [C# identifiers](https://docs.microsoft.com/dotnet/csharp/language-reference).<br /><br /> Note that file metadata specified via the File service is not accessible from an SMB client.|  
| `x-ms-file-permission` | Required. This permission is the security descriptor for the file specified in the [Security Descriptor Definition Language (SDDL)](https://docs.microsoft.com/windows/win32/secauthz/security-descriptor-definition-language). If specified, this permission will be applied for the file. This header can be used if the permissions size is under 8 KiB, otherwise the `x-ms-file-permission-key` may be used. If specified, it must have an owner, group, and [discretionary access control list (DACL)](https://docs.microsoft.com/windows/win32/secauthz/access-control-lists). If unspecified, the file's permission will inherit from the parent directory.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-permission-key` | Required. Key of the permission to be set for the file.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-attributes` | Required. The file system attributes to be set on the file. See the list of [available attributes](#file-system-attributes). If no attribute is specified, the default value is `Archive`. |
| `x-ms-file-creation-time` | Required. The creation time property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. When not specified, the default value is now (i.e. the time of file creation). |
| `x-ms-file-last-write-time` | Required. The last modified property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. When not specified, the default value is now (i.e. the time of file creation). |
  
### Request Body  
None.  
  
### Sample Request  
  
```  
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare/myfile HTTP/1.1  
  
Request Headers:  
x-ms-version: 2014-02-14  
x-ms-date: Mon, 27 Jan 2014 22:41:55 GMT  
Content-Type: text/plain; charset=UTF-8  
x-ms-content-length: 1024  
Authorization: SharedKey myaccount:YhuFJjN4fAR8/AmBrqBz7MG2uFinQ4rkh4dscbj598g=  
  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status code  
| HTTP status code | Azure Files message   | Description |
|------------------|-----------------------|-------------|
| 201              | Created               | Successful operation. |
| 400              | FileInvalidPermission | The specified file permission is not valid. |
| 400              |                       | In case of incompatible attributes are specified. |
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the file, in quotes.|  
|`Last-Modified`|Returns the date and time the share was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the directory or its properties updates the last modified time. Operations on files do not affect the last modified time of the directory.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2017-04-17 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
| `x-ms-file-permission-key` | Key of the permission of the file. |
| `x-ms-file-attributes` | The file system attributes on the file. See the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | The creation time property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. |
| `x-ms-file-last-write-time` | The last modified property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. |
| `x-ms-file-change-time` | Change time for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. |
| `x-ms-file-file-id` | The file ID of the file. |
| `x-ms-file-parent-id` | The parent file ID of the file. |
  
### Response body  
 None.  
  
### Sample response  
  
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
| ReadOnly | FILE_ATTRIBUTE_READONLY | A file that is read-only. Applications can read the file, but cannot write to it or delete it. |
| Hidden | FILE_ATTRIBUTE_HIDDEN | The file is hidden. It is not included in an ordinary directory listing. |
| System | FILE_ATTRIBUTE_SYSTEM | A file that the operating system uses a part of, or uses exclusively. |
| None | FILE_ATTRIBUTE_NORMAL | A file that does not have other attributes set. This attribute is valid only when used alone. |
| Archive | FILE_ATTRIBUTE_ARCHIVE | A file that is an archive file. Applications typically use this attribute to mark files for backup or removal. |
| Temporary | FILE_ATTRIBUTE_TEMPORARY | A file that is being used for temporary storage. |
| Offline | FILE_ATTRIBUTE_OFFLINE | The data of a file is not available immediately. This file system attribute is presented primarily to provide compatibility with Windows - Azure Files does not support with offline storage options. |
| NotContentIndexed | FILE_ATTRIBUTE_NOT_CONTENT_INDEXED | The file is not to be indexed by the content indexing service. |
| NoScrubData | FILE_ATTRIBUTE_NO_SCRUB_DATA | The user data stream not to be read by the background data integrity scanner. This file system attribute is presented primarily to provide compatibility with Windows. |
  
## Remarks  
 To create a new file, first initialize the file by calling `Create File` and specify its maximum size, up to 1 TiB. When performing this operation, do not include content in the request body. Once the file has been created, call `Put Range` to add content to the file or to modify it.  
  
 You can change the size of the file by calling `Set File Properties`.  
  
 If the share or parent directory does not exist, then the operation fails with status code 412 (Precondition Failed).  
  
 Note that the file properties `cache-control`, `content-type`, `content-md5`, `content-encoding` and `content-language` are discrete from the file system properties available to SMB clients. SMB clients are not able to read, write or modify these property values.  

`Create File` is not supported on a share snapshot, which is a read-only copy of a share. An attempt to perform this operation on a share snapshot will fail with 400 (InvalidQueryParameterValue)

## See Also  
 [Operations on Files](Operations-on-Files.md)
