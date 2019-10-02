---
title: Specifying the range header for Blob service operations (REST API) - Azure Storage
description: Specifying the range header for Blob service operations.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Specifying the range header for Blob service operations

Several Blob service GET operations support the use of the standard HTTP `Range` header. Many HTTP clients, including the .NET client library, limit the size of the `Range` header to a 32-bit integer, and thus its value is limited to a maximum of 4 GB. Since both block blobs and page blobs can be larger than 4 GB in size, the Blob service accepts a custom range header `x-ms-range` for any operation that takes an HTTP `Range` header.  
  
 Some HTTP clients, including the Microsoft Silverlight library, limit access to the `Range` header altogether. The `x-ms-range` header can be used to circumvent these limitations as well.  
  
 If the `x-ms-range` header is specified on a request, then the service uses the range specified by `x-ms-range`; otherwise, the range specified by the `Range` header is used.  
  
> [!NOTE]
>  The Azure Storage Client Library automatically handles setting the appropriate range header on the request when you set the `Range` property of the `PutPageProperties` object.  
  
## Range Header Formats  
 The Blob service accepts two byte ranges for the `Range` and `x-ms-range` headers. The byte range must adhere to either of the following formats for the headers:  
  
-   `bytes=startByte-` for requests using version 2011-08-18 or newer  
  
-   `bytes=startByte-endByte` for requests using all versions (2009-04-14 through the newest version)  
  
### Format 1: bytes=startByte-  
 The first format, `bytes=startByte-`, is available only for requests using version 2011-08-18 or newer, or the storage emulator service in SDK 1.6 or newer. This range will return bytes from the offset `startByte` through the end of the blob. For example, to specify a range encompassing all bytes after the first 256 bytes of a blob, you can pass in either of the following headers:  
  
-   `Range: bytes=255-`  
  
-   `x-ms-range: bytes=255-`  
  
 The `Content-Length` header in the response is equal to the number of bytes from the offset until the end of the blob. Using the example range above for a blob of 1,024 bytes in length, `Content-Length` would be 756.  
  
 If the offset is valid and does not exceed the blob’s total length, the request will return an status code 206 (Partial Content). If the offset is invalid and exceeds the blob’s total length, the request will return status code 416 (Requested Range Not Satisfiable).  
  
### Format 2: bytes=startByte-endByte  
 The second format, `bytes=startByte-endByte`, is available for requests using all versions (2009-04-14 through the newest version), and for all versions of the storage emulator service. This range will return bytes from the offset `startByte` through `endByte`. For example, to specify a range encompassing the first 512 bytes of a blob, you would pass in either of the following headers:  
  
-   `Range: bytes=0-511`  
  
-   `x-ms-range: bytes=0-511`  
  
 The `Content-Length` header in the response is equal to the number of bytes between each offset. Using the example range above for a blob of 1,024 bytes in length, `Content-Length` would be 512.  
  
 If the offset is valid and does not exceed the blob’s total length, the request will return an status code 206 (Partial Content). If the offset is invalid and exceeds the blob’s total length, the request will return status code 416 (Requested Range Not Satisfiable).  
  
## See Also  
 [Blob Service Concepts](Blob-Service-Concepts.md)   
 [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md)
