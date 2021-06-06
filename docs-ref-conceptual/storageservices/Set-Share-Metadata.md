---
title: Set Share Metadata (FileREST API) - Azure Files
description: The Set Share Metadata operation sets one or more user-defined name-value pairs for the specified share.
author: wmgries

ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Set Share Metadata
The `Set Share Metadata` operation sets one or more user-defined name-value pairs for the specified share. While this API is fully supported, this is a legacy management API. We recommend using [File Shares - Update](/rest/api/storagerp/file-shares/update) provided by the storage resource provider (Microsoft.Storage) instead. To learn more about programmatically interacting with `FileShare` resources using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request
The `Set Share Metadata` request is constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare?restype=share&comp=metadata`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
## URI parameters
The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|
  
## Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. A name-value pair to contain metadata for the share.<br /><br /> Each call to this operation replaces all existing metadata attached to the share. To remove all metadata from the share, call this operation with no metadata headers.<br /><br /> Metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
|`x-ms-lease-id:<ID>`|Required if the destination file share has an active lease. Available for versions 2020-02-10 and newer. If the request does not include the lease ID or it is not valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination file share does not currently have an active lease, the operation will also fail with status code 412 (Precondition Failed).|
  
## Request body
None.

## Sample request
  
```
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=metadata HTTP/1.1  
  
Request Headers:  
x-ms-version: 2014-02-14  
x-ms-date: Mon, 27 Jan 2014 22:50:32 GMT  
x-ms-meta-Category: Images  
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=  
```  
  
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
|`ETag`|The ETag contains a value which represents the version of the share, in quotes.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date` or `x-ms-date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|

## Response body
None.
  
## Authorization
Only the account owner may call this operation.  
  
## Remarks
Calling `Set Share Metadata` overwrites all existing metadata that is associated with the share. It is not possible to modify an individual name-value pair.  
  
You may also set metadata for a share at the time that it is created, as part of the [Create Share](Create-Share.md) operation.  
  
Calling `Set Share Metadata` updates the `ETag` and the `Last-Modified-Time` properties for the share.  
  
`Set Share Metadata` is not supported for a share snapshot. An attempt to perform this operation on a share snapshot will fail with 400 (InvalidQueryParameterValue). You can set metadata for a share snapshot at the time that it is created, as part of the Snapshot Share operation.

## See also
[Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)
