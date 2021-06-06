---
title: Get Share Metadata (FileREST API) - Azure Files
description: The Get Share Metadata operation returns all user-defined metadata for the Azure file share or share snapshot.
author: wmgries

ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Get Share Files
The `Get Share Metadata` operation returns all user-defined metadata for the Azure file share or share snapshot. While this API is fully supported, this is a legacy management API. We recommend using [File Shares - Get](/rest/api/storagerp/file-shares/get) provided by the storage resource provider (Microsoft.Storage) instead. To learn more about programmatically interacting with `FileShare` resources using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request
The `Get Share Metadata` request is constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET/HEAD`|`https://myaccount.file.core.windows.net/myshare?restype=share&comp=metadata`|HTTP/1.1|  
|`GET/HEAD`|`https://myaccount.file.core.windows.net/myshare?restype=share&comp=metadata&sharesnapshot=<DateTime>`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  

|Path component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
## URI parameters
The following additional parameters can be specified in the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`sharesnapshot`|Optional. Version 2017-04-17 and newer. The sharesnapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query to retrieve the metadata|
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|
  
## Request headers  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
|`x-ms-lease-id:<ID>`|Optional. Version 2020-02-10 and newer. If the header is specified, the operation will be performed only if the file share's lease is currently active and the lease ID specified in the request matches the that of the file share. Otherwise, the operation fails with status code 412 (Precondition Failed).|
  
## Request body
None.  
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
## Status code
A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
## Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?LinkId=73147).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Last-Modified`|Returns the date and time the share was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md). Any operation that modifies the share or its properties updates the last modified time. Operations on files do not affect the last modified time of the share.|  
|`x-ms-meta-name:value`|A set of name-value pairs that contains user-defined metadata for the share.|  
|`ETag`|The ETag contains a value that you can use to perform operations conditionally, in quotes.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date` or `x-ms-date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
## Response body
None.  
  
## Sample response
  
```
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
Transfer-Encoding: chunked  
x-ms-meta-name: somemetadata  
Date: Mon, 27 Jan 2014 22:49:18 GMT  
ETag: "0x8CB171DBEAD6A6B"  
Last-Modified: Mon, 27 Jan 2014 22:48:29 GMT  
x-ms-version: 2014-02-14  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization
Only the account owner may call this operation.  
  
## Remarks
This operation returns only user-defined metadata on the share. To return system properties as well, call [Get Share Properties](Get-Share-Properties.md).  
  
## See also
[Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)
