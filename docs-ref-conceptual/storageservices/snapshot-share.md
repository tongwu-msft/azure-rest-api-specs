---
title: "Snapshot Share"
ms.custom: na
ms.date: 2017-09-26
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 211d8e61-05b5-420d-bd4b-8cee40e0c3de
caps.latest.revision: 12
author: tamram
manager: carolz
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Snapshot Share
Beginning with version 2017-04-17, the Snapshot Share operation creates a read-only snapshot of a share.  
  
## Request  
 The `Snapshot Share` request may be constructed as follows. HTTPS is recommended.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare?restype=share&comp=snapshot`|HTTP/1.1|  
  
 Replace the path components shown in the request URI with your own, as follows:  
  
|Path Component|Description|  
|--------------------|-----------------|  
|*myaccount*|The name of your storage account.|  
|*myshare*|The name of your file share.|  
  
 For details on path naming restrictions, see [Naming and Referencing Shares, Directories, Files, and Metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) time for the request. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. <br /> Specifies a user-defined name-value pair associated with the share snapshot. If no name-value pairs are specified, the operation copies the base share metadata to the snapshot.<br /> If one or more name-value pairs are specified, the share snapshot is created with the specified metadata. In this case metadata is not copied from the base share.  <br />Metadata names must adhere to the naming rules for [C# identifiers](http://msdn.microsoft.com/library/aa664670%28VS.71%29.aspx).<br /> 
  
### Request Body  
 None.  
  
### Sample Request  
  
```  
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=snapshot HTTP/1.1

Request Headers:
x-ms-version: 2017-04-17
x-ms-date: Mon, 10 May 2017 22:50:32 GMT
x-ms-meta-Name: StorageSample
Authorization: SharedKey myaccount:Z5043vY9MesKNh0PNtksNc9nbXSSqGHueE00JdjidOQ=
 
  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value that represents the version of the share snapshot, in quotes.<br /><br /> A share snapshot cannot be modified, so the ETag of a given share snapshot never changes. However, if new metadata was supplied with the Snapshot Share request then the ETag of the share snapshot differs from that of the base share. If no metadata was specified with the request, the ETag of the share snapshot is identical to that of the base share at the time the share snapshot was taken.|  
|`Last-Modified`|Returns the date and time the share was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> A share snapshot cannot be modified, so the last modified time of a given share snapshot never changes. However, if new metadata was supplied with the Snapshot Share request then the last modified time of the share snapshot differs from that of the base share. If no metadata was specified with the request, the last modified time of the share snapshot is identical to that of the base share at the time the share snapshot was taken.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md)|  
|`x-ms-version`|Indicates the version of the File service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|
|`x-ms-snapshot`|This header is a DateTime value that uniquely identifies the share snapshot. The value of this header may be used in subsequent requests to access the share snapshot. This value is opaque.|
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:
HTTP/1.1 201 Created

Response Headers:
Content-Length: 0
Date: Mon, 10 May 2017 23:00:12 GMT
ETag: "0x8CB14C3E29B7E82"
Last-Modified: Mon, 10 May 2017 23:00:06 GMT
x-ms-version: 2017-04-17
x-ms-snapshot: 2017-05-10T17:52:33.9551861Z
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0
```  
  
## Authorization  
 Only the account owner may call this operation.  
  
## Remarks  
 Share snapshots provide read-only versions of shares. Once created, a share snapshot cannot be modified.  A share snapshot provides a convenient way to create a consistent backup of all files on a share.  
  
 When you create a share snapshot, the File service returns a DateTime value that uniquely identifies the share snapshot relative to its base share. You can use this value to perform further operations on the share snapshot and its contents. You should treat this DateTime value as opaque.
  
 The DateTime value identifies the share snapshot on the request URI. For example, a file on the base share and its snapshots have URIs similar to the following examples:
<br />File on share: http://myaccount.file.core.windows.net/myshare/myfile
<br />File on share snapshot: http://myaccount.file.core.windows.net/myshare/myfile?sharesnapshot=<DateTime>
  
A share can support creation of 100 share snapshots. 

Each time you call the Snapshot Share operation, a new share snapshot is created, with a unique DateTime value. 
<br / >An attempt to create more than 100 share snapshots fails with 409 (Conflict). 
<br />An attempt to create a share snapshot while the previous create of a share snaphot is in progress fails with 409 (Conflict).
<br />Existing share snapshots are never overwritten. They must be deleted explicitly by calling [Delete Share](Delete-Share.md) and setting `x-ms-include-snapshots` header along with the `sharesnapshot` query parameter to the appropriate value.
