---
title: Put Block (REST API) - Azure Storage
description: The Put Block operation creates a new block to be committed as part of a blob. 
author: pemari-msft

ms.date: 03/27/2021
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Put Block
The `Put Block` operation creates a new block to be committed as part of a blob.  
  
## Request  
 The `Put Block` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=block&blockid=id`|HTTP/1.1|  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=block&blockid=id`|HTTP/1.1|  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|`blockid`|Required. A valid Base64 string value that identifies the block. Prior to encoding, the string must be less than or equal to 64 bytes in size.<br /><br /> For a given blob, the length of the value specified for the `blockid` parameter must be the same size for each block.<br /><br /> Note that the Base64 string must be URL-encoded.|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. See [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md) for more information.|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. The length of the block content in bytes. The block must be less than or equal to 4000 MiB in size for version 2019-12-12 and later. See the Remarks for limits in older versions.<br /><br />When the length is not provided, the operation will fail with the status code 411 (Length Required).|  
|`Content-MD5`|Optional. An MD5 hash of the block content. This hash is used to verify the integrity of the block during transport. When this header is specified, the storage service compares the hash of the content that has arrived with this header value.<br /><br /> Note that this MD5 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-content-crc64`|Optional. A CRC64 hash of the block content. This hash is used to verify the integrity of the block during transport. When this header is specified, the storage service compares the hash of the content that has arrived with this header value.<br /><br /> Note that this CRC64 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).<br /><br /> If both Content-MD5 and x-ms-content-crc64 headers are present, the request will fail with a 400 (Bad Request).<br /><br />This header is supported in versions 2019-02-02 or later.|  
|`x-ms-encryption-scope`|Optional. Indicates the encryption scope to use to encrypt the request contents. This header is supported in versions 2019-02-02 or later.|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### Request Headers (Customer-provided encryption keys)
  
Beginning with version 2019-02-02, the following headers may be specified on the request to encrypt a blob with a customer-provided key. Encryption with a customer-provided key (and the corresponding set of headers) is optional.
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-encryption-key`|Required. The Base64-encoded AES-256 encryption key.|  
|`x-ms-encryption-key-sha256`|Required. The Base64-encoded SHA256 hash of the encryption key.|  
|`x-ms-encryption-algorithm: AES256`|Required. Specifies the algorithm to use for encryption. The value of this header must be `AES256`.|  
  
### Request Body  
 The request body contains the content of the block.  
  
### Sample Request  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=block&blockid=AAAAAA%3D%3D HTTP/1.1  
  
Request Headers:  
x-ms-version: 2011-08-18  
x-ms-date: Sun, 25 Sep 2011 14:37:35 GMT  
Authorization: SharedKey myaccount:J4ma1VuFnlJ7yfk/Gu1GxzbfdJloYmBPWlfhZ/xn7GI=  
Content-Length: 1048576  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-MD5`|This header is returned so that the client can check for message content integrity. The value of this header is computed by the Blob service; it is not necessarily the same value specified in the request headers. For versions 2019-02-02 or later, this header is only returned when the request has this header.|  
|`x-ms-content-crc64`|For versions 2019-02-02 or later, this header is returned so that the client can check for message content integrity. The value of this header is computed by the Blob service; it is not necessarily the same value specified in the request headers. <br /><br />This header is returned when `Content-md5` header is not present in the request.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2015-12-11 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
|`x-ms-encryption-key-sha256`|Version 2019-02-02 or newer. This header is returned if the request used a customer-provided key for encryption, so the client can ensure the contents of the request are successfully encrypted using the provided key.|  
|`x-ms-encryption-scope`|Version 2019-02-02 or newer. This header is returned if the request used an encryption scope, so the client can ensure the contents of the request are successfully encrypted using the encryption scope.|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Transfer-Encoding: chunked  
x-ms-content-crc64: 77uWZTolTHU  
Date: Sun, 25 Sep 2011 23:47:09 GMT  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization  
 This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.  
  
## Remarks  
 `Put Block` uploads a block for future inclusion in a block blob. A block blob can include a maximum of 50,000 blocks. Each block can be a different size, up to a maximum of 4000 MiB for version 2019-12-12 and later, 100 MiB for version 2016-05-31 and later, and 4 MiB for older versions. The maximum size of a block blob is therefore 190.7 TiB (4000 MiB X 50,000 blocks) for version 2019-12-12 and later, 4.75 TiB (100 MiB X 50,000 blocks) for version 2016-05-31 and later, and 195 GiB (4 MiB X 50,000 blocks) for all older versions. 

 A blob can have a maximum of 100,000 uncommitted blocks at any given time. If this maximum is exceeded, the service returns status code 409 (RequestEntityTooLargeBlockCountExceedsLimit).
  
 After you have uploaded a set of blocks, you can create or update the blob on the server from this set by calling the [Put Block List](Put-Block-List.md) operation. Each block in the set is identified by a block ID that is unique within that blob. Block IDs are scoped to a particular blob, so different blobs can have blocks with same IDs.  
  
 If you call `Put Block` on a blob that does not yet exist, a new block blob is created with a content length of 0. This blob is enumerated by the `List Blobs` operation if the `include=uncommittedblobs` option is specified. The block or blocks that you uploaded are not committed until you call `Put Block List` on the new blob. A blob created this way is maintained on the server for a week; if you have not added more blocks or committed blocks to the blob within that time period, then the blob is garbage collected.  
  
 A block that has been successfully uploaded with the `Put Block` operation does not become part of a blob until it is committed with `Put Block List`. Before `Put Block List` is called to commit the new or updated blob, any calls to [Get Blob](Get-Blob.md) return the blob contents without the inclusion of the uncommitted block.  
  
 If you upload a block that has the same block ID as another block that has not yet been committed, the last uploaded block with that ID will be committed on the next successful `Put Block List` operation.  
  
 After `Put Block List` is called, all uncommitted blocks specified in the block list are committed as part of the new blob. Any uncommitted blocks that were not specified in the block list for the blob will be garbage collected and removed from the Blob service. Any uncommitted blocks will also be garbage collected if there are no successful calls to `Put Block` or `Put Block List` on the same blob within a week following the last successful `Put Block` operation. If [Put Blob](Put-Blob.md) is called on the blob, any uncommitted blocks will be garbage collected.  
  
 If the blob has an active lease, the client must specify a valid lease ID on the request in order to write a block to the blob. If the client does not specify a lease ID, or specifies an invalid lease ID, the Blob service returns status code 412 (Precondition Failed). If the client specifies a lease ID but the blob does not have an active lease, the Blob service also returns status code 412 (Precondition Failed).  
  
 For a given blob, all block IDs must be the same length. If a block is uploaded with a block ID of a different length than the block IDs for any existing uncommitted blocks, the service returns error response code 400 (Bad Request).  
  
 If you attempt to upload a block that is larger than 4000 MiB for version 2019-12-12 and later, larger than 100 MiB for version 2016-05-31 and later, and larger than 4 MiB for older versions, the service returns status code 413 (Request Entity Too Large). The service also returns additional information about the error in the response, including the maximum block size permitted in bytes.  
  
 Calling `Put Block` does not update the last modified time of an existing blob.  
  
 Calling `Put Block` on a page blob returns an error.  
 
 Calling `Put Block` on an archived blob will return an error and on `Hot`/`Cool` blob does not change the blob tier.
  
## See Also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
