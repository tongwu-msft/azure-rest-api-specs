---
title: "Set File Properties"
ms.custom: na
ms.date: 2016-06-29
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 815e53d3-ffc5-45aa-a367-3c1bcf5b66eb
caps.latest.revision: 9
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
# Set File Properties
The `Set File Properties` operation sets system properties on the file.  
  
## Request  
 The `Set File Properties` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=properties`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
|*mydirectorypath*|Optional. The path to the parent directory.|  
|*myfile*|The name of the file.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-cache-control`|Optional. Modifies the cache control string for the file.<br /><br /> If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to [Get File Properties](Get-File-Properties.md) will not return this property, unless it is explicitly set on the file again.|  
|`x-ms-content-type`|Optional. Sets the file's content type.<br /><br /> If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to [Get File Properties](Get-File-Properties.md) will not return this property, unless it is explicitly set on the file again.|  
|`x-ms-content-md5`|Optional. Sets the file's MD5 hash.<br /><br /> If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to [Get File Properties](Get-File-Properties.md) will not return this property, unless it is explicitly set on the file again.|  
|`x-ms-content-encoding`|Optional. Sets the file's content encoding.<br /><br /> If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to [Get File Properties](Get-File-Properties.md) will not return this property, unless it is explicitly set on the file again.|  
|`x-ms-content-language`|Optional. Sets the file's content language.<br /><br /> If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to [Get File Properties](Get-File-Properties.md) will not return this property, unless it is explicitly set on the file again.|  
|`x-ms-content-disposition`|Optional. Sets the file’s `Content-Disposition` header.<br /><br /> If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to [Get File Properties](Get-File-Properties.md) will not return this property, unless it is explicitly set on the file again.|  
|`x-ms-content-length: bytes`|Optional. Resizes a file to the specified size. If the specified byte value is less than the current size of the file, then all ranges above the specified byte value are cleared.|  
| `x-ms-file-permission` | Required. This permission is the security descriptor for the file specified in the [Security Descriptor Definition Language (SDDL)](https://docs.microsoft.com/windows/win32/secauthz/security-descriptor-definition-language). If specified, this permission will be applied for the file. This header can be used if the permissions size is over 8 KiB, otherwise the `x-ms-file-permission-key` may be used. If not specified, it must have an owner, group, and [discretionary access control list (DACL)](https://docs.microsoft.com/windows/win32/secauthz/access-control-lists). If unspecified, the file's permission will inherit from the parent directory.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-permission-key` | Required. Key of the permission to be set for the file. This can be created using the `Create-Permission` API.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-attributes` | Required. The file system attributes to be set on the file. See the list of [available attributes](#file-system-attributes). If no attribute is specified, the default value is `Archive`. |
| `x-ms-file-creation-time` | Required. The creation time property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. When not specified, the default value is now (i.e. the time of file creation). |
| `x-ms-file-last-write-time` | Required. The last write property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. When not specified, the default value is now (i.e. the time of file creation). |
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
| HTTP status code | Azure Files message   | Description |
|------------------|-----------------------|-------------|
| 200              | OK                    | Successful operation. |
| 400              | FileInvalidPermission | The specified file permission is not valid. |
| 400              |                       | In case of incompatible attributes are specified. |
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the file, in quotes.|  
|`Last-Modified`|Returns the date and time the directory was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). Any operation that modifies the directory or its properties updates the last modified time. Operations on files do not affect the last modified time of the directory.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2017-04-17 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
| `x-ms-file-permission-key` | Key of the permission of the file. |
| `x-ms-file-attributes` | The file system attributes on the file. See the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | The creation time property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. |
| `x-ms-file-last-write-time` | The last write property for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. |
| `x-ms-file-change-time` | Change time for a file. The date/time format follows ISO 8601 format. Example 2017-05-10T17:52:33.9551861Z. |
  
### Response Body  
 None.  
  
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

 The semantics for updating a file's properties are as follows:  
  
-   A file's size is modified only if the request specifies a value for the `x-ms-content-length` header.  
  
-   If a request sets only `x-ms-content-length`, and no other properties, then none of the file’s other properties are modified.  
  
-   If any one or more of the following properties is set in the request, then all of these properties are set together. If a value is not provided for a given property when at least one of the properties listed below is set, then that property will be cleared for the file.  
  
    -   `x-ms-cache-control`  
  
    -   `x-ms-content-type`  
  
    -   `x-ms-content-md5`  
  
    -   `x-ms-content-encoding`  
  
    -   `x-ms-content-language`  
  
> [!NOTE]
>  The file properties listed above are discrete from the file system properties available to SMB clients. SMB clients cannot read, write, or modify these property values.  

 `Set File properties` is not supported on a share snapshot, which is a read-only copy of a share. An attempt to perform this operation on a share snapshot will fail with 400 (InvalidQueryParameterValue) 
## See Also  
 [Operations on Files](Operations-on-Files.md)
