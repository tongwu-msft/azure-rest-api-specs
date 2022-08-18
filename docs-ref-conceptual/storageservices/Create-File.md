---
title: Create File (FileREST API) - Azure Files
description: The Create File operation creates a new file or replaces a file. Calling Create File only initializes the file. To add content to a file, you call the Put Range operation. 
author: wmgries

ms.date: 03/05/2022
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Create File

The `Create File` operation creates a new file or replaces a file. When you call `Create File`, you only initialize the file. To add content to a file, you call the `Put Range` operation. 

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct a `Create File` request by doing the following. We recommend that you use HTTPS.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`|HTTP/1.1|  
  
Replace the path components that are shown in the request URI with your own, as described in the following table:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the directory where the file is to be created. If the directory path is omitted, the file will be created within the specified share.<br /><br /> If the directory is specified, it must already exist within the share before you can create the file.|  
|`myfile`|The name of the file to create.|  
  
For information about path-naming restrictions, see [Name and reference shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Set timeouts for file service operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers

The required and optional request headers are described in the following table:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
| `Content-Length` |Optional. Must be zero if present.|  
| `x-ms-content-length: byte value` | Required. This header specifies the maximum size for the file, up to 4 tibibytes (TiB). |
| `Content-Type` or `x-ms-content-type` | Optional. The MIME content type of the file. The default type is `application/octet-stream`. |
| `Content-Encoding` or `x-ms-content-encoding` | Optional. Specifies which content encodings have been applied to the file. This value is returned to the client when the [Get File](Get-File.md) operation is performed on the file resource, and you can use it to decode file content. |
| `Content-Language` or `x-ms-content-language` | Optional. Specifies the natural languages that are used by this resource. |
| `Cache-Control` or `x-ms-cache-control` | Optional. Azure Files stores this value but doesn't use or modify it.|
|`x-ms-content-md5`|Optional. Sets the file's MD5 hash.|  
|`x-ms-content-disposition`|Optional. Sets the file's `Content-Disposition` header.|  
|`x-ms-type: file`|Required. Set this header to `file`.|  
|`x-ms-meta-name:value`|Optional. Name-value pairs that are associated with the file as metadata. Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).<br /><br /> **Note**: File metadata that's specified via Azure Files isn't accessible from a Server Message Block (SMB) client.|  
| `x-ms-file-permission: { inherit ¦ <SDDL> }` | In version 2019-02-02 through 2021-04-10, this header is required if `x-ms-file-permission-key` isn't specified. As of version 2021-06-08, both headers are optional. This permission is the security descriptor for the file that's specified in the [Security Descriptor Definition Language (SDDL)](/windows/win32/secauthz/security-descriptor-definition-language). You can use this header if the permissions size is over 8 KiB. If it isn't, you can use `x-ms-file-permission-key`. If you specify the header, it must have an owner, group, and [discretionary access control list (DACL)](/windows/win32/secauthz/access-control-lists). You can pass a value of `inherit` to inherit from the parent directory. |
| `x-ms-file-permission-key: <PermissionKey>` | In version 2019-02-02 through 2021-04-10, this header is required if `x-ms-file-permission` isn't specified. As of version 2021-06-08, both headers are optional. If neither header is specified, the default value of `inherit` is used for the `x-ms-file-permission` header.<br /><br />You can create the key by calling the `Create Permission` API. |
| `x-ms-file-attributes` | Required: version 2019-02-02 through 2021-04-10. Optional: version 2021-06-08 and later. This header contains the file system attributes to be set on the file. For more information, see the list of [available attributes](#file-system-attributes). The default value is `None`. |
| `x-ms-file-creation-time: { now ¦ <DateTime> }` | Required: version 2019-02-02 through 2021-04-10. Optional: version 2021-06-08 and later. The Coordinated Universal Time (UTC) creation time property for the file. A value of `now` may be used to indicate the time of the request. The default value is `now`. |
| `x-ms-file-last-write-time: { now ¦ <DateTime> }` | Required: version 2019-02-02 through 2021-04-10. Optional: version 2021-06-08 and later. The Coordinated Universal Time (UTC) last write property for the file. You can use a value of `now` to indicate the time of the request. The default value is `now`. |
| `x-ms-lease-id: <ID>`| Required if the file has an active lease. Available for version 2019-02-02 and later.|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
| `x-ms-file-change-time: { now ¦ <DateTime> }` | Optional. Version 2021-06-08 and later. The Coordinated Universal Time (UTC) change time property for the file, in the ISO 8601 format. You can use a value of `now` to indicate the time of the request. The default value is `now`. |
  
### Request body

None.  
  
### Sample request  
  
```
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare/myfile HTTP/1.1  
  
Request Headers:  
x-ms-version: 2020-02-10
x-ms-date: Mon, 27 Jan 2014 22:41:55 GMT  
Content-Type: text/plain; charset=UTF-8  
x-ms-content-length: 1024  
Authorization: SharedKey myaccount:YhuFJjN4fAR8/AmBrqBz7MG2uFinQ4rkh4dscbj598g=  
  
```  
  
## Response

The response includes an HTTP status code and a set of response headers.  
  
### Status code

A successful operation returns status code 201 (Created).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers

The response for this operation includes the headers that are described in the following table. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value that represents the version of the file. The value is enclosed in quotation marks.|  
|`Last-Modified`|Returns the date and time when the file was last modified. The date format follows RFC 1123. For more information, see [Represent date/time values in headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the directory or its properties updates the last modified time. Operations on files don't affect the last modified time of the directory.|
|`x-ms-request-id`|Uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the Azure Files version that's used to execute the request.|  
|`Date`|A UTC date/time value that's generated by the service, which indicates the time when the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2017-04-17 and later. The value of this header is set to `true` if you've successfully encrypted the contents of the request by using the specified algorithm. If the encryption is unsuccessful, the value is `false`.|  
| `x-ms-file-permission-key` | The key of the permission of the file. |
| `x-ms-file-attributes` | The file system attributes on the file. For more information, see the list of [available attributes](#file-system-attributes). |
| `x-ms-file-creation-time` | The UTC date/time value that represents the creation time property for the file. |
| `x-ms-file-last-write-time` | The UTC date/time value that represents the last write time property for the file.  |
| `x-ms-file-change-time` | The UTC date/time that value that represents the change time property for the file. |
| `x-ms-file-file-id` | The file ID of the file. |
| `x-ms-file-parent-id` | The parent file ID of the file. |
|`x-ms-client-request-id`|Used to troubleshoot requests and their corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request and the value contains no more than 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, it isn't present in the response.|
  
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
| ReadOnly | FILE_ATTRIBUTE_READONLY | A file that's read-only. Applications can read the file, but they can't write to it or delete it. |
| Hidden | FILE_ATTRIBUTE_HIDDEN | The file is hidden. It isn't included in an ordinary directory listing. |
| System | FILE_ATTRIBUTE_SYSTEM | A file that the operating system uses a part of, or uses exclusively. |
| None | FILE_ATTRIBUTE_NORMAL | A file that doesn't have other attributes set. This attribute is valid only when used alone. |
| Archive | FILE_ATTRIBUTE_ARCHIVE | A file that's an archive file. Applications ordinarily use this attribute to mark files for backup or removal. |
| Temporary | FILE_ATTRIBUTE_TEMPORARY | A file that's being used for temporary storage. |
| Offline | FILE_ATTRIBUTE_OFFLINE | The data of a file isn't available immediately. This file system attribute is presented primarily to provide compatibility with Windows. Azure Files doesn't support it with offline storage options. |
| NotContentIndexed | FILE_ATTRIBUTE_NOT_CONTENT_INDEXED | The file isn't to be indexed by the content indexing service. |
| NoScrubData | FILE_ATTRIBUTE_NO_SCRUB_DATA | The user data stream that's *not* to be read by the background data integrity scanner. This file system attribute is presented primarily to provide compatibility with Windows. |
  
## Remarks

To create a new file, first initialize it by calling `Create File` and specifying its maximum size, up to 4 TiB. When you're performing this operation, don't include content in the request body. After you've created the file, call `Put Range` to add content to the file or to modify it.  
  
You can change the size of the file by calling `Set File Properties`.  
  
If the share or parent directory doesn't exist, then the operation fails with status code 412 (Precondition Failed).  
  
> [!NOTE]
> The file properties `cache-control`, `content-type`, `content-md5`, `content-encoding`, and `content-language` are separate from the file system properties that are available to SMB clients. SMB clients are unable to read, write, or modify these property values.  

To create the file, if the existing file has an active lease, the client must specify a valid lease ID on the request. If the client either doesn't specify a lease ID or specifies an invalid lease ID, Azure Files returns status code 412 (Precondition Failed). If the client specifies a lease ID but the file doesn't have an active lease, Azure Files returns status code 412 (Precondition Failed) in this instance also. If the client specifies a lease ID on a file that doesn't yet exist, Azure Files returns status code 412 (Precondition Failed) for requests that are made against version 2019-02-02 and later. 

If an existing file with an active lease is overwritten by a `Create File` operation, the lease persists on the updated file until it's released. 

`Create File` isn't supported on a share snapshot, which is a read-only copy of a share. An attempt to perform this operation on a share snapshot fails with status code 400 (InvalidQueryParameterValue).

## See also
[Operations on Azure Files](Operations-on-Files.md)
