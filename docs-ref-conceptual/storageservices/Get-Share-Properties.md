---
title: Get Share Properties (FileREST API) - Azure Files
description: The Get Share Properties operation returns properties for the specified share or share snapshot.
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Get Share Properties
The `Get Share Properties` request returns properties for the specified share or share snapshot. While this API is fully supported, this is a legacy management API. We recommend using [File Shares - Get](/rest/api/storagerp/file-shares/get) provided by the storage resource provider (Microsoft.Storage) instead. To learn more about programmatically interacting with `FileShare` resources using the storage resource provider, see [Operations on FileShares](Operations-on-Shares--File-Service-.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request
The `Get Share Properties` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`GET/HEAD`|`https://myaccount.file.core.windows.net/myshare?restype=share`|HTTP/1.1|  
|`GET/HEAD`|`https://myaccount.file.core.windows.net/myshare?restype=share&sharesnapshot=<DateTime>`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own, as follows:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share.|  
  
For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
## URI parameters
The following additional parameters can be specified in the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`sharesnapshot`|Optional. Version 2017-04-17 and newer. The sharesnapshot parameter is an opaque DateTime value that, when present, specifies the share snapshot to query to retrieve the properties|
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|
  
## Request headers
The following table describes required and optional request headers.  
  
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
|`x-ms-meta-name:value`|A set of name-value pairs that contain the user-defined metadata of the share.|  
|`ETag`|The ETag contains a value that you can use to perform operations conditionally, in quotes.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-share-quota`|Version 2015-02-21 or newer. Returns the current share quota in GiB.|  
|`x-ms-share-provisioned-iops`|Version 2019-07-07 or newer. This header is only returned for premium file shares (file shares within the FileStorage storage account type). Returns the number of IOPS provisioned for the premium share. 
|`x-ms-share-provisioned-ingress-mbps`|Version 2019-07-07 or newer. This header is only returned for premium file shares (file shares within the FileStorage storage account type). Returns the ingress in MiB/s provisioned for the premium share.
|`x-ms-share-provisioned-egress-mbps`|Version 2019-07-07 or newer. This header is only returned for premium file shares (file shares within the FileStorage storage account type). Returns the egress in MiB/s provisioned for the premium share.
|`x-ms-share-next-allowed-quota-downgrade-time`|Version 2019-07-07 or newer. This header is only returned for premium file shares (file shares within the FileStorage storage account type). A DateTime value that specifies when the quota for the premium file share is permitted to be reduced. The date format follows RFC 1123.|
|`x-ms-access-tier`|Version 2019-12-12 or newer. Returns the current access tier of the share. In general purpose version 2 (GPv2) storage accounts, `TransationOptimized` is the default tier of the share. In FileStorage storage account types, `Premium` is the default tier of the share. |  
|`x-ms-access-tier-change-time`|Version 2019-12-12 or newer. Returns the date and time the access tier on the share was last modified.|  
|`x-ms-access-tier-transition-state`|Version 2019-12-12 or newer. If the share is undergoing tier transition, this indicates the tier it is transitioning from.|
|`x-ms-lease-duration:<fixed,infinite>`|Version 2020-02-10 and newer. Specifies whether the lease on a share is of infinite or fixed duration. |
|`x-ms-lease-state: <available;leased;expired;breaking;broken>`|Version 2020-02-10 and newer. When a share is leased, specifies the lease state of the share.| 
|`x-ms-lease-status: <locked;unlocked>`|Version 2020-02-10 and newer. When a share is leased, specifies the lease status of the share. |
|`x-ms-enabled-protocols: <SMB | NFS>`|Returns the current share enabled protocols for version 2020-02-10 and above.<br /><br /><ul><li>`SMB`: The share can be accessed by SMBv3.0, SMBv2.1 and REST.</li><li>`NFS`: The share can be accessed by NFSv4.1.</li></ul>| 
|`x-ms-root-squash: <NoRootSquash | RootSquash | AllSquash>`|Returns the current share root squashing behavior for version 2020-02-10 and above.<br /><br /><ul><li>`NoRootSquash`: Root squashing is off.</li><li>`RootSquash`: Requests from uid/gid 0 are mapped to the anonymous uid/gid.</li><li>`AllSquash`: All uids and gids are mapped to the anonymous user.</li></ul>|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.| 

## Response body
None.  
  
## Sample response

```
Response Status:  
HTTP/1.1 200 OK  
  
Response Headers:  
Transfer-Encoding: chunked  
x-ms-meta-name: some_metadata  
Date: <date>  
ETag: "0x8CB171DBEAD6A6B"  
Last-Modified: <date>  
x-ms-share-quota: 1024
x-ms-access-tier: Premium
x-ms-version: 2020-02-10  
x-ms-enabled-protocols: NFS
x-ms-root-squash: RootSquash
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  

## Authorization
Only the account owner may call this operation.  
  
## Remarks
None.  
  
## See also
[Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)
