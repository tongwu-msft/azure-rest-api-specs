---
title: Append Block From URL (REST API) - Azure Storage
description: The Append Block From URL operation commits a new block of data to the end of an existing append blob.
author: pemari-msft
ms.date: 09/20/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Append Block From URL

The `Append Block From URL` operation commits a new block of data to the end of an existing append blob.  
  
The `Append Block From URL` operation is permitted only if the blob was created with `x-ms-blob-type` set to `AppendBlob`. `Append Block From URL` is supported only on version 2018-11-09 version or later.  

## Request

You can construct the `Append Block From URL` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.
  
|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=appendblock`|HTTP/1.1|  
  
When you're making a request against the emulated storage service, specify the emulator hostname and Azure Blob Storage port as `127.0.0.1:10000`, followed by the emulated storage account name.

|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=appendblock`|HTTP/1.1|  

For more information, see [Use the Azurite emulator for local Azure Storage development](/azure/storage/common/storage-use-azurite).  
  
### URI parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. See [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md) for more information.|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. Specifies the number of bytes being transmitted in the request body. The value of this header must be set to zero. When the length is not zero, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source blob. The value can be a URL of up to 2 KiB in length that specifies a blob. The value should be URL-encoded, as it would appear in a request URI. The source blob must either be public or must be authorized via a shared access signature. If the source blob is public, no authorization is required to perform the operation. Here are some examples of source object URLs:<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob`<br />`https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`<br />`https://myaccount.blob.core.windows.net/mycontainer/myblob?versionid=<DateTime>`|  
|`x-ms-copy-source-authorization: <scheme> <signature>`|Optional. Specifies the authorization scheme and signature for copy source. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).<br /> Only scheme bearer is supported for Azure Active Directory.<br />This header is supported in version 2020-10-02 and later.|
|`x-ms-source-range`|Optional. Uploads only the bytes of the blob in the source URL in the specified range. If this isn't specified, the entire source blob contents are uploaded as a single append block. See [Specifying the range header for Blob Storage operations](Specifying-the-Range-Header-for-Blob-Service-Operations.md) for more information.|  
|`x-ms-source-content-md5`|Optional. An MD5 hash of the append block content from the URI. This hash is used to verify the integrity of the append block during transport of the data from the URI. When you specify this header, the storage service compares the hash of the content that has arrived from the copy-source with this header value.<br /><br /> Note that this MD5 hash isn't stored with the blob.<br /><br /> If the two hashes don't match, the operation fails with error code 400 (Bad Request).|  
|`x-ms-source-content-crc64`|Optional. A CRC64 hash of the append block content from the URI. This hash is used to verify the integrity of the append block during transport of the data from the URI. When you specify this header, the storage service compares the hash of the content that has arrived from the copy-source with this header value.<br /><br /> Note that this CRC64 hash isn't stored with the blob.<br /><br /> If the two hashes don't match, the operation fails with error code 400 (Bad Request).<br /><br /> If both `x-ms-source-content-md5` and `x-ms-source-content-crc64` headers are present, the request fails with a 400 (Bad Request).<br /><br />This header is supported in version 2019-02-02 or later.|  
|`x-ms-encryption-scope`|Optional. Indicates the encryption scope to use to encrypt the source contents. This header is supported in version 2019-02-02 or later.|  
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  
|`x-ms-blob-condition-maxsize`|Optional conditional header. The maximum length in bytes permitted for the append blob. If the `Append Block From URL` operation causes the blob to exceed that limit, or if the blob size is already greater than the value specified in this header, the request fails with a 412 (Precondition Failed).|  
|`x-ms-blob-condition-appendpos`|Optional conditional header, used only for the `Append Block from URL` operation. A number indicating the byte offset to compare. `Append Block from URL` succeeds only if the append position is equal to this number. If it isn't, the request fails with a 412 (Precondition Failed).|  
  
This operation supports the use of additional, conditional headers, to ensure that the API succeeds only if a specified condition is met. For more information, see [Specifying conditional headers for Blob Storage operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request headers (customer-provided encryption keys)
  
Beginning with version 2019-02-02, you can specify the following headers on the request to encrypt a blob with a customer-provided key. Encryption with a customer-provided key (and the corresponding set of headers) is optional.
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-encryption-key`|Required. The Base64-encoded AES-256 encryption key.|  
|`x-ms-encryption-key-sha256`|Required. The Base64-encoded SHA256 hash of the encryption key.|  
|`x-ms-encryption-algorithm: AES256`|Required. Specifies the algorithm to use for encryption. The value of this header must be `AES256`.|  
  
### Request body  

The request body contains the content of the block.  

### Sample request  

```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=appendblock  HTTP/1.1  

Request Headers:  
x-ms-version: 2018-11-09  
x-ms-date: <date>  
x-ms-copy-source: https://myaccount.blob.core.windows.net/mycontainer/myblob
x-ms-source-range: bytes=0-65535
x-ms-blob-condition-appendpos: 2097152  
x-ms-blob-condition-maxsize: 4194304  
Authorization: SharedKey myaccount:J4ma1VuFnlJ7yfk/Gu1GxzbfdJloYmBPWlfhZ/xn7GI=  
Content-Length: 0 
If-Match: "0x8CB172A360EC34B"  

```  

## Response  

The response includes an HTTP status code and a set of response headers.  

### Status code  

A successful operation returns status code 201 (Created). For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  

### Response headers  

The response for this operation includes the following headers. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  

|Response header|Description|  
|---------------------|-----------------|  
|`Etag`|The `ETag` contains a value in quotes. The client uses the value to perform conditional `PUT` operations by using the `If-Match` request header.|  
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of date-time values in headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any write operation on the blob (including updates on the blob's metadata or properties) changes the last-modified time of the blob.|  
|`Content-MD5`|This header is returned so that the client can check for message content integrity. Blob Storage computes the value of this header. It isn't necessarily the same value specified in the request headers. For version 2019-02-02 or later, this header is only returned when the request has this header.|
|`x-ms-content-crc64`|For version 2019-02-02 or later. This header is returned so that the client can check for message content integrity. Blob Storage computes the value of this header. It isn't necessarily the same value specified in the request headers. <br /><br />This header is returned when the `x-ms-source-content-md5` header isn't present in the request.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made, and can be used for troubleshooting the request.|  
|`x-ms-version`|Indicates the version of Blob Storage used to run the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-blob-append-offset`|This response header is returned only for append operations. It returns the offset at which the block was committed, in bytes.|  
|`x-ms-blob-committed-block-count`|The number of committed blocks present in the blob. You can use this to control how many more appends can be done.|  
|`x-ms-request-server-encrypted: true/false`|Version 2015-12-11 or later. The value of this header is set to `true` if the contents of the request are successfully encrypted by using the specified algorithm. Otherwise, the value is set to `false`.|  
|`x-ms-encryption-key-sha256`|Version 2019-02-02 or later. This header is returned if the request used a customer-provided key for encryption. The client can then ensure that the contents of the request are successfully encrypted by using the provided key.|  
|`x-ms-encryption-scope`|Version 2019-02-02 or later. This header is returned if the request used an encryption scope. The client can then ensure that the contents of the request are successfully encrypted by using the encryption scope.|  

### Sample response  

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

## Authorization  

The account owner can call this operation. Additionally, anyone with a shared access signature that has permission to write to this blob or its container can call this operation.  

## Remarks  

`Append Block From URL` uploads a block to the end of an existing append blob. The block of data is immediately available after the call succeeds on the server. A block can be up to 4 MiB in size.  

 In version 2020-10-02 and later, Azure Active Directory authorization is supported for the source of the copy operation.
 
`Append Block From URL` succeeds only if the blob already exists.  

Blobs uploaded by using `Append Block From URL` don't expose block IDs, so you can't call [Get Block List](Get-Block-List.md) against an append blob. Doing so results in an error.  

You can specify the following optional, conditional headers on the request:  

- `x-ms-blob-condition-appendpos`: You can set this header to a byte offset at which the client expects to append the block. The request succeeds only if the current offset matches that specified by the client. Otherwise, the request fails with error code 412 (Precondition Failed).

    Clients that use a single writer can use this header to determine whether when an `Append Block From URL` operation succeeded, despite network failure.  

- `x-ms-blob-condition-maxsize`: Clients can use this header to ensure that append operations don't increase the blob size beyond an expected maximum size in bytes. If the condition fails, the request fails with error code 412 (Precondition Failed).  

Each block can be a different size, up to a maximum of 4 MiB. A maximum of 50,000 appends are permitted for each append blob. The maximum size of an append blob is therefore slightly more than 195 GiB (4 MiB X 50,000 blocks).

If you attempt to upload a block that is larger than 4 MiB, the service returns HTTP error code 413 (Request Entity Too Large). The service also returns additional information about the error in the response, including the maximum block size permitted in bytes. If you attempt to upload more than 50,000 blocks, the service returns error code 409 (Conflict).  

If the blob has an active lease, the client must specify a valid lease ID on the request in order to write a block to the blob. If the client doesn't specify a lease ID, or specifies an invalid lease ID, Blob Storage returns error code 412 (Precondition Failed). If the client specifies a lease ID but the blob doesn't have an active lease, the service returns error code 412.  

If you call `Append Block From URL` on an existing block blob or page blob, the service returns error code 409 (Conflict). If you call `Append Block From URL` on a non-existent blob, the service returns error code 404 (Not Found).  

### Avoid duplicate or delayed appends  

In a single writer scenario, the client can avoid duplicate appends or delayed writes by using the `x-ms-blob-condition-appendpos` conditional header to check the current offset. The client can also avoid duplicates or delays by checking the `ETag` conditionally, by using `If-Match`.  

In a multiple writer scenario, each client can use conditional headers. This might not be optimal for performance. For the highest concurrent append throughput, applications should handle redundant appends and delayed appends in their application layer. For example, applications can add epochs or sequence numbers in the data being appended.
