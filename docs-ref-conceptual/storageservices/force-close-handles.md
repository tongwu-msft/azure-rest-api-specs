---
title: Force Close Handles (FileREST API) - Azure Files
description: The Force Close Handles operation closes handles opened on a directory or a file.
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Force Close Handles
The `Force Close Handles` operation closes a handle or handles opened on a directory or a file at the service. It supports closing a single handle specified by handle ID on a file or directory. It also supports closing all handles opened on that resource. It optionally supports recursively closing handles on subresources when the resource is a directory.

You use this operation alongside [List Handles](List-Handles.md) to force-close handles that block operations, such as renaming a directory. SMB clients might have leaked or lost track of these handles. The operation has a client-side impact on the handle that you're closing, including user-visible errors due to failed attempts to read or write files. This operation is not intended as a replacement or alternative for closing an SMB session.

This operation is available in version 2018-11-09 and later.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request
You can construct the `Force Close Handles` request as follows. We recommend HTTPS.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfileordirectory?comp=forceclosehandles`|HTTP/1.1|  

Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the directory.|
|`myfileordirectory`|The name of the file or directory.|
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
You can specify the following additional parameters on the URI:  
  
|Parameter|Description|  
|---------------|-----------------|
|`timeout`|Optional. Expressed in seconds. For more information, see [Set timeouts for file service operations](Setting-Timeouts-for-File-Service-Operations.md).|
|`marker`|Optional. A string value that identifies the position of handles that will be closed with the next `Force Close Handles` operation. The operation returns a marker value within the response body if there are more handles to close. The marker value can then be used in a subsequent call to close the next set of handles.<br /><br /> The marker value is opaque to the client.|
|`sharesnapshot`|Optional. An opaque date/time value. When it's present, it specifies the share snapshot to query for the list of handles.|
  
### Request headers
The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, but optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Azure logging: Use logs to track storage requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|
|`x-ms-handle-id`|Required. Specifies the handle ID to be closed. Use an asterisk (*) as a wildcard string to specify all handles.|
|`x-ms-recursive`|Optional. A Boolean value that specifies if the operation should also apply to the files and subdirectories of the directory specified in the URI.|
  
### Request body
None.  
  
## Response
The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files that's used to execute the request.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response. |
|`x-ms-marker`|Describes the next handle to be closed. This string is returned when more handles need to be closed in order to complete the request. The string is used in subsequent requests to force-close remaining handles. The absence of `x-ms-marker` indicates that all relevant handles were closed.|
|`x-ms-number-of-handles-closed`|Indicates the number of closed handles.|
|`x-ms-number-of-handles-failed`|Indicates the number of handles that failed to be closed.|
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|  
  
### Response body
Empty.

## Authorization
Only the account owner can call this operation.  
  
## Remarks
If no handles are closed during the processing of requests (for example, the supplied `x-ms-handle-id` value specifies an invalid handle, or no open handles were found in the supplied file or directory) you'll get a 200 (OK) status response with `x-ms-number-of-handles-closed=0`.

The `x-ms-recursive` header is valid only for directories. If you specify it for a file, you'll get a 400 (Bad Request) response.

Force-closing a handle that was opened with `FILE_FLAG_DELETE_ON_CLOSE` might not cause the file to be deleted.

[List Handles](List-Handles.md) returns the `x-ms-handle-id` service-side handle ID. This handle ID is different from the corresponding client-side handle that SMB or an application maintains.
  
## See also

- [Operations on files](Operations-on-Files.md)
- [Operations on directories](Operations-on-Directories.md)
