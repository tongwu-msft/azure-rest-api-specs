---
title: List Ranges (REST API) - Azure Storage
description: The List Ranges operation returns the list of valid ranges for a file.
author: pemari-msft

ms.date: 09/20/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# List Ranges

The `List Ranges` operation returns the list of valid ranges for a file.  
  
## Request  
 The `List Ranges` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=rangelist`|HTTP/1.1|  
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?sharesnapshot=<DateTime>&comp=rangelist`|HTTP/1.1|  
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=rangelist&snapshot=<DateTime>&prevsharesnapshot=<DateTime>`|HTTP/1.1|
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=rangelist&prevsharesnapshot=<DateTime>`|HTTP/1.1|

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
|`sharesnapshot`|Optional. Version 2017-04-17 and newer. The sharesnapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query for the file. |
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
|`prevsharesnapshot`|Optional in version 2020-02-10 and newer. The prevsharesnapshot parameter is an opaque DateTime value that, when present, specifies the previous snapshot.<br /><br />When both this parameter and sharesnapshot are present then the response will contain only page ranges that were changed between the two snapshots. When only prevsharesnapshot is present then the response will contain only page ranges that were changed between this snapshot and live share.<br /><br />Changed pages include both updated and cleared pages.|
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|-|-|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Range`|Optional. Specifies the range of bytes over which to list ranges, inclusively. If omitted, then all ranges for the file are returned.|  
|`x-ms-range`|Optional. Specifies the range of bytes over which to list ranges, inclusively.<br /><br /> If both the `Range` and `x-ms-range` headers are specified, the service uses the value of `x-ms-range`. See [Specifying the Range Header for File Service Operations](Specifying-the-Range-Header-for-File-Service-Operations.md) for more information.|  
|`x-ms-lease-id:<ID>`|Optional. Version 2019-02-02 and newer. If the header is specified, the operation will be performed only if the file's lease is currently active and the lease ID specified in the request matches the that of the file. Otherwise, the operation fails with status code 412 (Precondition Failed).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`Last-Modified`|The date/time that the file was last modified. The date format follows RFC 1123. Any operation that modifies the file, including an update of the file’s metadata or properties, changes the file’s last modified time.|  
|`ETag`|The ETag contains a value which represents the version of the file, in quotes.|  
|`x-ms-content-length`|The size of the file in bytes. When `prevsharesnapshot` is present then the value describes the size of the file at the `sharesnapshot` (if `sharesnapshot` query parameter is present) or otherwise it describes the size of the live file.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date` or `x-ms-date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|
  
### Response Body  
The response body includes a list of non-overlapping valid ranges, sorted by increasing address range. The format of the response body is as follows.  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<Ranges>  
  <Range>  
    <Start>Start Byte</Start>  
    <End>End Byte</End>  
  </Range>  
  <Range>  
    <Start>Start Byte</Start>  
    <End>End Byte</End>  
  </Range>  
</Ranges>  
```  
  
If the file's entire set of ranges has been cleared, the response body will not include any ranges.

If the `prevsharesnapshot` was specified, the response will include only the pages that differ between the target snapshot (or live file) and previous snapshot. The ranges returned include both ranges that were updated or that were cleared. The format of this response is as follows. 

```xml
<?xml version="1.0" encoding="utf-8"?> 
<Ranges> 
  <Range> 
    <Start>Start Byte</Start> 
    <End>End Byte</Start> 
  </Range> 
  <ClearRange> 
    <Start>Start Byte</Start>
    <End>End Byte</Start> 
  </ClearRange> 
  <Range> 
    <Start>Start Byte</Start> 
    <End>End Byte</Start> 
  </Range> 
</Ranges> 
```

If the file's entire set of pages has been cleared and `prevsharesnapshot` parameter was not specified, the response body will not include any ranges. 
  
## Authorization  
Only the account owner may call this operation.  
  
## Remarks  
The start and end byte offsets for each range are inclusive. Please refer to the **Range Update Operations** and **Range Clear Operations** examples for [Put Range](Put-Range.md); these examples show what ranges are returned if you write or clear a 512-unaligned byte range from the file.  

In a highly fragmented file with a large number of writes, a `List Ranges` request can fail due to an internal server timeout. Applications retrieving ranges of a file with a large number of write operations should retrieve a subset of ranges at a time.  

Beginning with version 2020-02-10, you can call List Ranges with `prevsharesnapshot` parameter to return the ranges that differ between the live file and a snapshot, or between two snapshots of the file on snapshots. Using these range differences, you can retrieve an incremental snapshot of a file. Incremental snapshots are cost-effective way to backup files if you wish to implement your own backup solution. 

Certain operations on a file will cause List Ranges to fail when called to retrieve incremental snapshot: 

- 404 (Not Found) if called on file that doesn’t exist in one of the snapshots (or live, if sharesnapshot was not specified).
- 409 (Conflict) if called on a file that was the target of an overwriting Copy after the snapshot specified by `prevsharesnapshot` was taken.
- 409 (Conflict) if called on a file that was deleted and recreated with the same name and location after the snapshot specified by `prevsharesnapshot` was taken.
  
## See also  
 [Operations on Files](Operations-on-Files.md)
