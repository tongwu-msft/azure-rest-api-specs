---
title: Put Page From URL (REST API) - Azure Storage
description: The Put Page From URL operation writes a range of pages to a page blob where the contents are read from a URL.
author: pemari-msft

ms.date: 08/15/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Put Page From URL
The `Put Page From URL` operation writes a range of pages to a page blob where the contents are read from a URL. This API is available starting in version 2018-11-09.  
  
## Request  
 The `Put Page From URL` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=page`|HTTP/1.1|  
  
### Emulated Storage Service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
||PUT Method Request URI|HTTP Version|  
|-|----------------------------|------------------|  
||`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob?comp=page`|HTTP/1.1|  
  
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
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Range`|Either `Range` or `x-ms-range` is required.<br /><br /> Specifies the range of bytes to be written as a page. Both the start and end of the range must be specified. This header is defined by the [HTTP/1.1 protocol specification](https://www.w3.org/Protocols/rfc2616/rfc2616.html).<br /><br /> For a page update operation, the page range can be up to 4 MB in size. <br /><br /> Given that pages must be aligned with 512-byte boundaries, the start offset must be a modulus of 512 and the end offset must be a modulus of 512 – 1. Examples of valid byte ranges are 0-511, 512-1023, etc.<br /><br /> The Blob service accepts only a single byte range for the `Range` header, and the byte range must be specified in the following format: `bytes=startByte-endByte`.<br /><br /> If both `Range` and `x-ms-range` are specified, the service uses the value of `x-ms-range`. See [Specifying the Range Header for Blob Service Operations](Specifying-the-Range-Header-for-Blob-Service-Operations.md) for more information.|  
|`x-ms-range`|Either `Range` or `x-ms-range` is required.<br /><br /> Specifies the range of bytes to be written as a page. Both the start and end of the range must be specified. This header is defined by the [HTTP/1.1 protocol specification](https://www.w3.org/Protocols/rfc2616/rfc2616.html).<br /><br /> The page range can be up to 4 MB in size. <br /><br /> Given that pages must be aligned with 512-byte boundaries, the start offset must be a modulus of 512 and the end offset must be a modulus of 512 – 1. Examples of valid byte ranges are 0-511, 512-1023, etc.<br /><br /> The Blob service accepts only a single byte range for the `x-ms-range` header, and the byte range must be specified in the following format: `bytes=startByte-endByte`.<br /><br /> If both `Range` and `x-ms-range` are specified, the service uses the value of `x-ms-range`. See [Specifying the Range Header for Blob Service Operations](Specifying-the-Range-Header-for-Blob-Service-Operations.md) for more information.|  
|`Content-Length`|Required. Specifies the number of bytes being transmitted in the request body. The value of this header must be set to zero. When the length is not zero, the operation will fail with the status code 400 (Bad Request).|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source blob. The value may be a URL of up to 2 KB in length that specifies a blob. The value should be URL-encoded as it would appear in a request URI. The source blob must either be public or must be authorized via a shared access signature. If the source blob is public, no authorization is required to perform the operation. Here are some examples of source object URLs:<br /><br /> -   `https://myaccount.blob.core.windows.net/mycontainer/myblob`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`|  
|`x-ms-source-range`|Uploads the bytes of the blob in the source URL in the specified range. Both the start and end of the range must be specified. This header is defined by the [HTTP/1.1 protocol specification](https://www.w3.org/Protocols/rfc2616/rfc2616.html).<br /><br /> The page range can be up to 4 MB in size. <br /><br /> The Blob service accepts only a single byte range for the `x-ms-source-range` header, and the byte range must be specified in the following format: `bytes=startByte-endByte`.<br /><br /> See [Specifying the Range Header for Blob Service Operations](Specifying-the-Range-Header-for-Blob-Service-Operations.md) for more information.|   
|`x-ms-source-content-md5`|Optional. An MD5 hash of the page content from the URI. This hash is used to verify the integrity of the page during transport of the data from the URI. When this header is specified, the storage service compares the hash of the content that has arrived from the copy-source with this header value.<br /><br /> Note that this md5 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-source-content-crc64`|Optional. A CRC64 hash of the page content from the URI. This hash is used to verify the integrity of the page during transport of the data from the URI. When this header is specified, the storage service compares the hash of the content that has arrived from the copy-source with this header value.<br /><br /> Note that this CRC64 hash is not stored with the blob.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).<br /><br /> If both `x-ms-source-content-md5` and `x-ms-source-content-crc64` headers are present, the request will fail with a 400 (Bad Request).<br /><br />This header is supported in versions 2019-02-02 or later.|  

|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-if-sequence-number-le: <num>`|Optional. If the blob’s sequence number is less than or equal to the specified value, the request proceeds; otherwise it fails with the SequenceNumberConditionNotMet error (HTTP status code 412 – Precondition Failed).|  
|`x-ms-if-sequence-number-lt: <num>`|Optional. If the blob’s sequence number is less than the specified value, the request proceeds; otherwise it fails with SequenceNumberConditionNotMet error (HTTP status code 412 – Precondition Failed).|  
|`x-ms-if-sequence-number-eq: <num>`|Optional. If the blob’s sequence number is equal to the specified value, the request proceeds; otherwise it fails with SequenceNumberConditionNotMet error (HTTP status code 412 – Precondition Failed).|  
|`If-Modified-Since`|Optional. A `DateTime` value. Specify this conditional header to write the page only if the blob has been modified since the specified date/time. If the blob has not been modified, the Blob service returns status code 412 (Precondition Failed).|  
|`If-Unmodified-Since`|Optional. A `DateTime` value. Specify this conditional header to write the page only if the blob has not been modified since the specified date/time. If the blob has been modified, the Blob service returns status code 412 (Precondition Failed).|  
|`If-Match`|Optional. An ETag value. Specify an ETag value for this conditional header to write the page only if the blob's ETag value matches the value specified. If the values do not match, the Blob service returns status code 412 (Precondition Failed).|  
|`If-None-Match`|Optional. An ETag value.<br /><br /> Specify an ETag value for this conditional header to write the page only if the blob's ETag value does not match the value specified. If the values are identical, the Blob service returns status code 412 (Precondition Failed).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
 This operation also supports the use of conditional headers to execute the operation only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request Headers (Customer-provided encryption keys)
  
Beginning with version 2019-02-02, the following headers may be specified on the request to encrypt a blob encrypted with a customer-provided key. Encryption with a customer-provided key (and the corresponding set of headers) is optional.
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-encryption-key`|Required. The Base64-encoded AES-256 encryption key.|  
|`x-ms-encryption-key-sha256`|Required. The Base64-encoded SHA256 hash of the encryption key.|  
|`x-ms-encryption-algorithm: AES256`|Required. Specifies the algorithm to use for encryption. The value of this header must be `AES256`.|  
  
### Request Body  
 The request body contains the content of the page.  
  
### Sample Request
  
```  
  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=page HTTP/1.1  
  
Request Headers:   
x-ms-date: Fri, 16 Sep 2011 22:15:50 GMT  
x-ms-version: 2018-11-09  
x-ms-range: bytes=0-65535  
x-ms-copy-source: https://myaccount.blob.core.windows.net/mycontainer/myblob
x-ms-source-range: bytes=0-65535
Authorization: SharedKey myaccount:4KdWDiTdA9HmIF9+WF/8WfYOpUrFhieGIT7f0av+GEI=  
Content-Length: 0  
  
```  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Syntax|Description|  
|------------|-----------------|  
|`ETag`|The ETag for the blob. If the request version is 2011-08-18 or newer, the ETag value will be in quotes. The ETag can be used to perform a conditional `Put Page From URL` operation by specifying its value for the `If-Match` or `If-None-Match` request header.|  
|`Last-Modified`|The date and time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any write operation on the blob, including updates to the blob’s metadata or properties, changes the last modified time of the blob.|  
|`Content-MD5`|This header is returned so that the client can check for message content integrity. The value of this header is computed by the Blob service; it is not necessarily the same value specified in the request headers. For versions 2019-02-02 or later, This header is only returned when the request has this header.|
|`x-ms-content-crc64`|For versions 2019-02-02 or later, This header is returned so that the client can check for message content integrity. The value of this header is computed by the Blob service; it is not necessarily the same value specified in the request headers. <br /><br />This header is returned when `x-ms-source-content-md5` header is not present in the request.|  
|`x-ms-blob-sequence-number`|The current sequence number for the page blob.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. This header is returned for requests made against version 2009-09-19 and later.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-request-server-encrypted: true/false`|Version 2015-12-11 or newer. The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
|`x-ms-encryption-key-sha256`|Version 2019-02-02 or newer. This header is returned if the request used a customer-provided key for encryption, so the client can ensure the contents of the request are successfully encrypted using the provided key.|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Transfer-Encoding: chunked  
x-ms-content-crc64: 77uWZTolTHU  
Date: Sun, 25 Sep 2011 22:33:35 GMT  
ETag: "0x8CB171BA9E94B0B"  
Last-Modified: Sun, 25 Sep 2011 12:13:31 GMT  
x-ms-version: 2011-08-18  
x-ms-blob-sequence-number: 0  
Content-Length: 0  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
  
```  
  
## Authorization  
 This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this blob or its container.  
  
## Remarks  
 The `Put Page From URL` operation writes a range of pages to a page blob. This operation can only be called on an existing page blob. It cannot be called to create a new page blob, nor can it be called on a block blob. Calling `Put Page From URL` with a blob name that does not currently exist returns the BlobNotFound error (HTTP status code 404 – Not Found).  
  
 To create a new page blob, call [Put Blob](Put-Blob.md) and specify the type of blob to create as a page blob. A page blob may be up to 8 TB in size.  
  
 If the blob has an active lease, the client must specify a valid lease ID on the request in order to write a page.  
  
 **Page Update Operations**  
  
 Calling `Put Page From URL` performs an in-place write on the specified page blob. Any content in the specified page is overwritten with the update.  
  
> [!IMPORTANT]
>  If the server times out or your connection is closed during a `Put Page From URL`, the page may or may not have been updated. Therefore, you should continue to retry the update until you receive a response indicating success.  
  
 Each range of pages submitted with `Put Page From URL` for an update operation may be up to 4 MB in size. The start and end range of the page must be aligned with 512-byte boundaries. If you attempt to upload a range of pages that is larger than 4MB, the service returns status code 413 (Request Entity Too Large).  
  
 **Managing Concurrency Issues**  
  
 The Blob service handles concurrent writes to overlapping pages sequentially: the last page processed by the service determines the blob's content. Therefore, to ensure the integrity of the blob's content, the client should handle writes to overlapping pages using one or more of the following approaches:  
  
-   You can check the value of the `Last-Modified` response header for each successful call to `Put Page From URL`. The order of responses returned from the Blob service does not necessarily correspond to the order in which they were executed by the service. But the value of `Last-Modified` always indicates the order in which the service processed the requests.  
  
-   You can perform updates conditionally based on the blob's ETag or last modified time using optimistic concurrency. This approach works well if the number of concurrent writes is relatively low. Use the conditional request headers `If-Match`, `If-None-Match`, `If-Modified-Since`, and `If-Unmodified-Since` for this purpose.  
  
-   You can call [Lease Blob](Lease-Blob.md) to lock the blob against other writes for a one-minute period, or longer if the lease is renewed.  
  
-   You can use the blob's sequence number to ensure that retrying a request for which there was no response does not result in concurrent updates. This approach may be best for clients requiring high throughput for page writes. It is described in detail in the following section.  
  
 **Using the Page Blob Sequence Number to Retry Requests**  
  
 When a call to `Put Page From URL` times out or does not return a response, there is no way to know for certain whether the request succeeded. You therefore need to retry the request, but due to the distributed nature of the Azure storage services, it is possible that the original request may be processed after the retried request has succeeded. The delayed original request can overwrite other updates and yield an unexpected result. The following sequence illustrates how this may happen:  
  
1.  A `Put Page From URL` request to write value "X" to page 0 times out or does not return a response.  
  
2.  A retried request to write value "X" to page 0 succeeds.  
  
3.  A request to write value "Y" to page 0 succeeds.  
  
4.  The original request succeeds, writing value "X" to page 0.  
  
5.  Reading page 0 returns value "X", when the client was at this point expecting value "Y".  
  
 This kind of conflict can occur when the original request does not return a status code between 100-499, or 503 (Server Busy). If one of these status codes is returned, you can be certain as to whether the request has succeeded or failed. But if the service returns a status code outside this range, there's no way to know the status of the original request.  
  
 To prevent this sort of conflict, you can use the page blob's sequence number to ensure that when you retry a request, the original request will not subsequently succeed. To do so, you should increment the sequence number before retrying the original request. You can then use the conditional sequence number headers to ensure that the request fails if its sequence number does not match the expected sequence number. The following sequence illustrates this approach:  
  
1.  The client creates a page blob with [Put Blob](Put-Blob.md) and sets its sequence number to 0.  
  
2.  A `Put Page From URL` request to write value "X" to page 0 with the `if-sequence-number-lt` header set to `1` times out or does not return a response.  
  
3.  The client calls Set Blob Properties to update the sequence number to 1.  
  
4.  A retried request to write value "X" to page 0 with `if-sequence-number-lt` set to `2` succeeds.  
  
5.  A request to write value "Y" to page 0 with `if-sequence-number-lt` set to `2` succeeds.  
  
6.  The original request is finally processed, but it fails because it specifies the condition that the sequence number must be less than 1 (that is, the `if-sequence-num-lt` header is set to `1`). The error is SequenceNumberConditionNotMet (HTTP status code 412 – Precondition Failed).  
  
7.  Reading page 0 returns the expected value of "Y".  
  
## See Also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
