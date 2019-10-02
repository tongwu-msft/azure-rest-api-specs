---
title: Append Block (REST API) - Azure Storage
description: The Append Block operation commits a new block of data to the end of an existing append blob.
author: pemari-msft

ms.date: 08/15/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Append Block

The `Append Block` operation commits a new block of data to the end of an existing append blob.  

The `Append Block` operation is permitted only if the blob was created with `x-ms-blob-type` set to `AppendBlob`. `Append Block` is supported only on version 2015-02-21 version or later.  
  
### Request  
 The `Append Block` request may be constructed as follows. HTTPS is recommended. Replace `myaccount` with the name of your storage account:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=appendblock`|HTTP/1.1|  
  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=appendblock`|HTTP/1.1|  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](https://docs.microsoft.com/azure/storage/common/storage-use-emulator).  
  
#### URI Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|timeout|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
#### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. See [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md) for more information.|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. The length of the block content in bytes. The block must be less than or equal to 4 MB in size.<br /><br /> When the length is not provided, the operation will fail with the status code 411 (Length Required).|  
|`Content-MD5`|Optional. An MD5 hash of the block content. This hash is used to verify the integrity of the block during transport. When this header is specified, the storage service compares the hash of the content that has arrived with this header value.<br /><br /> Note that this MD5 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-content-crc64`|Optional. A CRC64 hash of the append block content. This hash is used to verify the integrity of the append block during transport. When this header is specified, the storage service compares the hash of the content that has arrived with this header value.<br /><br /> Note that this CRC64 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).<br /><br /> If both `Content-MD5` and `x-ms-content-crc64` headers are present, the request will fail with a 400 (Bad Request).<br /><br />This header is supported in versions 2019-02-02 or later.|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](http://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
|`x-ms-blob-condition-maxsize`|Optional conditional header. The max length in bytes permitted for the append blob. If the `Append Block` operation would cause the blob to exceed that limit or if the blob size is already greater than the value specified in this header, the request will fail with MaxBlobSizeConditionNotMet error (HTTP status code 412 – Precondition Failed).|  
|`x-ms-blob-condition-appendpos`|Optional conditional header, used only for the `Append Block` operation. A number indicating the byte offset to compare. `Append Block` will succeed only if the append position is equal to this number. If it is not, the request will fail with the AppendPositionConditionNotMet error (HTTP status code 412 – Precondition Failed).|  
  
 This operation supports the use of additional conditional headers to ensure that the API succeeds only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request Headers (Customer-provided encryption keys)
  
Beginning with version 2019-02-02, the following headers may be specified on the request to encrypt a blob with a customer-provided key. Encryption with a customer-provided key (and the corresponding set of headers) is optional.
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-encryption-key`|Required. The Base64-encoded AES-256 encryption key.|  
|`x-ms-encryption-key-sha256`|Required. The Base64-encoded SHA256 hash of the encryption key.|  
|`x-ms-encryption-algorithm: AES256`|Required. Specifies the algorithm to use for encryption. The value of this header must be `AES256`.|  
  
#### Request Body  
 The request body contains the content of the block.  
  
#### Sample Request  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=appendblock  HTTP/1.1  
  
Request Headers:  
x-ms-version: 2015-02-21  
x-ms-date: <date>  
x-ms-blob-condition-appendpos: 2097152  
x-ms-blob-condition-maxsize: 4194304  
Authorization: SharedKey myaccount:J4ma1VuFnlJ7yfk/Gu1GxzbfdJloYmBPWlfhZ/xn7GI=  
Content-Length: 1048  
If-Match: "0x8CB172A360EC34B"  
  
```  
  
### Response  
 The response includes an HTTP status code and a set of response headers.  
  
#### Status Code  
 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
#### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value in quotes that the client can use to perform conditional PUT operations by using the If-Match request header.|  
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any write operation on the blob (including updates on the blob's metadata or properties) changes the last-modified time of the blob.|  
|`Content-MD5`|This header is returned so that the client can check for message content integrity. The value of this header is computed by the Blob service; it is not necessarily the same value specified in the request headers. For versions 2019-02-02 or later, This header is only returned when the request has this header.|  
|`x-ms-content-crc64`|For versions 2019-02-02 or later, This header is returned so that the client can check for message content integrity. The value of this header is computed by the Blob service; it is not necessarily the same value specified in the request headers. <br /><br />This header is returned when `Content-md5` header is not present in the request.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see Troubleshooting API Operations.|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-blob-append-offset`|This response header is returned only for append operations. It returns the offset at which the block was committed, in bytes.|  
|`x-ms-blob-committed-block-count`|The number of committed blocks present in the blob. This can be used to control how many more appends can be done.|  
|`x-ms-request-server-encrypted: true/false`|Version 2015-12-11 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
|`x-ms-encryption-key-sha256`|Version 2019-02-02 or newer. This header is returned if the request used a customer-provided key for encryption, so the client can ensure the contents of the request are successfully encrypted using the provided key.|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
#### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Transfer-Encoding: chunked  
x-ms-content-crc64: 77uWZTolTHU  
Date: <date>  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
x-ms-blob-append-offset: 2097152  
x-ms-blob-committed–block-count: 1000  
  
```  
  
### Authorization  
 This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.  
  
### Remarks  
 **Append Block** uploads a block to the end of an existing append blob. The block of data is immediately available once the call succeeds on the server. A block may be up to 4 MB in size.  
  
 `Append Block` succeeds only if the blob already exists.  
  
 Blobs uploaded using `Append Block` do not expose block ids, so you cannot call [Get Block List](Get-Block-List.md) against an append blob. Doing so results in a 409 error.  
  
 The following optional conditional headers can be specified on the request:  
  
1.  `x-ms-blob-condition-appendpos`: You can set this header to a byte offset at which the client expects to append the block. The request succeeds only if the current offset matches that specified by the client. Otherwise, the request fails with the AppendPositionConditionNotMet error (HTTP status code 412 – Precondition Failed).  
  
     Clients using a single writer may use this header to determine whether when an **Append Block** operation succeeded despite network failure.  
  
2.  `x-ms-blob-condition-maxsize`: Clients can use this header to ensure that append operations do not increase the blob size beyond an expected maximum size in bytes.  If the condition fails, the request will fail with MaxBlobSizeConditionNotMet error (HTTP status code 412 – Precondition Failed).  
  
 Each block can be a different size, up to a maximum of 4 MB. A maximum of 50,000 appends are permitted for each append blob. The maximum size of an append blob is therefore slightly more than 195 GB (4 MB X 50,000 blocks). If you attempt to upload a block that is larger than 4 MB, the service returns HTTP status code 413 (Request Entity Too Large). The service also returns additional information about the error in the response, including the maximum block size permitted in bytes. If you attempt to upload more than 50,000 blocks, the service returns the BlockCountExceedsLimit error (HTTP status code 409 – Conflict).  
  
 If the blob has an active lease, the client must specify a valid lease ID on the request in order to write a block to the blob. If the client does not specify a lease ID, or specifies an invalid lease ID, the Blob service returns status code 412 (Precondition Failed). If the client specifies a lease ID but the blob does not have an active lease, the Blob service also returns status code 412 (Precondition Failed).  
  
 Calling **Append Block** on an existing block blob or page blob will return an InvalidBlobType error (HTTP status code 409 - Conflict). Calling **Append Block** on a non-existent blob will return a BlobNotFound error (HTTP status code 404 – Not Found).  
  
#### Avoiding duplicate or delayed appends  
 In a single writer scenario, the client can avoid duplicate appends or delayed writes either by using the ***x-ms-blob-condition-appendpos*** conditional header to check the current offset, or by checking the ETag conditionally using `If-Match`.  
  
 In a multiple writer scenario, each client can use conditional headers, but this may not be an optimal approach in terms of performance. For the highest concurrent append throughput, applications should handle redundant appends and delayed appends in their application layer (*e.g.*, add epochs or sequence numbers in the data being appended).
