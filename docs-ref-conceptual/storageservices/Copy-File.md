---
title: Copy File (FileREST API) - Azure Files
description: The Copy File operation copies a blob or file to a destination file within the storage account.  
author: wmgries

ms.date: 03/05/2022
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Copy File
The `Copy File` operation copies a blob or file to a destination file within the storage account.  
  
Available in version 2015-02-21 and later.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request
You can construct the `Copy File` request as follows. We recommend HTTPS.  
  
Beginning with version 2013-08-15, you can specify a shared access signature for the destination file if it's in the same account as the source file. Beginning with version 2015-04-05, you can also specify a shared access signature for the destination file if it's in a different storage account.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the parent directory.|  
|`myfile`|The name of the file.|  
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Set timeouts for Azure Files operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers
The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This operation is available only in version 2015-02-21 and later.<br /><br /> For more information, see [Versioning for the Azure Storage services](versioning-for-the-azure-storage-services.md).|  
|`x-ms-meta-name:value`|Optional. Specifies name/value pairs associated with the file as metadata. If no name/value pairs are specified, the operation copies the metadata from the source blob or file to the destination file. If one or more name/value pairs are specified, the destination file is created with the specified metadata, and the metadata is not copied from the source blob or file. Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).<br /><br /> Note that file metadata specified via Azure Files is not accessible from an SMB client.|  
| `x-ms-copy-source:name` | Required. Specifies the URL of the source file or blob, up to 2 kibibytes (KiB) in length.<br /><br />To copy a file to another file within the same storage account, you can use a shared key to authorize the source file. If you're copying a file from another storage account, or if you're copying a blob from the same storage account or another storage account, you must authorize the source file or blob by using a shared access signature. If the source is a public blob, no authorization is required to perform the copy operation. You can also specify a file in a share snapshot as a copy source.<br /><br /> Here are some examples of source object URLs:<ul><li>`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`</li><li>`https://myaccount.blob.core.windows.net/mycontainer/myblob?sastoken`</li><li>`http://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?sharesnapshot=<DateTime>`</li></ul> |
|`x-ms-lease-id:<ID>`|Required if the destination file has an active lease. Available for version 2019-02-02 and later. The lease ID specified for this header must match the lease ID of the destination file. If the request doesn't include the lease ID or the ID isn't valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination file doesn't currently have an active lease, the operation fails with status code 412 (Precondition Failed).|
| `x-ms-file-permission-copy-mode: { source ¦ override }` | Optional. Available for version 2019-07-07 and later. Determines the copy behavior of the security descriptor of the file: <ul><li>`source`: The security descriptor on the destination file is copied from the source file.</li><li>`override`: The security descriptor on the destination file is determined via the `x-ms-file-permission` or `x-ms-file-permission-key` header.</li></ul> |
| `x-ms-file-permission` | Required if `x-ms-file-permission-copy-mode` is specified as `override` and `x-ms-file-permission-key` is not specified. Available for version 2019-07-07 and later. This permission is the security descriptor for the file specified in the [Security Descriptor Definition Language (SDDL)](/windows/win32/secauthz/security-descriptor-definition-language). You can use this header if the permission size is over 8 KiB. Otherwise, use `x-ms-file-permission-key`. If specified, it must have an owner, group, and [discretionary access control list (DACL)](/windows/win32/secauthz/access-control-lists). <br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-permission-key` | Required if `x-ms-file-permission-copy-mode` is specified as `override` and `x-ms-file-permission` is not specified. Available for version 2019-07-07 and later. This header specifies the key of the permission to be set for the file. You can create this key by using the `Create Permission` operation.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
|`x-ms-file-copy-ignore-readonly`|Optional. Available for version 2019-07-07 and later. This Boolean value specifies whether the `ReadOnly` attribute on a preexisting destination file should be respected. If it's `true`, the copy operation succeeds. Otherwise, a previous file at the destination with the `ReadOnly` attribute set causes the copy operation to fail. |
| `x-ms-file-attributes` | Optional. Available for version 2019-07-07 and later. This header specifies the file system attributes to be set on the destination file. See the list of [available attributes](#file-system-attributes). You can use a value of `source` to copy the attributes from the source file to the destination file. You can use a value of `none` to clear all attributes on the destination file.|
|`x-ms-file-creation-time`| Optional. Available for version 2019-07-07 and later. This header specifies the property for creation time, in UTC, to set on the destination file. You can use a value of `source` to copy the creation time from the source file to the destination file.|
|`x-ms-file-last-write-time`|Optional. Available for version 2019-07-07 and later. This header specifies the property for last write time, in UTC, to set on the destination file. You can use a value of `source` to copy the last write time from the source file to the destination file.|
|`x-ms-file-copy-set-archive`|Optional. Available for version 2019-07-07 and later. This Boolean value specifies whether the `Archive` attribute should be set, irrespective of the `x-ms-file-attributes` header value.|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-KiB character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|
| `x-ms-file-change-time: { <DateTime> ¦ source }` | Optional. Version 2021-06-08 and later. The UTC change time property for the file, formatted in the ISO 8601 format. A value of `source` can be used to copy the change time from the source file to the destination file. The default time stamp is the time of the request. |

### Request body
None.
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 202 (Accepted).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response also includes additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|If the copy operation is completed, contains the `ETag` value of the destination file. If the copy operation is not completed, contains the `ETag` value of the empty file created at the start of the operation.|  
|`Last-Modified`|Returns the date/time that the copy operation to the destination file finished.|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use this header to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files that's used to execute the request.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response.|  
|`x-ms-copy-id: <id>`|Provides a string identifier for this copy operation. Use with `Get File` or `Get File Properties` to check the status of this copy operation, or pass to `Abort Copy File` to cancel a pending copy operation.|  
|`x-ms-copy-status: <success &#124; pending>`|Indicates the state of the copy operation with these values:<br /><br /> - `success`: The copy operation finished successfully.<br />- `pending`: The copy operation is still in progress.|
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|
  
### Response body
None  
  
### Sample response  
  
```
Response Status:  
HTTP/1.1 202 Accepted  
  
Response Headers:   
Last-Modified: <date>   
ETag: "0x8CEB669D794AFE2"  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cc6b209a-b593-4be1-a38a-dde7c106f402  
x-ms-version: 2015-02-21  
x-ms-copy-id: 1f812371-a41d-49e6-b123-f4b542e851c5  
x-ms-copy-status: pending  
Date: <date>  
```  
  
## Authorization
This operation can be called by the account owner, or by a client possessing a shared access signature that has permission to write to the destination file or its share. Note that the shared access signature specified on the request applies only to the destination file.  
  
Access to the source file or blob is authorized separately, as described in the details for the request header `x-ms-copy-source`.  
  
The following table describes how the destination and source objects for a `Copy File` operation can be authorized:  
  
|File|Authorization with Shared Key or Shared Key Lite|Authorization with shared access signature|Public object not requiring authorization|  
|-|-----------------------------------------------------|-------------------------------------------------|------------------------------------------------|  
|Destination file|Yes|Yes|Not applicable|  
|Source file in same account|Yes|Yes|Not applicable|  
|Source file in another account|No|Yes|Not applicable|  
|Source blob in the same account or another account|No|Yes|Yes|  

### File system attributes
| Attribute | Win32 file attribute | Definition |
|-----------|----------------------|------------|
| `ReadOnly` | `FILE_ATTRIBUTE_READONLY` | The file is read-only. Applications can read the file but can't write to it or delete it. |
| `Hidden` | `FILE_ATTRIBUTE_HIDDEN` | The file is hidden. It's not included in an ordinary directory listing. |
| `System` | `FILE_ATTRIBUTE_SYSTEM` | The operating system uses a part of the file, or it uses the file exclusively. |
| `None` | `FILE_ATTRIBUTE_NORMAL` | The file doesn't have other attributes set. This attribute is valid only when it's used alone. |
| `Archive` | `FILE_ATTRIBUTE_ARCHIVE` | The file is an archive file. Applications typically use this attribute to mark files for backup or removal. |
| `Temporary` | `FILE_ATTRIBUTE_TEMPORARY` | The file is being used for temporary storage. |
| `Offline` | `FILE_ATTRIBUTE_OFFLINE` | The data of the file is not available immediately. This file system attribute mainly provides compatibility with Windows. Azure Files does not support it with offline storage options. |
| `NotContentIndexed` | `FILE_ATTRIBUTE_NOT_CONTENT_INDEXED` | The content indexing service won't index the file. |
| `NoScrubData` | `FILE_ATTRIBUTE_NO_SCRUB_DATA` | The background data integrity scanner won't read the user data stream. This file system attribute mainly provides compatibility with Windows. |

## Remarks
The `Copy File` operation can finish asynchronously. You can use the copy ID that the `x-ms-copy-id` response header returns to check the status of the copy operation or to cancel it. Azure Files copies files on a best-effort basis.  
  
If the destination file exists, it will be overwritten. You can't modify the destination file while the copy operation is in progress.  
  
The `Copy File` operation always copies the entire source blob or file. Copying a range of bytes or set of blocks is not supported.  

The source of a `Copy File` operation can be a file that resides in a share snapshot. The destination of a `Copy File` operation can't be a file that resides in a share snapshot.

When the source of a copy operation provides `ETag` values, if there are any changes to the source while the operation is in progress, it will fail. An attempt to change the destination file while a copy operation is in progress will fail with status code 409 (Conflict).  
  
The `ETag` value for the destination file changes when the `Copy File` operation starts. It continues to change frequently during the copy operation.  
  
## Copying properties and metadata
When a blob or file is copied, the following system properties are copied to the destination file with the same values:  
  
- `Content-Type`  
- `Content-Encoding`  
- `Content-Language`  
- `Content-Length`
- `Cache-Control`
- `Content-MD5`  
- `Content-Disposition`

The destination file is always the same size as the source blob or file. The value of the `Content-Length` header for the destination file matches the value of that header for the source blob or file.  
  
## Copying a leased blob or file to a file
The `Copy File` operation only reads from the source blob or file, so a lease on the source object doesn't affect the operation. The `Copy File` operation saves the `ETag` value of the source blob or file when the operation starts. If the `ETag` value changes before the copy operation finishes, the operation fails. You can prevent changes to the source blob of the file by leasing it during the copy operation.

If the destination file has an active infinite lease, you must specify its lease ID in the call to the `Copy File` operation. While the copy operation is pending, any lease operation on the destination file fails with status code 409 (Conflict). An infinite lease on the destination file is locked in this way during the copy operation, whether you're copying to a destination file that has a different name from the source or copying to a destination file that the same name as the source. If the client specifies a lease ID on a file that doesn't yet exist, Azure Files returns status code 412 (Precondition Failed).
  
## Working with a pending copy operation
The `Copy File` operation might finish copying the files asynchronously. Use the following table to determine the next step based on the status code that `Copy File` returns:  
  
|Status code|Meaning|  
|-----------------|-------------|  
|202 (Accepted), x-ms-copy-status: success|Copy operation finished successfully.|  
|202 (Accepted), x-ms-copy-status: pending|Copy operation has not finished. Poll the destination blob by using `Get File Properties` to examine `x-ms-copy-status` until the copy operation finishes or fails.|  
|4xx, 500, or 503|Copy operation failed.|  
  
During and after a `Copy File` operation, the properties of the destination file contain the copy ID of the `Copy File` operation and the URL of the source blob or file. When the operation finishes, Azure Files writes the time and outcome value (`success`, `failed`, or `aborted`) to the destination file's properties. If the operation has a `failed` outcome, the `x-ms-copy-status-description` header contains an error detail string.  
  
A pending `Copy File` operation has a two-week timeout. A copy attempt that hasn't finished after two weeks times out and leaves an empty file with the `x-ms-copy-status` field set to `failed` and the `x-ms-status-description` field set to 500 (OperationCancelled). Intermittent, non-fatal errors that can occur during a copy operation might impede progress of the operation but not cause it to fail. In these cases, `x-ms-copy-status-description` describes the intermittent errors.  
  
Any attempt to modify the destination file during the copy operation will fail with status code 409 (Conflict), "Copy File in Progress."  
  
If you call an `Abort Copy File` operation, you'll see a `x-ms-copy-status:aborted` header. The destination file will have intact metadata and a file length of 0 bytes. You can repeat the original call to `Copy File` to try the operation again.  
  
## Billing
The destination account of a `Copy File` operation is charged for one transaction to start the operation. The destination account also incurs one transaction for each request to cancel or request the status of the copy operation.  
  
When the source file or blob is in another account, the source account incurs transaction costs. In addition, if the source and destination accounts reside in different regions (for example, US North and US South), bandwidth that you use to transfer the request is charged to the source account as egress. Egress between accounts within the same region is free.  
  
## See also  

- [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)
- [Status and error codes](Status-and-Error-Codes2.md)
- [Azure Files error codes](File-Service-Error-Codes.md)
- [Abort Copy File](Abort-Copy-File.md)
