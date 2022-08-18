---
title: Blob Batch (REST API) - Azure Storage
description: The Blob Batch operation allows multiple API calls to be embedded into a single HTTP request.
author: pemari-msft
ms.date: 04/05/2022
ms.author: pemari
ms.service: storage
ms.topic: reference
---

# Blob Batch

The `Blob Batch` operation allows multiple API calls to be embedded into a single HTTP request. This API supports two types of subrequests: [Set Blob Tier](set-blob-tier.md) for block blobs and [Delete Blob](Delete-Blob.md). The response returned by the server for a batch request contains the results for each subrequest in the batch. The batch request and response uses the syntax of the `OData` batch processing specification, with modifications to semantics. This API is available starting in version 2018-11-09.
  
## Request  

You can construct the `Blob Batch` request as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account.
  
|Method|Request URI|HTTP version|
|------------|-----------------|------------------|
|`POST`|`https://myaccount.blob.core.windows.net/?comp=batch`<br /><br /> `https://myaccount.blob.core.windows.net/containername?restype=container&comp=batch`|HTTP/1.1| 
  
### URI parameters

You can specify the following additional parameters on the request URI.

|Parameter|Description|
|-------------|-----------|
|`timeout`|Optional. The timeout parameter is expressed in seconds, with a maximum value of 120 seconds. For more information, see [Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|
|`restype`|Optional, version 2020-04-08 and later. The only value supported for the `restype` parameter is `container`. When this parameter is specified, the URI must include the container name. Any subrequests must be scoped to the same container.|

### Request headers

The following table describes required and optional request headers.

|Request header|Description|
|------------|-----------------|
|`Authorization`|Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. This version will be used for all subrequests. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Length`|Required. The length of the request.|  
|`Content-Type`|Required. The value of this header must be `multipart/mixed`, with a batch boundary. Example header value: `multipart/mixed; boundary=batch_a81786c8-e301-4e42-a729-a32ca24ae252`.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Blob Storage](/azure/storage/blobs/monitor-blob-storage).|  

### Request body

The request body for a blob batch contains a list of all subrequests. The format uses the syntax of the `OData` batch specification, with modifications to semantics.

The request body starts with a batch boundary, followed by two mandatory headers: the `Content-Type` header with the value `application/http`, and the `Content-Transfer-Encoding` header with the value `binary`. This is followed by an optional `Content-ID` header, with a string value to track each of the subrequests. The response contains the `Content-ID` header for each corresponding subrequest response to use for tracking.

These request headers are followed by a mandatory empty line, and then the definition for each subrequest. The body of each subrequest is a complete HTTP request with a verb, URL, headers, and body needed for the request. Note the following caveats: 

* The subrequests should not have the `x-ms-version header`. All subrequests are run with the top-level batch request version. 
* The subrequest URL should only have the path of the URL (without the host).
* Each batch request supports a maximum of 256 subrequests.
* All subrequests must be of the same request type.
* Each subrequest is authorized separately, with the provided information in the subrequest.
* Each line in the request body should end with *\r\n* characters.

### Sample request

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

The response includes an HTTP status code and a set of response headers for the top level batch request. The response also includes response information for all of its subrequests.

### Response body

The batch response is a `multipart/mixed` response, which contains the response for each subrequest. The response is chunked. Each subresponse starts with the `Content-Type: application/http` header. The `Content-ID` header follows, if it was provided in the request. This is followed by the HTTP response status code, and response headers for each subrequest. 
 
### Sample response

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

### Status code

If the batch request is well-formed and authorized, then the operation returns status code 202 (Accepted). Each subrequest has its own response, depending on the outcome of the operation. The subrequest status is returned in the response body.

For more information, see [Status and error codes](Status-and-Error-Codes2.md).

### Response headers

The response for this operation includes the following headers. The response can also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).

## Authorization

When `restype=container` is omitted, you must authorize the parent batch request by using a shared key. You can use either the account access key or an account shared access signature.

When `restype=container` is included on the request, you can authorize the parent batch request through a shared key or Azure Active Directory. You can also authorize with a shared access signature that is signed by either of those authorization mechanisms.

Each subrequest is authorized separately. A subrequest supports the same authorization mechanisms that the operation supports when it isn't part of a batch operation.

## Billing

The batch REST request is counted as one transaction, and each individual subrequest is also counted as one transaction.

## Remarks

One of the main benefits of using a batch request is the reduction in the number of connections a client has to open. Note the following restrictions:

* Only supports `Set Blob Tier` for block blobs, and `Delete Blob` as subrequests in the batch. 
* Only supports up to 256 subrequests in a single batch. The size of the body for a batch request can't exceed 4 MB. 
* An empty batch request fails with code 400 (Bad Request). 
* There are no guarantees on the order of execution of the batch subrequests. 
* Batch subrequest execution isn't atomic. Each subrequest runs independently. 
* Each subrequest must be for a resource within the same storage account. A single batch request doesn't support running requests from different storage accounts.
* A nested request body isn't supported.
* If the server fails to parse the request body, the entire batch fails, and no request will be run.
* Note that [Account SAS](create-account-sas.md) is the only shared access signature type supported by `Blob Batch`, when the batch isn't using `restype=container`.

### Scope all subrequests to a specific container

Beginning with REST version 2020-04-08, the `Blob Batch` API supports scoping subrequests to a specified container. When the request URI includes the container name and the `restype=container` parameter, then each subrequest must apply to the same container. If the container name specified for a subrequest doesn't match the container name provided in URI, the service returns error code 400 (Bad Request).

All authorization mechanisms supported for a container are valid for a `Blob Batch` operation that is scoped to the container. Each subrequest sends an authorization header to the service.

## See also  

[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)   
[Status and error codes](Status-and-Error-Codes2.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Setting timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md)
