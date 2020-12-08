---
title: Get Directory Properties (REST API) - Azure Storage
description: The Get Directory Properties operation returns all system properties for the specified directory, and can also be used to check the existence of a directory. The data returned does not include the files in the directory or any subdirectories.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Get Directory Properties

The `Get Directory Properties` operation returns all system properties for the specified directory, and can also be used to check the existence of a directory. The data returned does not include the files in the directory or any subdirectories.  
  
## Request  
 The `Get Directory Properties` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`GET/HEAD`|`https://myaccount.file.core.windows.net/myshare/myparentdirectorypath/mydirectory?restype=directory`|HTTP/1.1|  
|`GET/HEAD`|`https://myaccount.file.core.windows.net/myshare/ myparentdirectorypath/mydirectory?restype=directory&sharesnapshot=<DateTime>`|HTTP/1.1|

 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
|*myparentdirectorypath*|Optional. The path to the parent directory.|  
|*mydirectory*|The name of the directory.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`sharesnapshot`|Optional. Version 2017-04-17 and newer. The sharesnapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query for the directory properties |
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).| 
  
### Request Body  
 None.  
  
## Sample Request  
  
```  
HEAD https://myaccount.file.core.windows.net/myshare/myparentdirectorypath/mydirectory?restype=directory HTTP/1.1  
  
Request Headers:  
x-ms-version: 2015-02-21  
x-ms-date: <date>  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value that you can use to perform operations conditionally, in quotes.|  
|`Last-Modified`|Returns the date and time the Directory was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). Operations on files within the directory do not affect the last modified time of the directory.|  
|`x-ms-meta-name:value`|A set of name-value pairs that contain metadata for the directory.|  
|`x-ms-request-id`|Returns the unique identifier of the request, in order to troubleshoot the request. For more information, see Troubleshooting API Operations.|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-server-encrypted: true/false`|Version 2017-04-17 or newer. The value of this header is set to `true` if the directory metadata is completely encrypted using the specified algorithm. Otherwise, the value is set to `false`.|  
| `x-ms-file-permission-key` | The key of the permission of the directory. |
| `x-ms-file-attributes` | The file system attributes on the directory. See the list of [available attributes](#authorization). |
| `x-ms-file-creation-time` | The UTC date/time value that represents the creation time property for a directory. |
| `x-ms-file-last-write-time` | The UTC date/time value that represents the last write time property for the directory.  |
| `x-ms-file-change-time` | The UTC date/time that value that represents the change time property for the directory. |
| `x-ms-file-file-id` | The file ID of the directory. |
| `x-ms-file-parent-id` | The parent file ID of the directory. |
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
Transfer-Encoding: chunked  
Date: <date>  
ETag: "0x8CAFB82EFF70C46"  
Last-Modified: <date>  
x-ms-version: 2015-02-21  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  
 Only the account owner may call this operation.  
  
## Remarks  
 If the specified directory path does not exist the request will fail with status code 404 (Not Found).  
  
## See also  
 [Operations on Directories](Operations-on-Directories.md)
