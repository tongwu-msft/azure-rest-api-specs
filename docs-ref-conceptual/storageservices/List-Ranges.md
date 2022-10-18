---
title: List Ranges (FileREST API) - Azure Files
description: The List Ranges operation returns the list of valid ranges for a file.
author: wmgries
ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# List Ranges

The `List Ranges` operation returns the list of valid ranges for a file.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct the `List Ranges` request as follows. HTTPS is recommended.
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=rangelist`|HTTP/1.1|  
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?sharesnapshot=<DateTime>&comp=rangelist`|HTTP/1.1|  
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=rangelist&snapshot=<DateTime>&prevsharesnapshot=<DateTime>`|HTTP/1.1|
|GET|`https://myaccount.file.core.windows.net/myshare/mydirectorypath/myfile?comp=rangelist&prevsharesnapshot=<DateTime>`|HTTP/1.1|

Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
|`mydirectorypath`|Optional. The path to the parent directory.|  
|`myfile`|The name of the file.|  
  
For details on path naming restrictions, see [Naming and referencing shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters

You can specify the following additional parameters on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`sharesnapshot`|Optional. Version 2017-04-17 and later. The `sharesnapshot` parameter is an opaque `DateTime` value that, when present, specifies the share snapshot to query for the file. |
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting timeouts for Azure Files operations](Setting-Timeouts-for-File-Service-Operations.md).|  
|`prevsharesnapshot`|Optional in version 2020-02-10 and later. The `prevsharesnapshot` parameter is an opaque `DateTime` value that, when present, specifies the previous snapshot.<br /><br />When both this parameter and `sharesnapshot` are present, the response will contain only page ranges that were changed between the two snapshots. When only `prevsharesnapshot` is present, the response will contain only page ranges that were changed between this snapshot and the live share.<br /><br />Changed pages include both updated and cleared pages.|
  
### Request headers

The following table describes required and optional request headers.  
  
|Request header|Description|  
|-|-|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Range`|Optional. Specifies the range of bytes over which to list ranges, inclusively. If omitted, then all ranges for the file are returned.|  
|`x-ms-range`|Optional. Specifies the range of bytes over which to list ranges, inclusively.<br /><br /> If both the `Range` and `x-ms-range` headers are specified, the service uses the value of `x-ms-range`. See [Specifying the range header for Azure Files operations](Specifying-the-Range-Header-for-File-Service-Operations.md) for more information.|  
|`x-ms-lease-id:<ID>`|Optional. Version 2019-02-02 and later. If the header is specified, the operation will be performed only if the file's lease is currently active, and the lease ID specified in the request matches that of the file. Otherwise, the operation fails with status code 412 (Precondition Failed).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|
  
### Request body

None.  
  
## Response

The response includes an HTTP status code, a set of response headers, and a response body in XML format.  
  
### Status code

A successful operation returns status code 200 (OK). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers

The response for this operation includes the following headers. The response can also include additional, standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Last-Modified`|The date/time that the file was last modified. Any operation that modifies the file, including an update of the file's metadata or properties, changes the file's last modified time.|  
|`ETag`|The `ETag` contains a value that represents the version of the file, in quotes.|  
|`x-ms-content-length`|The size of the file in bytes. When `prevsharesnapshot` is present, then the value describes the size of the file at the `sharesnapshot` (if the `sharesnapshot` query parameter is present). Otherwise, it describes the size of the live file.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request. For more information, see [Troubleshooting API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Files used to run the request.|  
|`Date` or `x-ms-date`|A UTC date/time value that indicates the time at which the response was initiated. The service generates this value.|
|`x-ms-client-request-id`|You can use this header to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request. The value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, this header won't be present in the response.|
  
### Response body

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
  
If the file's entire set of ranges has been cleared, the response body won't include any ranges.

If `prevsharesnapshot` is specified, the response includes only the pages that differ between the target snapshot (or the live file) and the previous snapshot. The ranges returned include both ranges that were updated or that were cleared. The format of this response is as follows:

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

If the file's entire set of pages has been cleared, and the `prevsharesnapshot` parameter isn't specified, the response body won't include any ranges. 
  
## Authorization

Only the account owner can call this operation.  
  
## Remarks

The start and end byte offsets for each range are inclusive. Refer to the *Range Update Operations* and *Range Clear Operations* examples for [Put Range](Put-Range.md). These examples show what ranges are returned if you write or clear a 512-unaligned byte range from the file.  

In a highly fragmented file with a large number of writes, a `List Ranges` request can fail due to an internal server timeout. Applications retrieving ranges of a file with a large number of write operations should retrieve a subset of ranges at a time.  

Beginning with version 2020-02-10, you can call `List Ranges` with a `prevsharesnapshot` parameter. This returns the ranges that differ between the live file and a snapshot, or between two snapshots of the file on snapshots. By using these range differences, you can retrieve an incremental snapshot of a file. Incremental snapshots are a cost-effective way to back up files if you want to implement your own backup solution.

Certain operations on a file cause `List Ranges` to fail when it's called to retrieve an incremental snapshot. The service returns:

- 404 (Not Found) if you call on a file that doesn't exist in one of the snapshots (or live, if `sharesnapshot` isn't specified).
- 409 (Conflict) if you call on a file that was the target of an overwriting *Copy after the snapshot*, specified by `prevsharesnapshot`.
- 409 (Conflict) if you call on a file that was deleted and re-created with the same name and location, after the snapshot specified by `prevsharesnapshot` was taken.
  
## See also

[Operations on files](Operations-on-Files.md)