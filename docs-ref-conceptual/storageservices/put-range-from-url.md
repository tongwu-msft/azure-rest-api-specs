---
title: Put Range from URL (FileREST API) - Azure Files
description: The Put Range from URL operation creates a new range to be committed as part of a file where the contents are read from a URL.
author: wmgries

ms.date: 03/05/2022
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Put Range from URL
The `Put Range from URL` operation creates a new range to be committed as part of a file where the contents are read from a URL. This API is available starting in version `2019-02-02`.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request
The `Put Range from URL` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
| Method | Request URI|HTTP version|  
|----------------------------|------------------|  
| `PUT` | `https://myaccount.file.core.windows.net/myshare/myfile?comp=range` | HTTP/1.1 |
  
### URI parameters
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. See [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md) for more information.|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md). For `Put Range from URL`, the version has to be 2019-02-02 or newer.|  
|`x-ms-copy-source:name`|Required. Specifies the URL of the source file. The value may be a URL of up to 2 KiB in length that specifies a file. The value should be URL-encoded as it would appear in a request URI. The source file must either be public or must be authorized via a shared access signature. If the source file is public, no authorization is required to perform the operation. Here are some examples of source object URLs:<ul><li>`https://myaccount.file.core.windows.net/myshare/mydir/myfile`</li><li>`https://myaccount.file.core.windows.net/myshare/mydir/myfile?<sastoken>`</li></ul>|
|`x-ms-copy-source-authorization: <scheme> <signature>`|Optional. Specifies the authorization scheme and signature for copy source. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).<br /> Only scheme bearer is supported for Azure Active Directory.<br />This header is supported in versions 2020-10-02 and later.|
| `x-ms-write: { update }`| Required. You must specify only `update` - request will fail if called with `clear`. The `update` value writes the bytes specified by the request body into the specified ranges. |
|`Range` or `x-ms-range`|Required. Either `Range` or `x-ms-range` is required.<br /><br /> Specifies the range of bytes to be written. Both the start and end of the range must be specified. This header is defined by the [HTTP/1.1 protocol specification](https://www.w3.org/Protocols/rfc2616/rfc2616.html).<br /><br /> For an update operation, the range can be up to 4 MiB in size.<br /><br />Azure Files accepts only a single byte range for the `Range` and `x-ms-range` headers, and the byte range must be specified in the following format: `bytes=startByte-endByte`.<br /><br /> If both `Range` and `x-ms-range` are specified, the service uses the value of `x-ms-range`. See [Specifying the Range Header for File Service Operations](Specifying-the-Range-Header-for-File-Service-Operations.md) for more information.|  
|`x-ms-source-range`|Required. Specifies the range of bytes to be read from source. Both the start and end of the range must be specified.<br /><br />Azure Files accepts only a single byte range for the `Range` and `x-ms-range` headers, and the byte range must be specified in the following format: `bytes=startByte-endByte`.<br /><br />The source range can be up to 4 MiB in size. If the source range size exceeds 4 MiB, Azure Files returns status code 413 (Request Entity Too Large). If the source range size does not match range (target range) size, the service returns status code 400 (Bad Request). |   
|`Content-Length`|Required. Specifies the number of bytes being transmitted in the request body. The value of this header must be set to zero. When the length is not zero, the operation will fail with the status code 400 (Bad Request).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server.|  
|`x-ms-source-content-crc64`|Optional. A CRC64 hash of the specified range from the URI. This hash is used to verify the integrity of the range during transport of the data from the URI. When this header is specified, Azure Files compares the hash of the content that has arrived from the copy-source with this header value.<br /><br /> Note that this CRC64 hash is not stored with the file.<br /><br /> If the two hashes do not match, the operation will fail with error code 400 (Bad Request).|  
|`x-ms-source-if-match-crc64`|Optional. A CRC64 checksum value. Specify this header to perform the operation only if the checksum of the given range read from source matches from the provided checksum.<br /><br />If the specified condition isn't met, Azure Files returns status code 412 (Precondition Failed).|
|`x-ms-source-if-none-match-crc64`|Optional. A CRC64 checksum value. Specify this header to perform the operation only if the checksum of the given range read from source is different from the provided checksum.<br /><br />If the specified condition isn't met, Azure Files returns status code 412 (Precondition Failed). | 
|`x-ms-lease-id:<ID>`|Required if the file has an active lease. To perform this operation on a file with an active lease, specify the valid lease ID for this header.|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [Monitoring Azure Blob storage](/azure/storage/blobs/monitor-blob-storage).|
| `x-ms-file-last-write-time: { now ¦ preserve }` | Optional. Version 2021-06-08 and newer. You may specify one of the following options: <ul><li>`now`: Default value. Updates the last write time timestamp to the time of the request.</li><li>`preserve`: Keeps the existing last write timestamp unchanged.</li></ul> |
  
### Request body
No request body.  
  
### Sample request

```  
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare/mydir/myfile?comp=range HTTP/1.1  
  
Request Headers:  
x-ms-page-write: update  
x-ms-copy-source: http://myaccount2.file.core.windows.net/myshare2/mydirectory2/myfile2?sv=2018-11-09&sp=r&sr=s&se=2018-08-22T09%3A59%3A28.2185790Z&sig=Qn6QEET3Gn%2FhCEVcXuwG7ssatIYiYRM5pNIy4Q3N0cQ%3D 
x-ms-date: Fri, 22 Aug 2018 01:15:50 GMT  
x-ms-version: 2019-02-02 
x-ms-range: bytes=100-1023  
x-ms-source-range: bytes=200-1123  
x-ms-source-content-crc64: 3bedb8b3730fc205 
Authorization: SharedKey myaccount:4KdWDiTdA9HmIF9+WF/8WfYOpUrFhieGIT7f0av+GEI=  
Content-Length: 0 
```  
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 201 (Created).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`ETag`|The ETag contains a value that you can use to perform operations conditionally, in quotes. |
|`Last-Modified`|The date and time that the file was last modified. The date format follows RFC 1123. For more information, see [Representation of Date/Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br />Any write operation on the file, including updates to the file's metadata or properties, changes the last modified time of the file. |
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of FileREST API used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`x-ms-content-crc64`|This header is returned so that the client can check for message content integrity. The value of this header is computed by Azure Files; it is not necessarily the same value specified in the request headers.|
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|
| `x-ms-file-last-write-time` | Version 2021-06-08 and newer. Last write time for the file formatted in the ISO 8601 format. Example: `2017-05-10T17:52:33.9551861Z`. |
  
### Sample response

```
Response Status:  
HTTP/1.1 201 Created  

Response Headers:
Date: Sun, 22 Aug 2020 01:33:35 GMT  
ETag: "0x8CB171BA9E94B0B"  
Last-Modified: Wed, 22 Aug 2020 01:13:31 GMT  
x-ms-version: 2019-02-02
x-ms-content-crc64: 3bedb8b3730fc205 
Content-Length: 0  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
```  
  
## Authorization
This operation can be called by the account owner and by anyone with a Shared Access Signature that has permission to write to this file or the Azure file share.  
  
## Remarks
The `Put Range from URL` operation writes a set of range of data to a file. If the API is called on a non-existent file on target, the API will return NotFound error (HTTP status code 404).

 In version 2020-10-02 and newer, Azure Active Directory authorization is supported for the source of the copy operation.

To create a new file, call Create File.  

`Put Range from URL` operation returns success 201 (created) only if range specified is written to the file. 

**File read operation**  
`Put Range from URL` will use [`Get File`](./Get-File.md) to read data as well as metadata, attributes and ACLs from source.

**File update operation**  
Calling `Put Range from URL` with the "update" option performs an in-place write on the specified file. Any content in the specified file is overwritten with the update.   

The range size in `Put Range from URL` operation for an update operation may be up to 4 MiB in size. If you attempt to upload range that is larger than 4 MiB, the service returns status code 413 (RequestEntityTooLarge).
