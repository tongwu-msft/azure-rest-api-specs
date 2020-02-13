---
title: Copy File (REST API) - Azure Storage
description: The Copy File operation copies a blob or file to a destination file within the storage account.  
author: pemari-msft

ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Copy File

The `Copy File` operation copies a blob or file to a destination file within the storage account.  
  
Available in version 2015-02-21 and newer.  
  
## Request  
 The `Copy File` request may be constructed as follows. HTTPS is recommended.  
  
 Beginning with version 2013-08-15, you may specify a shared access signature for the destination file if it is in the same account as the source file. Beginning with version 2015-04-05, you may also specify a shared access signature for the destination file if it is in a different storage account.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|PUT|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|`Myaccount`|The name of your storage account.|  
|`Myshare`|The name of your file share.|  
|`Mydirectorypath`|Optional. The path to the parent directory.|  
|`Myfile`|The name of the file.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see Setting Timeouts for File Service Operations.|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date or x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This operation is available only in versions 2015-02-21 and later.<br /><br /> For more information, see [Versioning for the Azure Storage Services](versioning-for-the-azure-storage-services.md).|  
|`x-ms-meta-name:value`|Optional. Name-value pairs associated with the file as metadata. If no name-value pairs are specified, the operation will copy the metadata from the source blob or file to the destination file. If one or more name-value pairs are specified, the destination file is created with the specified metadata, and the metadata is not copied from the source blob or file. Metadata names must adhere to the naming rules for [C# identifiers](https://docs.microsoft.com/dotnet/csharp/language-reference).<br /><br /> Note that file metadata specified via the File service is not accessible from an SMB client.|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source file or blob, up to 2 KB in length.<br /><br /> To copy a file to another file within the same storage account, you may use Shared Key to authorize the source file. If you are copying a file from another storage account, or if you are copying a blob from the same storage account or another storage account, then you must authorize the source file or blob using a shared access signature. If the source is a public blob, no authorization is required to perform the copy operation. A file in a share snapshot can also be specified as a copy source.<br /><br /> Here are some examples of source object URLs:<br /><br /> - `https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile`<br />- `https://myaccount.blob.core.windows.net/mycontainer/myblob?sastoken` <br /> - `http://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?sharesnapshot=<DateTime>` <br /> <br />
|`x-ms-lease-id:<ID>`|Required if the destination file has an active lease. Available for versions 2019-02-02 and newer. The lease ID specified for this header must match the lease ID of the destination file. If the request does not include the lease ID or it is not valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination file does not currently have an active lease, the operation will also fail with status code 412 (Precondition Failed).|
|`x-ms-file-permission-copy-mode:<source ¦ override>`|Optional. Version 2019-07-07 and newer. Determines the copy behavior of the security descriptor of the file.<br />`source`: The security descriptor on the destination file is copied from the source file.  <br />`override`: The security descriptor on the destination file is determined via one of the `x-ms-file-permission` or `x-ms-file-permission-key` headers.
| `x-ms-file-permission` | Required if `x-ms-file-permission-copy-mode` is specified as `override` and `x-ms-file-permission-key` is not specified. Version 2019-07-07 and newer. This permission is the security descriptor for the file specified in the [Security Descriptor Definition Language (SDDL)](https://docs.microsoft.com/windows/win32/secauthz/security-descriptor-definition-language). This header can be used if the permissions size is over 8 KiB, otherwise the `x-ms-file-permission-key` may be used. If specified, it must have an owner, group, and [discretionary access control list (DACL)](https://docs.microsoft.com/windows/win32/secauthz/access-control-lists). <br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
| `x-ms-file-permission-key` | Required if `x-ms-file-permission-copy-mode` is specified as `override` and `x-ms-file-permission` is not specified. Version 2019-07-07 and newer. The key of the permission to be set for the file. This can be created using the `Create-Permission` API.<br /><br />Note that only one of `x-ms-file-permission` or `x-ms-file-permission-key` can be specified. |
|`x-ms-file-copy-ignore-read-only`|Optional. Version 2019-07-07 and newer. A boolean value that specifies whether the `ReadOnly` attribute on a preexisting destination file should be respected. If `true`, the copy will succeed, otherwise, a previous file at the destination with the `ReadOnly` attribute set will cause the copy to fail. |
| `x-ms-file-attributes` | Optional. Version 2019-07-07 and newer. The file system attributes to be set on the destination file. See the list of [available attributes](#file-system-attributes). A value of `source` may be used to copy the attributes from the source file to the destination file; a value of `none` may be used to clear all attributes on the destination file.|
|`x-ms-file-creation-time`| Optional. Version 2019-07-07 and newer. The Coordinated Universal Time (UTC) creation time property to set on the destination file. A value of `source` may be used to copy the creation time from the source file to the destination file.|
|`x-ms-file-last-write-time`|Optional. Version 2019-07-07 and newer. The Coordinated Universal Time (UTC) last write time property to set on the destination file. A value of `source` may be used to copy the last write time from the source file to the destination file.|
|`x-ms-file-copy-set-archive`|Optional. Version 2019-07-07 and newer. A boolean value that specifies whether the `Archive` attribute should be set, irrespective of the `x-ms-file-attributes` header value.

### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 202 (Accepted).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response also includes additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|If the copy is completed, contains the ETag of the destination file. If the copy is not complete, contains the ETag of the empty file created at the start of the copy.|  
|`Last-Modified`|Returns the date/time that the copy operation to the destination file completed.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-copy-id: <id>`|String identifier for this copy operation. Use with Get File or Get File Properties to check the status of this copy operation, or pass to Abort Copy File to abort a pending copy.|  
|`x-ms-copy-status: <success &#124; pending>`|State of the copy operation with these values:<br /><br /> - **success**: the copy completed successfully.<br />- **pending**: the copy is still in progress.|  
  
### Response Body  
 None  
  
### Sample Response  
  
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
  
 The following table describes how the destination and source objects for a Copy File operation may be authorized.  
  
||Authorization with Shared Key/Shared Key Lite|Authorization with Shared Access Signature|Public Object Not Requiring Authorization|  
|-|-----------------------------------------------------|-------------------------------------------------|------------------------------------------------|  
|Destination file|Yes|Yes|N/A|  
|Source file in same account|Yes|Yes|N/A|  
|Source file in another account|No|Yes|N/A|  
|Source blob in the same account or another account|No|Yes|Yes|  
 
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
 The **Copy File** operation can complete asynchronously. The copy ID returned by the `x-ms-copy-id` response header can be used to check the status of the copy operation or to abort it. The File service copies files on a best-effort basis.  
  
 If the destination file exists, it will be overwritten. The destination file cannot be modified while the copy operation is in progress.  
  
 The **Copy File** operation always copies the entire source blob or file; copying a range of bytes or set of blocks is not supported.  

 The source of a **Copy File** operation can be a file which resides in a share snapshot. The destination of a **Copy File** operation cannot be a file which resides in a share snapshot.

 When the source of a copy operation provides ETags, if there are any changes to the source while the copy is in progress, the copy will fail. An attempt to change the destination file while a copy is in progress will fail with 409 (Conflict).  
  
 The ETag for the destination file changes when the **Copy File** operation is initiated, and continues to change frequently during the copy operation.  
  
## Copying Properties and Metadata  
 When a blob or file is copied, the following system properties are copied to the destination file with the same values:  
  
- Content-Type  
  
- Content-Encoding  
  
- Content-Language  
  
- Content-Length  
  
- Cache-Control  
  
- Content-MD5  
  
- Content-Disposition  
  
 The destination file is always the same size as the source blob or file, so the value of the Content-Length header for the destination file matches that for the source blob or file.  
  
## Copy a Leased Blob or File to a File
 The Copy File operation only reads from the source blob or file, so a lease on the source object does not affect the copy. The Copy File operation saves the ETag of the source blob or file when the copy is initiated. If the ETag value changes before the copy completes, the copy fails. You can prevent changes to the source blob of file by leasing it during the copy operation. 

If the destination file has an active infinite lease, you must specify its lease ID in the call to the Copy File operation. While the copy is pending, any lease operation on the destination file will fail with status code 409 (Conflict). An infinite lease on the destination file is locked in this way during the copy operation whether copying to a destination file with a different name from the source or copying to a destination file with the same name as the source. If the client specifies a lease ID on a file that does not yet exist, the File service will return status code 412 (Precondition Failed). 
  
## Working with a Pending Copy  
 The **Copy File** operation may complete the copy asynchronously. Use the following table to determine the next step based on the status code returned by **Copy File**:  
  
|Status Code|Meaning|  
|-----------------|-------------|  
|202 (Accepted), x-ms-copy-status: success|Copy completed successfully.|  
|202 (Accepted), x-ms-copy-status: pending|Copy has not completed. Poll the destination blob using Get File Properties to examine the x-ms-copy-status until copy completes or fails.|  
|4xx, 500, or 503|Copy failed.|  
  
 During and after a **Copy File** operation, the properties of the destination file contain the copy ID of the **Copy File** operation and URL of the source blob or file. When the copy completes, the File service writes the time and outcome value (**success**, **failed**, or **aborted**) to the destination file properties. If the operation **failed**, the `x-ms-copy-status-description` header contains an error detail string.  
  
 A pending **Copy File** operation has a 2 week timeout. A copy attempt that has not completed after 2 weeks times out and leaves an empty file with the `x-ms-copy-status` field set to **failed** and the `x-ms-status-description` set to 500 (OperationCancelled). Intermittent, non-fatal errors that can occur during a copy might impede progress of the copy but not cause it to fail. In these cases, `x-ms-copy-status-description` describes the intermittent errors.  
  
 Any attempt to modify the destination file during the copy will fail with **409 (Conflict) Copy File in Progress**.  
  
 If you call **Abort Copy File** operation, you will see a `x-ms-copy-status:aborted` header and the destination file will have intact metadata and a file length of zero bytes. You can repeat the original call to **Copy File** to try the copy again.  
  
## Billing  
 The destination account of a **Copy File** operation is charged for one transaction to initiate the copy, and also incurs one transaction for each request to abort or request the status of the copy operation.  
  
 When the source file or blob is in another account, the source account incurs transaction costs. In addition, if the source and destination accounts reside in different regions (e.g. US North and US South), bandwidth used to transfer the request is charged to the source account as egress. Egress between accounts within the same region is free.  
  
## See also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [File Service Error Codes](File-Service-Error-Codes.md)   
 [Abort Copy File](Abort-Copy-File.md)
