---
title: Append Blob Seal (REST API) - Azure Storage
description: The Append Blob Seal operation allows users and applications to seal append blobs, marking them as read-only.
author: amishra-dev
ms.date: 04/12/2021
ms.service: storage
ms.topic: reference
ms.author: amishra
---

# Append Blob Seal

The purpose of the `Append Blob Seal` operation is to allow users and applications to seal append blobs, marking them as read-only. This document outlines the proposed REST API specs for this feature.

The account owner can perform this operation. Additionally, anyone with a shared access signature that has write permissions to access the blob can perform this operation.

## Request

 You can construct the `Append Blob Seal` request as follows. HTTPS is recommended. Replace `myaccount` with the name of your storage account.
  
|PUT method request URI|HTTP version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=seal`|HTTP/1.1|  

### Headers

`Append Blob Seal` returns common API headers, `ETag`/`LMT` (last-modified-time), `x-ms-request-id`, `x-ms-version`, `content-length`, and `Date`. `Append Blob Seal` doesn't change the `ETag`/`LMT`.

| **Response header**  | **Value**  | **Description**  |
|---------------| ---------------------|------------------|
| `x-ms-blob-sealed`  | true/false  | Optional. False by default. If the blob is sealed, this header is included in the response when you seal and get properties of a blob. This header should appear in `GetBlob`, `GetBlobProperties`, `AppendBlobSeal`, and `ListBlobs` for append blobs. |

### Query parameters

No additional URI parameters.

### Request body

None.

## Response

The response includes an HTTP status code and a list of response headers.

### Status code

You might receive any of the following status codes:

- 200 (Success): The blob is sealed. The call is idempotent and will succeed if the blob is already sealed.

- 409 (InvalidBlobType): The service returns this status code if the call is on an existing page blob or block blob.

- 404 (BlobNotFound): The service returns this status code if the call is on a non-existent blob.

### Remarks

If an append blob has a lease, you need a lease ID to seal the blob.

After you seal a blob, you can still update properties, blob index tags, and metadata. Soft-deleting a sealed blob preserves the sealed state. You can overwrite sealed blobs.  

If you take a snapshot of a sealed blob, the snapshot includes the sealed flag. For existing snapshots in the new version, Microsoft returns the property.

When you copy a sealed blob, the sealed flag is propagated by default. A header is exposed that allows the flag to be overwritten.

A new XML element will be added to the `ListBlob` response, named `Sealed`. The value can be either `true` or `false`.

If you call `AppendBlock` on a blob that is already sealed, the service returns the error message shown in the following table. This applies to older versions of the API.

|**Error code** | **HTTP status code** | **User message** |
|---------------| ---------------------|------------------|
| BlobIsSealed | Conflict (409) | The specified blob is sealed, and its contents can't be modified unless the blob is re-created after a delete. |

If you call `Append Blob Seal` on an append blob that has already been sealed, you simply see a status code of 200 (Success).

## See also

[Azure Blob Storage error codes](Blob-Service-Error-Codes.md) 
