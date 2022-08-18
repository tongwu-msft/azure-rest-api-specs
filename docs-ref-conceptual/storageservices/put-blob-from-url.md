---
title: Put Blob From URL (REST API) - Azure Storage
description: The Put Blob from URL operation creates a new Block Blob where the contents of the blob are read from a given URL. 
author: seanmcc-msft

ms.date: 04/06/2021
ms.service: storage
ms.topic: reference
ms.author: seanmcc
---

# Put Blob From URL
The `Put Blob from URL` operation creates a new Block Blob where the contents of the blob are read from a given URL. This API is available starting in version `2020-04-08`.
  
Partial updates are not supported with Put Blob from URL; the content of an existing blob is overwritten with the content of the new blob.  To perform partial updates to a block blob’s contents using a source URL, use the Put Block from URL API in conjunction with Put Block List. 

The size of the source blob can be up to a maximum length of 256 Mib.
 
## Request  
 The `Put Blob from URL` request may be constructed as follows.  HTTPS is recommended.  Replace *myaccount* with the name of your storage account:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob`|HTTP/1.1|  
  
### Emulated storage service URI  
 When making a request against the emulated storage service, specify the emulator hostname and Blob service port as `127.0.0.1:10000`, followed by the emulated storage account name:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`http://127.0.0.1:10000/devstoreaccount1/mycontainer/myblob`|HTTP/1.1|  
  
 Note that the storage emulator only supports blob sizes up to 2 GiB.  
  
 For more information, see [Using the Azure Storage Emulator for Development and Testing](/azure/storage/storage-use-emulator).  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The timeout parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers 
 The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. Specifies the number of bytes being transmitted in the request body. The value of this header must be set to zero. When the length is not zero, the operation will fail with the status code 400 (Bad Request).|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source blob. The value may be a URL of up to 2 KiB in length that specifies a blob. The value should be URL-encoded as it would appear in a request URI. The source blob must either be public or must be authorized via a shared access signature. If the source blob is public, no authorization is required to perform the operation. If the size of the source blob is greater than 256 MiB, the request will fail with 409 (Conflict). Here are some examples of source object URLs:<br /><br /> -   `https://myaccount.blob.core.windows.net/mycontainer/myblob`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?snapshot=<DateTime>`<br />-   `https://myaccount.blob.core.windows.net/mycontainer/myblob?versionid=<DateTime>`|
|`x-ms-copy-source-authorization: <scheme> <signature>`|Optional. Specifies the authorization scheme and signature for copy source. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).<br /> Only scheme bearer is supported for Azure Active Directory.<br />This header is supported in versions 2020-10-02 and later|
|`x-ms-blob-type: BlockBlob`|Required. Specifies the type of blob to create. Must be `BlockBlob`. When the blob type is not `BlockBlob`, the operation will fail with status code 400 (Bad Request).|
|`Content-Type`|Optional. The MIME content type of the blob. The default type is `application/octet-stream`.|
|`Content-Encoding`|Optional. Specifies which content encodings have been applied to the blob. This value is returned to the client when the [Get Blob](Get-Blob.md) operation is performed on the blob resource. The client can use this value when returned to decode the blob content.|  
|`Content-Language`|Optional. Specifies the natural languages used by this resource.|
|`Cache-Control`|Optional. The Blob service stores this value but does not use or modify it.|
|`x-ms-source-content-md5`|Optional. A MD5 hash of the blob content from the URI. This hash is used to verify the integrity of the blob during transport of the data from the URI. When this header is specified, the storage service compares the hash of the content that has arrived from the copy source with this header value. When omitted, the Blob service generates an MD5 hash.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-content-crc64`|Optional. A CRC64 hash of the blob content. This hash is used to verify the integrity of the blob during transport. When this header is specified, the storage service checks the hash that has arrived with the one that was sent. If the two hashes do not match, the operation will fail with error code 400 (Bad Request). This header is supported in versions 02-02-2019 or later. <br /><br /> If both Content-MD5 and x-ms-content-crc64 headers are present, the request will fail with a 400 (Bad Request).|  
|`x-ms-blob-content-type`|Optional. Set the blob’s content type.|  
|`x-ms-blob-content-encoding`|Optional. Set the blob’s content encoding.|  
|`x-ms-blob-content-language`|Optional. Set the blob's content language.|  
|`x-ms-blob-content-md5`|Optional. Set the blob’s MD5 hash.|  
|`x-ms-blob-cache-control`|Optional. Sets the blob's cache control.|  
|`x-ms-meta-name:value`|Optional. Name-value pairs associated with the blob as metadata.<br /><br /> Note that beginning with version 2009-09-19, metadata names must adhere to the naming rules for [C# identifiers](/dotnet/csharp/language-reference).|  
|`x-ms-encryption-scope`|Optional. Indicates the encryption scope to use to encrypt the request contents. This header is supported in versions 2019-02-02 or later.|  
|`x-ms-tags`|Optional. Sets the given query-string encoded tags on the blob. See the Remarks for additional information. Supported in version 2019-12-12 and newer.|
|`x-ms-copy-source-tag-option`|Optional. Possible values are REPLACE or COPY (case-sensitive). Default value is REPLACE.<br/><br/>If COPY is specified, the tags from source blob will be copied to the destination blob. Source blob must be private, and request must have permission to [Get Blob Tags](get-blob-tags.md) on the source blob and [Set Blob Tags](set-blob-tags.md) on the destination blob. This incurs an extra call to the [Get Blob Tags](get-blob-tags.md) operation on the source account.<br/><br/>REPLACE will set tags specified by the `x-ms-tags` header on the destination blob. If REPLACE and no tags are specified by `x-ms-tags`, no tags will be set on the destination blob. Specifying COPY and `x-ms-tags` will result in a `409 conflict`.<br/><br/>Supported in version 2021-04-10 and newer. |
|`x-ms-source-if-modified-since`|Optional. A `DateTime` value. Specify this conditional header to put the blob only if the source blob has been modified since the specified date/time. If the source blob has not been modified, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`x-ms-source-if-unmodified-since`|Optional. A `DateTime` value. Specify this conditional header to put the blob only if the source blob has not been modified since the specified date/time. If the source blob has been modified, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`x-ms-source-if-match`|Optional. An ETag value. Specify this conditional header to put the source blob only if its ETag matches the value specified. If the ETag values do not match, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`x-ms-source-if-none-match`|Optional. An ETag value. Specify this conditional header to put the blob only if its ETag does not match the value specified. If the values are identical, the Blob service returns status code 412 (Precondition Failed). This header cannot be specified if the source is an Azure File.|  
|`If-Modified-Since`|Optional. A `DateTime` value. Specify this conditional header to put the blob only if the destination blob has been modified since the specified date/time. If the destination blob has not been modified, the Blob service returns status code 412 (Precondition Failed).|  
|`If-Unmodified-Since`|Optional. A `DateTime` value. Specify this conditional header to put the blob only if the destination blob has not been modified since the specified date/time. If the destination blob has been modified, the Blob service returns status code 412 (Precondition Failed).|  
|`If-Match`|Optional. An ETag value. Specify an ETag value for this conditional header to put the blob only if the specified ETag value matches the `ETag` value for an existing destination blob. If the ETag for the destination blob does not match the ETag specified for `If-Match`, the Blob service returns status code 412 (Precondition Failed).|  
|`If-None-Match`|Optional. An ETag value, or the wildcard character (*).<br /><br /> Specify an ETag value for this conditional header to put the blob only if the specified ETag value does not match the ETag value for the destination blob.<br /><br /> Specify the wildcard character (\*) to perform the operation only if the destination blob does not exist.<br /><br /> If the specified condition isn't met, the Blob service returns status code 412 (Precondition Failed).|    
|`x-ms-lease-id:<ID>`|Required if the blob has an active lease. To perform this operation on a blob with an active lease, specify the valid lease ID for this header.|  
|`x-ms-blob-content-disposition`|Optional. Sets the blob’s `Content-Disposition` header. Available for versions 2013-08-15 and later.<br /><br /> The `Content-Disposition` response header field conveys additional information about how to process the response payload, and also can be used to attach additional metadata. For example, if set to `attachment`, it indicates that the user-agent should not display the response, but instead show a **Save As** dialog with a filename other than the blob name specified.<br /><br /> The response from the [Get Blob](Get-Blob.md) and [Get Blob Properties](Get-Blob-Properties.md) operations includes the `content-disposition` header.|  
|`Origin`|Optional. Specifies the origin from which the request is issued. The presence of this header results in cross-origin resource sharing headers on the response. See [CORS Support for the Storage Services](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md) for details.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
|`x-ms-access-tier`|Optional. Indicates the tier to be set on blob. Valid values for block blob tiers are `Hot`/`Cool`/`Archive` and are supported on blob storage or general purpose v2 accounts beginning with version 2018-11-09. For detailed information about block blob tiering see [Hot, cool and archive storage tiers](/azure/storage/storage-blob-storage-tiers).|  
  
This operation also supports the use of conditional headers to write the blob only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  

### Request Headers (Customer-provided encryption keys)
  
The following headers may be specified on the request to encrypt a blob with a customer-provided key. Encryption with a customer-provided key (and the corresponding set of headers) is optional.
  
|Request header|Description|  
|--------------------|-----------------|  
|`x-ms-encryption-key`|Required. The Base64-encoded AES-256 encryption key.|  
|`x-ms-encryption-key-sha256`|Required. The Base64-encoded SHA256 hash of the encryption key.|  
|`x-ms-encryption-algorithm: AES256`|Required. Specifies the algorithm to use for encryption. The value of this header must be `AES256`.|  
  
### Request Body  
No request body.  
  
### Sample Request  
 The following example shows a request to create a block blob:  
  
```  
Request Syntax:  
PUT https://myaccount.blob.core.windows.net/mycontainer/myblockblob HTTP/1.1  
  
Request Headers:  
x-ms-version: 2020-04-08  
x-ms-date: <date>  
Content-Type: text/plain; charset=UTF-8  
x-ms-blob-content-disposition: attachment; filename="fname.ext"  
x-ms-blob-type: BlockBlob  
x-ms-meta-m1: v1  
x-ms-meta-m2: v2  
x-ms-copy-source: https://myaccount.blob.core.windows.net/mycontainer/myblob
Authorization: SharedKey myaccount:YhuFJjN4fAR8/AmBrqBz7MG2uFinQ4rkh4dscbj598g=  
Content-Length: 0
```  

## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 201 (Created).  
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value that the client can use to perform conditional `PUT` operations by using the `If-Match` request header. The ETag value will be in quotes.|  
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br /> Any write operation on the blob (including updates on the blob's metadata or properties) changes the last modified time of the blob.|  
|`Content-MD5`|This header is returned for a block blob so the client can check the integrity of message content. The `Content-MD5` value returned is computed by the Blob service. This header is returned even when the request does not include `Content-MD5` or `x-ms-blob-content-md5` headers.|  
|`x-ms-content-crc64`|This header is returned for a block blob so the client can check the integrity of message content. The `x-ms-content-crc64` value returned is computed by the Blob service. This header will always be returned.| 
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`Access-Control-Allow-Origin`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule. This header returns the value of the origin request header in case of a match.|  
|`Access-Control-Expose-Headers`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule. Returns the list of response headers that are to be exposed to the client or issuer of the request.|  
|`Access-Control-Allow-Credentials`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule that does not allow all origins. This header will be set to true.|  
|`x-ms-request-server-encrypted: true/false`|The value of this header is set to `true` if the contents of the request are successfully encrypted using the specified algorithm, and `false` otherwise.|  
|`x-ms-encryption-key-sha256`|This header is returned if the request used a customer-provided key for encryption, so the client can ensure the contents of the request are successfully encrypted using the provided key.|  
|`x-ms-encryption-scope`|This header is returned if the request used an encryption scope, so the client can ensure the contents of the request are successfully encrypted using the encryption scope.|  
|`x-ms-version-id: <DateTime>`|This header returns an opaque `DateTime` value that uniquely identifies the blob. The value of this header indicates the Version of the blob, and may be used in subsequent requests to access the blob.|  
  
### Response Body  
 None.  
  
### Sample Response  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Transfer-Encoding: chunked  
Content-MD5: sQqNsWTgdUEFt6mb5y4/5Q==  
x-ms-content-crc64: 77uWZTolTHU
Date: <date>  
ETag: "0x8CB171BA9E94B0B"  
Last-Modified: <date>  
Access-Control-Allow-Origin: http://contoso.com  
Access-Control-Expose-Headers: Content-MD5  
Access-Control-Allow-Credentials: True  
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0  
x-ms-version-id: <DateTime>  
```  
  
## Authorization  
 This operation can be called by the account owner and by any client with a shared access signature that has permission to write to this blob or its container.  
  
 If a request specifies tags with the `x-ms-tags` request header, the caller must meet the authorization requirements of the [Set Blob Tags](Set-Blob-Tags.md) operation.  
  
## Remarks

The `Put Blob from URL` operation is supported beginning with the `2020-04-08` version.

 In version 2020-10-02 and newer, Azure Active Directory authorization is supported for the source of the copy operation.
 
The source blob may be of any type, including a block blob, append blob, or page blob.  The destination blob, however, must be a block blob.

The following table describes the maximum block and blob sizes permitted by service version.

| Service version | Maximum block size (via Put Block from URL) | Maximum blob size (via Put Block List) | Maximum blob size via single write operation (via Put Blob from URL) |
|-|-|-|-|
| Version 2020-04-08 and later | 4000 MiB | Approximately 190.7 TiB (4000 MiB X 50,000 blocks) | 5000 MiB (preview) |
| Versions prior to 2020-04-08 | 100 MiB | Approximately 4.75 TiB (100 MiB X 50,000 blocks) | 256 MiB |

The `Put Blob from URL` operation always copies the entire source blob.  Copying a range of bytes or set of blocks is not supported. To perform partial updates, refer to [Put Block From URL](put-block-from-url.md). The destination blob can be an existing block blob or can be a new blob created by the operation. 

When using a block blob as the source object, all committed blob content is copied. However, the block list is not preserved, and uncommitted blocks are not copied. The content of the destination blob will be identical to that of the source, but the committed block list will not be preserved. 

 **Put Blob Properties and Metadata**

 When creating a block blob from a copy source, the standard blob properties are copied by default from the source blob. If application metadata is specified in the request, it will be stored without copying source blob metadata. To explicitly set any HTTP content headers, you may specify the corresponding header in the request. 

 - `Content-Type` 

 - `Content-Encoding` 

 - `Content-Length` 

 - `Cache-Control`

 - `Content-Disposition` 

The size of the destination blob always matches that of the source blob.  The Content-Length header must be 0 in the Put Blob from URL request (as there is no request body), and the content length property for the destination blob is inferred from the size of the source.  

 **Blob Index Tags**

If tags for the destination blob are provided in the `x-ms-tags` header, they must be query-string encoded.  Tag keys and values must conform to the naming and length requirements as specified in Set Blob Tags.  Further, the x-ms-tags header may contain up to 2kb of tags.  If more tags are required, use the Set Blob Tags operation.  

If tags are not provided in the `x-ms-tags` header, then they are not copied from the source blob.  
  
**Encryption Scopes and Customer Provided Keys**

The Put Blob from URL API supports both Encryption Scopes and Customer Provided Keys, using the `x-ms-encryption-scope` and `x-ms-encryption-key` headers, respectively. 

If the `x-ms-copy-source` header refers to the same source blob as the destination blob in the request URI, the Put Blob from URL operation performs a synchronous in-place rewrite of the blob. This enables rewriting a blob to use a different encryption key or encryption scope. 

**Billing**
  
The destination account of a Put Blob from URL operation is charged for one transaction to initiate the write, and the source account also incurs one transaction for each read request to the source. 

In addition, if the source and destination accounts reside in different regions (e.g., US North and US South), bandwidth used to transfer the request is charged to the source storage account as egress. Egress between accounts within the same region is free. 

Finally, creating a new blob with a different name within the same storage account uses additional storage resources, so the operation results in a charge against the storage account's capacity usage for those additional resources. 
  
## See Also  
 [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
