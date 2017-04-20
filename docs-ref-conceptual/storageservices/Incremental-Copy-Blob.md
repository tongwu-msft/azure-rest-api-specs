---
title: "Incremental Copy Blob"
ms.custom: na
ms.date: 2016-12-16
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 08ad1834-4662-463f-aa3e-8db11ec41f68
caps.latest.revision: 28
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
# Incremental Copy Blob
The `Incremental Copy Blob` operation copies a snapshot of the source page blob to a destination page blob. The snapshot is copied such that only the differential changes between the previously copied snapshot are transferred to the destination. The copied snapshots are complete copies of the original snapshot and can be read or copied from as usual. This API is supported since REST version 2016-05-31.  
  
## Request  
 The `Incremental Copy Blob` request may be constructed as follows. HTTPS is recommended. Replace myaccount with the name of your storage account, mycontainer with the name of your container, and myblob with the name of your destination blob. The comp query parameter with value of incrementalcopy indicates this request is to create an incremental snapshot:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=incrementalcopy`|HTTP/1.1|  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as 127.0.0.1:10000, followed by the emulated storage account name. Also indicate that this request is for incremental copy by setting the comp query parameter to the value incrementalcopy:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=incrementalcopy`|HTTP/1.1|  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|   
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-version`|Required for all authenticated requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. Specifies a user-defined name-value pair associated with the blob. If no name-value pairs are specified, the operation will copy the metadata from the source blob or file to the destination blob. If one or more name-value pairs are specified, the destination blob is created with the specified metadata, and metadata is not copied from the source blob or file.<br/><br/>Note that beginning with version 2009-09-19, metadata names must adhere to the naming rules for C# identifiers. See [Naming and Referencing Containers, Blobs, and Metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md) for more information.|  
|`If-Modified-Since`|Optional. A DateTime value. Specify this conditional header to copy the blob only if the destination blob has been modified since the specified date/time. If the destination blob has not been modified, the Blob service returns status code 412 (Precondition Failed).|
|`If-Unmodified-Since`|Optional. A DateTime value. Specify this conditional header to copy the blob only if the destination blob has not been modified since the specified date/time. If the destination blob has been modified, the Blob service returns status code 412 (Precondition Failed).|
|`If-Match`|Optional. An ETag value. Specify an ETag value for this conditional header to copy the blob only if the specified ETag value matches the ETag value for an existing destination blob. If the ETag for the destination blob does not match the ETag specified for If-Match, the Blob service returns status code 412 (Precondition Failed).|
|`If-None-Match`|Optional. An ETag value, or the wildcard character (`*`).<br/><br/>Specify an ETag value for this conditional header to copy the blob only if the specified ETag value does not match the ETag value for the destination blob.<br/><br/>Specify the wildcard character (`*`) to perform the operation only if the destination blob does not exist.<br/><br/>If the specified condition isn't met, the Blob service returns status code 412 (Precondition Failed).|
|`x-ms-copy-source:name`|Required. Specifies the name of the source page blob snapshot.<br/><br/>This value is a URL of up to 2 KB in length that specifies a page blob snapshot. The value should be URL-encoded as it would appear in a request URI. The source blob must either be public or must be authenticated via a shared access signature. Here is an example of a source blob URL:<br/><br/>`https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging and Azure Logging: Using Logs to Track Storage Requests](About-Storage-Analytics-Logging.md).|

### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers.  
  
### Status Code  
 A successful operation returns status code 202 (Accepted).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Syntax|Description|  
|------------|-----------------|  
|`ETag`|The ETag contains a value that you can use to perform operations conditionally. See Specifying Conditional Headers for Blob Service Operations for more information. The ETag value will be in quotes.|
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of Date/Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br/><br/>Any write operation on the blob (including updates on the blob's metadata or properties) changes the last modified time of the blob.|   
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-copy-id: <id>`|String identifier for this copy operation. Use with Get Blob Properties to check the status of this copy operation, or pass to Abort Copy Blob to abort a pending copy.|
|`x-ms-copy-status: pending`|	State of the copy operation. This is always pending to indicate that the copy has started and is in progress. |

### Response Body  
 None.
  
### Sample Response
The following is a sample response for a request to perform an incremental copy:

```  
Response Status:
HTTP/1.1 202 Accepted

Response Headers: 
Last-Modified: <date> 
ETag: "0x8CEB669D794AFE2"
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0
x-ms-request-id: cc6b209a-b593-4be1-a38a-dde7c106f402
x-ms-version: 2016-05-31
x-ms-copy-id: 1f812371-a41d-49e6-b123-f4b542e851c5
x-ms-copy-status: pending
Date: <date> 
```  
  
## Authorization  
 This operation can be called by the destination account owner or with a shared access signature of the destination blob. 

 Access to the source blob or file is authorized separately, as described in the details for the request header x-ms-copy-source.
  
  
## Remarks  
 The destination of an incremental copy must either not exist, or must have been created with a previous incremental copy from the same source blob. Once created, the destination blob is permanently associated with the source and may only be used for incremental copies. The Get Blob Properties and List Blobs APIs indicate whether the blob is an incremental copy blob created in this way. Incremental copy blobs may not be downloaded directly. The only supported operations are Get Blob Properties, Incremental Copy Blob, and Delete Blob. The copied snapshots may be read and deleted as usual.

 An incremental copy is performed asynchronously on the service and must be polled for completion. See the Copy Blob API for details on how to poll a pending copy. When the copy completes, the destination blob will contain a new snapshot. The Get Blob Properties API returns the snapshot time of the newly created snapshot.

 The first time an incremental copy is performed on a destination blob, a new blob is created with a snapshot that is fully copied from the source. Each subsequent call to Incremental Copy Blob will create a new snapshot by copying only the differential changes from the previously copied snapshot. The differential changes are computed on the server by issuing a Get Page Ranges call on the source blob snapshot with prevsnapshot set to the most recently copied snapshot. Therefore, the same restrictions on Get Page Ranges apply to Incremental Copy Blob. Specifically, snapshots must be copied in ascending order and if the source blob is recreated using Put Blob or Copy Blob then Incremental Copy Blob on new snapshots will fail.  

 The additional storage space consumed by the copied snapshot is the size of the differential data transferred during the copy. This can be determined by performing a differential Get Page Ranges API call on the snapshot to compare it to the previous snapshot.
  
## See Also  
 [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)   
