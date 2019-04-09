---
title: "Copy Blob From URL"
ms.custom: na
ms.date: 2019-01-29
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: de63a7ed-c489-4034-b21a-246854d7a745
caps.latest.revision: 68
author: uthkarshs
manager: pemari-msft
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
# Copy Blob From URL
The `Copy Blob From URL` operation copies a blob to a destination within the storage account synchronously for source blob sizes up to 256 MB. This API is available starting in version 2018-03-28.  

The source for a Copy Blob From URL operation can be any committed block blob in any Azure storage account which is either public or authenticated with a shared access signature.

The size of the source blob can be a maximum length of up to 256 MB.
  
## Request  
 The `Copy Blob From URL` request may be constructed as follows. HTTPS is recommended. Replace `myaccount` with the name of your storage account, `mycontainer` with the name of your container, and `myblob` with the name of your destination blob.  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`https://myaccount.blob.core.windows.net/mycontainer/myblob`|HTTP/1.1|  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob`|HTTP/1.1|  
  
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
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Required for all authenticated requests. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-meta-name:value`|Optional. Specifies a user-defined name-value pair associated with the blob. If no name-value pairs are specified, the operation will copy the metadata from the source blob or file to the destination blob. If one or more name-value pairs are specified, the destination blob is created with the specified metadata, and metadata is not copied from the source blob or file.<br /><br /> Note that beginning with version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](https://docs.microsoft.com/dotnet/csharp/language-reference).  See [Naming and Referencing Containers, Blobs, and Metadata](Naming-and-Referencing-Containers--Blobs--and-Metadata.md) for more information.|  
|`x-ms-source-if-modified-since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the source blob has been modified since the specified date/time. If the source blob has not been modified, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`x-ms-source-if-unmodified-since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the source blob has not been modified since the specified date/time. If the source blob has been modified, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`x-ms-source-if-match`|Optional. An ETag value. Specify this conditional header to copy the source blob only if its ETag matches the value specified. If the ETag values do not match, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`x-ms-source-if-none-match`|Optional. An ETag value. Specify this conditional header to copy the blob only if its ETag does not match the value specified. If the values are identical, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`If-Modified-Since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the destination blob has been modified since the specified date/time. If the destination blob has not been modified, the Blob service returns status code 412 (Precondition Failed).|  
|`If-Unmodified-Since`|Optional. A `DateTime` value. Specify this conditional header to copy the blob only if the destination blob has not been modified since the specified date/time. If the destination blob has been modified, the Blob service returns status code 412 (Precondition Failed).|  
|`If-Match`|Optional. An ETag value. Specify an ETag value for this conditional header to copy the blob only if the specified ETag value matches the `ETag` value for an existing destination blob. If the ETag for the destination blob does not match the ETag specified for `If-Match`, the Blob service returns status code 412 (Precondition Failed).|  
|`If-None-Match`|Optional. An ETag value, or the wildcard character (*).<br /><br /> Specify an ETag value for this conditional header to copy the blob only if the specified ETag value does not match the ETag value for the destination blob.<br /><br /> Specify the wildcard character (\*) to perform the operation only if the destination blob does not exist.<br /><br /> If the specified condition isn't met, the Blob service returns status code 412 (Precondition Failed).|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source blob. The value may be a URL of up to 2 KB in length that specifies a blob. The value should be URL-encoded as it would appear in a request URI. The source blob must either be public or must be authenticated via a shared access signature. If the source blob is public, no authentication is required to perform the operation. If the size of the source blob is greater than 256 MB, the request will fail with 409 (Conflict). The blob type of the source blob has to be block blob. Here are some examples of source object URLs:<br /><br /> -   `https://myaccount.blob.core.windows.net/mycontainer/myblob`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`|  
|`x-ms-requires-sync:true`|Required. This header is required in order for this API to synchronously copy contents from the copy source.|
|`x-ms-source-content-md5`|Optional. A MD5 hash of the blob content from the URI. This hash is used to verify the integrity of the blob during transport of the data from the URI. When this header is specified, the storage service compares the hash of the content that has arrived from the copy source with this header value.<br /><br /> Note that this md5 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-lease-id:<ID>`|Required if the destination blob has an active lease. The lease ID specified for this header must match the lease ID of the destination blob. If the request does not include the lease ID or it is not valid, the operation fails with status code 412 (Precondition Failed).<br /><br /> If this header is specified and the destination blob does not currently have an active lease, the operation will also fail with status code 412 (Precondition Failed).<br /><br /> In version 2012-02-12 and newer, this value must specify an active, infinite lease for a leased blob. A finite-duration lease ID fails with 412 (Precondition Failed).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests]
  
### Request Body  
 No request body.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 202 (Accepted).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|If the copy is complete, contains the ETag of the destination blob. If the copy isn�t complete, contains the ETag of the empty blob created at the start of the copy.<br /><br /> The ETag value will be in quotes.|  
|`Last-Modified`|Returns the date/time that the copy operation to the destination blob completed.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-copy-id: <id>`|String identifier for this copy operation. Use with `Get Blob` or `Get Blob Properties` to check the status of this copy operation.|  
|`x-ms-copy-status: <success>`| State of the copy operation, with these values:<br /><br /> -   `success`: the copy completed successfully.
  
## Response Body  
 None.  
  
## Sample Response  
 The following is a sample response for a request to copy a blob:  
  
```  
Response Status:  
HTTP/1.1 202 Accepted  
  
Response Headers:   
Last-Modified: <date>   
ETag: "0x8CEB669D794AFE2"  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cc6b209a-b593-4be1-a38a-dde7c106f402  
x-ms-version: 2018-03-28  
x-ms-copy-id: 1f812371-a41d-49e6-b123-f4b542e851c5  
x-ms-copy-status: success  
Date: <date>  
  
``` 
  
## Authorization  
 This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.  

 Access to the source blob or file is authorized separately, as described in the details for the request header `x-ms-copy-source`. 
  
The source and destination blob for a copy from URL operation must be a block blob.  
  
 The `Copy Blob From URL` operation always copies the entire source blob; copying a range of bytes or set of blocks is not supported.  
  
 A `Copy Blob From URL` operation can take any of the following forms:  
  
-   You can copy a source blob to a destination blob with a different name. The destination blob can be an existing block blob, or can be a new blob created by the copy operation.     
  
When copying from a block blob, all committed blocks and their block IDs are copied. Uncommitted blocks are not copied. At the end of the copy operation, the destination blob will have the same committed block count as the source.   
  
The ETag for a block blob changes when the `Copy Blob From URL` operation is initiated and when the copy finishes.
  
**Copying Blob Properties and Metadata**  
  
When a block blob is copied, the following system properties are copied to the destination blob with the same values:  
  
-   `Content-Type`  
  
-   `Content-Encoding`  
  
-   `Content-Language`  
  
-   `Content-Length`  
  
-   `Cache-Control`  
  
-   `Content-MD5`  
  
-   `Content-Disposition`  
  
The source blob's committed block list is also copied to the destination blob. Any uncommitted blocks are not copied.  
  
The destination blob is always the same size as the source blob, so the value of the `Content-Length` header for the destination blob matches that for the source blob.  
  
**Copying a Leased Blob**  
  
The `Copy Blob From URL` operation only reads from the source blob so the lease state of the source blob does not matter.
  
 **Billing**  
  
 The destination account of a `Copy Blob From URL` operation is charged for one transaction to initiate the copy, and also incurs one transaction for each request to the source of the copy operation.  
  
 The source account also incurs transaction costs. In addition, if the source and destination accounts reside in different regions (e.g., US North and US South), bandwidth used to transfer the request is charged to the source storage account as egress. Egress between accounts within the same region is free.  
  
 When you copy a source blob to a destination blob with a different name within the same account, you use additional storage resources for the new blob, so the copy operation results in a charge against the storage account�s capacity usage for those additional resources. However, if the source and destination blob name are the same within the same account (for example, when you promote a snapshot to its base blob), no additional charge is incurred other than the extra copy metadata stored in version 2012-02-12 and newer.  
  
## See Also  
 [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Understanding How Snapshots Accrue Charges](Understanding-How-Snapshots-Accrue-Charges.md)   