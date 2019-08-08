---
title: "Blob Batch"
ms.custom: na
ms.date: 2019-03-26
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: a3e943b4-5745-4e64-9d6f-728bbefbd5ee
caps.latest.revision: 1
author: kupplaks
manager: andred
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
# Blob Batch
This `Blob Batch` REST API allows multiple API calls to be embedded into a single HTTP request. This API supports two types of subrequests: [SetBlobTier](set-blob-tier.md) for block blobs and [DeleteBlob](Delete-Blob.md). The response returned by the server for a batch request contains the results for each subrequest in the batch. The batch request and response uses the syntax of OData batch processing specification with modifications to semantics. This API is available starting in version `2018-11-09`. Please note that this feature is currently in preview.
  
## Request  
 The `Blob Batch` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|Method|Request URI|HTTP Version|
|------------|-----------------|------------------|
|`POST`|`https://myaccount.blob.core.windows.net/?comp=batch`|HTTP/1.1| 
  
### URI Parameters
The following additional parameters may be specified on the request URI.

|Parameter|Description|
|-------------|-----------|
|`timeout`|Optional. The timeout parameter is expressed in seconds with a maximum value of 120 seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|

### Request Headers
The following table describes required and optional request headers.

|Request Header|Description|
|------------|-----------------|
|`Authorization`|Required. Specifies the authentication scheme, storage account name, and signature. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).|  
|`x-ms-version`|Required for all authenticated requests. Specifies the version of the operation to use for this request. This version will be used for all subrequests. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. The length of the request.|  
|`Content-Type`|Required. The value of this header must be `multipart/mixed` with a batch boundary. Example header value: `multipart/mixed; boundary=batch_a81786c8-e301-4e42-a729-a32ca24ae252`|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](http://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  

### Request Body
 The request body for a blob batch contains a list of all subrequests. The format uses the syntax of the OData batch specification with modifications to semantics. The request body starts with a batch boundary followed by two mandatory headers: `Content-Type` header with value `application/http` and `Content-Transfer-Encoding` with value `binary`. This is followed by an optional `Content-ID` header with a string value to track each of the subrequests. The response will contain the `Content-ID` header for each corresponding subrequest response to use for tracking. These request headers are followed by a mandatory empty line and then the definition for each subrequest. The body of each subrequest is a complete HTTP request with verb, URL, headers, and body needed for the request. Note the following caveats: 
 
  * The subrequests should not have the `x-ms-version header`. All subrequests will be executed with the top-level batch request version. 
  * The subrequest URL should only have the path of the URL (i.e without the host).
  * Each batch request supports a maximum of 256 subrequests.
  * All subrequests must be of the same request type.
  * Each subrequest will be authenticated and authorized separately with the provided information in the subrequest.
 
### Sample Request

```
POST http://account.blob.core.windows.net/?comp=batch HTTP/1.1 
Content-Type: multipart/mixed; boundary=batch_357de4f7-6d0b-4e02-8cd2-6361411a9525 
x-ms-version: 2018-11-09 
Authorization: SharedKey account:QvaoYDQ+0VcaA/hKFjUmQmIxXv2RT3XwwTsOTHL39HI=
Host: 127.0.0.1:10000 
Content-Length: 1569 

--batch_357de4f7-6d0b-4e02-8cd2-6361411a9525 
Content-Type: application/http 
Content-Transfer-Encoding: binary 
Content-ID: 0 

DELETE /container0/blob0 HTTP/1.1 
x-ms-date: Thu, 14 Jun 2018 16:46:54 GMT 
Authorization: SharedKey account:G4jjBXA7LI/RnWKIOQ8i9xH4p76pAQ+4Fs4R1VxasaE= 
Content-Length: 0 
--batch_357de4f7-6d0b-4e02-8cd2-6361411a9525 
Content-Type: application/http 
Content-Transfer-Encoding: binary 
Content-ID: 1 

DELETE /container1/blob1 HTTP/1.1 
x-ms-date: Thu, 14 Jun 2018 16:46:54 GMT 
Authorization: SharedKey account:IvCoYDQ+0VcaA/hKFjUmQmIxXv2RT3XwwTsOTHL39HI= 
Content-Length: 0 
--batch_357de4f7-6d0b-4e02-8cd2-6361411a9525 
Content-Type: application/http 
Content-Transfer-Encoding: binary 
Content-ID: 2 

DELETE /container2/blob2 HTTP/1.1 
x-ms-date: Thu, 14 Jun 2018 16:46:54 GMT 
Authorization: SharedKey account:S37N2JTjcmOQVLHLbDmp2johz+KpTJvKhbVc4M7+UqI= 
Content-Length: 0 
--batch_357de4f7-6d0b-4e02-8cd2-6361411a9525-- 
```

## Response
The response includes an HTTP status code and a set of response headers for the top level batch request and response information for all of its subrequests.

### Response Body
 The batch response is a multipart/mixed response which contains the response for each subrequest. The response is chunked. Each subresponse starts with the `Content-Type: application/http` header. The Content-ID header follows, if it was provided in the request. This is followed by the HTTP response status code and response headers for each subrequest. 
 
### Sample Response

```
HTTP/1.1 202 Accepted 
Transfer-Encoding: chunked 
Content-Type: multipart/mixed; boundary=batchresponse_66925647-d0cb-4109-b6d3-28efe3e1e5ed 
x-ms-request-id: 778fdc83-801e-0000-62ff-033467000000 
x-ms-version: 2018-11-09 

409
--batchresponse_66925647-d0cb-4109-b6d3-28efe3e1e5ed 
Content-Type: application/http 
Content-ID: 0 

HTTP/1.1 202 Accepted 
x-ms-request-id: 778fdc83-801e-0000-62ff-0334671e284f 
x-ms-version: 2018-11-09 

--batchresponse_66925647-d0cb-4109-b6d3-28efe3e1e5ed 
Content-Type: application/http 
Content-ID: 1 

HTTP/1.1 202 Accepted 
x-ms-request-id: 778fdc83-801e-0000-62ff-0334671e2851 
x-ms-version: 2018-11-09 

--batchresponse_66925647-d0cb-4109-b6d3-28efe3e1e5ed 
Content-Type: application/http 
Content-ID: 2 

HTTP/1.1 404 The specified blob does not exist. 
x-ms-error-code: BlobNotFound 
x-ms-request-id: 778fdc83-801e-0000-62ff-0334671e2852 
x-ms-version: 2018-11-09 
Content-Length: 216 
Content-Type: application/xml 

<?xml version="1.0" encoding="utf-8"?> 
<Error><Code>BlobNotFound</Code><Message>The specified blob does not exist. 
RequestId:778fdc83-801e-0000-62ff-0334671e2852 
Time:2018-06-14T16:46:54.6040685Z</Message></Error> 
--batchresponse_66925647-d0cb-4109-b6d3-28efe3e1e5ed-- 
0
```

### Status Code
If the batch request is well-formed and authenticated then the operation returns status code 202 (Accepted). Each subrequest will have its own response depending on the outcome of the operation. The subrequest status will be returned in the response body.

For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).
### Response Headers
The response for this operation includes the headers below. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).

## Authorization
The Batch request will be authenticated like any other REST request. The top-level batch request can only be called by the account owner. Each subrequest will be authenticated and authorized separately. The subrequests will support all authentication and authorization mechanisms that an individual request would.

## Billing
The batch REST request will be counted as one transaction and each individual subrequest will also be counted as one transaction.

## Remarks
One of the main benefits of using a batch request is the reduction in the number of connections a client has to open. Note the following restrictions:
  * Only supports Set Blob Tier for block blobs and Delete Blob as subrequests in the batch. 
  * Only supports up to 256 subrequests in a single batch. The size of the body for a batch request cannot exceed 4MB. 
  * An empty batch request will fail with http status code 400 (BadRequest). 
  * There are no guarantees on the order of execution of the batch subrequests. 
  * Batch subrequest execution is not atomic. Each subrequest is executed independently. 
  * Each subrequest must be for a resource within the same storage account. A single batch request does not support executing requests from different storage accounts.
  * A nested request body is not supported.
  * If the server fails to parse the request body, the result is a failure of the entire batch and no request will be executed.

## See Also  
 [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
