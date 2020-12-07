---
title: Restore Share (REST API) - Azure Storage.
description: The Restore Share operation allows for a previously-deleted share to be undeleted.
author: seanmcc

ms.date: 06/22/2020
ms.service: storage
ms.topic: reference
ms.author: seanmcc
---

# Restore Share
The `Restore Share` operation restores (undeletes) a share that had previously been soft-deleted. The share will be restored along with all of its data, metadata and snapshots.
  
The share resource includes metadata and properties for the share. It does not include a list of the files contained by the share.  
  
## Request  
 The `Restore Share` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/restoredShareName?restype=share&comp=undelete`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*restoredShareName*|The name to use for the restored share. If a share already exists with this name, the operation will fail.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-deleted-share-name`|Required. Identifies the the soft-deleted file share to be restored. This value must match the value of `restoredShareName`.|  
|`x-ms-deleted-share-version`|Required. Uniquely identifies the soft-deleted file share by its version.|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|  
 
### Request Body  
 None.  
  
### Sample Request  
  
```  
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=undelete HTTP/1.1   

Request Headers:  
x-ms-version: 2019-12-12   
x-ms-deleted-share-name: myshare 
x-ms-deleted-share-version: 01D2AC0C18EDFE36   
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ= 
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
 If the destination file share name is used by a valid non-deleted file share, the request will fail with a 409 (Conflict). 
 If the source file share is not soft-deleted, has already been restored, or if the source file share has passed its retention period and has expired, the request will fail with a 404 (Not Found).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value which represents the version of the share, in quotes.|  
|`Last-Modified`|Returns the date and time the share was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any operation that modifies the share or its properties or metadata updates the last modified time. Operations on files do not affect the last modified time of the share.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id header` if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id header` is not present in the request, this header will not be present in the response.|  
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
x-ms-request-id: 78c46801-f01a-0089-31fb-486017000000 
x-ms-version: 2019-12-12   
Content-Length: 0 
Date: <date>   
ETag: "0x8CB14C3E29B7E82"   
Last-Modified: <date>   
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0 
```  
  
## Authorization  
 The storage account owner and users with valid Account SAS tokens may call this operation. The SAS token must include Write permissions for the Container resource to authorize this operation.
  
## Remarks  
 It is not currently possible to restore a share to a different name. When restoring a share, if another share exists with the same name, the operation will fail with status code 409 (Conflict). The share with the same name must first be deleted before the soft-deleted share can be undeleted. 
 
 When a share is deleted, a share with the same name cannot be restored for at least 30 seconds. While the share is being deleted, attempts to restore a share of the same name will fail with status code 409 (Conflict), with the service returning additional error information indicating that the share is being deleted.
  
## See Also  
 [Operations on Shares (File Service)](Operations-on-Shares--File-Service-.md)
