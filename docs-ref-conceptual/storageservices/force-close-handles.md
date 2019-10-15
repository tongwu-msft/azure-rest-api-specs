---
title: Force Close Handles (REST) - Azure Storage
description: The Force Close Handles operation closes a handle or handles opened on a directory or a file at the service. It supports closing a single handle specified by handle ID on a file or directory or closing all handles opened on that resource. It optionally supports recursively closing handles on subresources when the resource is a directory.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Force Close Handles

The `Force Close Handles` operation closes a handle or handles opened on a directory or a file at the service. It supports closing a single handle specified by handle ID on a file or directory or closing all handles opened on that resource. It optionally supports recursively closing handles on subresources when the resource is a directory.

This API is intended to be used alongside [List Handles](List-Handles.md) to force close handles that block operations, such as renaming a directory. These handles may have leaked or been lost track of by SMB clients. The API has client-side impact on the handle being closed, including user visible errors due to failed attempts to read or write files. This API is not intended for use as a replacement or alternative for SMB close.

This API is available beginning in version 2018-11-09.
  
## Request  
 The `Force Close Handles` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfileordirectory?comp=forceclosehandles`|HTTP/1.1|  

Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
|*mydirectorypath*|Optional. The path to the directory.|
|*myfileordirectory*|The name of the file or directory.|
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters  
 The following additional parameters may be specified on the URI.  
  
|Parameter|Description|  
|---------------|-----------------|
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|
|`marker`|Optional. A string value that identifies the position of handles that will be closed with the next force close handles operation. The operation returns a marker value within the response body if there are more handles to close. The marker value may then be used in a subsequent call to close the next set of handles.<br /><br /> The marker value is opaque to the client.|
|`sharesnapshot`|Optional. The share snapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query for the list of handles.|
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md).|
|`x-ms-handle-id`|Required. Specifies the handle ID to be closed. Use an asterisk ('*') as a wildcard string to specify all handles.|
|`x-ms-recursive`|Optional. A boolean value that specifies if the operation should also apply to the files and subdirectories of the directory specified in the URI.|
  
### Request Body  
 None.  
  
##  <a name="response"></a> Response  
 The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-marker`|A string describing the next handle to be closed. It is returned when more handles need to be closed in order to complete the request. The string is used in subsequent requests to force close remaining handles. Absence of x-ms-marker indicates that all relevant handles were closed.|
|`x-ms-number-of-handles-closed`|Count of the number of handles closed.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Response Body  
Empty.

##  <a name="authorization"></a> Authorization  
 Only the account owner may call this operation.  
  
## Remarks  
If no handles are closed during processing of requests (for example, supplied x-ms-handle-id specifies an invalid handle, or no open handles were found in the supplied file or directory) results in 200 (OK) status response with x-ms-number-of-handles-closed=0.

The `x-ms-recursive` header is only valid for directories and causes 400 (Bad request) response if specified for a file.

Force-closing a handle opened with `FILE_FLAG_DELETE_ON_CLOSE` may not cause the file to be deleted.

The `x-ms-handle-id` is a service-side handle ID returned by [List Handles](List-Handles.md). This handle ID is different than the corresponding client-side handle maintained by SMB or by application.
  
## See also  
 [Operations on Files](Operations-on-Files.md)
 [Operations on Directories](Operations-on-Directories.md)
