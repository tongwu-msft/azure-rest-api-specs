---
title: Append Blob Seal (REST API) - Azure Storage
description: Append Blob Seal allows users and applications to seal append blobs, marking them as read only
author: amishra-dev

ms.date: 04/12/2021
ms.service: storage
ms.topic: reference
ms.author: amishra
---

# Append Blob Seal

The purpose of Append Blob Seal is to allow users and applications to seal append blobs, marking them as read only. This document outlines the proposed REST API specs for this feature.

This operation can be performed by the account owner and by anyone with a Shared Access Signature that has write permissions to access the blob.

## Request

 The `Append Blob Seal` request may be constructed as follows. HTTPS is recommended. Replace `myaccount` with the name of your storage account:  
  
|PUT Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=seal`|HTTP/1.1|  

### Headers

Append Blob Seal will return common API headers, ETag/LMT (last-modified-time), x-ms-request-id, x-ms-version, content-length, and Date. AppendBlobSeal will not change the ETag/LMT.

| **Response Header**  | **Value**  | **Description**  |
|---------------| ---------------------|------------------|
| **x-ms-blob-sealed**  | true/false  | Optional. False by default. If blob is sealed, this header will be included in the response when sealing a blob and when getting properties of a blob. Should appear in GetBlob, GetBlobProperties, AppendBlobSeal, ListBlobs for append blobs. |

### Query Parameters

No additional URI parameters.

### Request Body

None.

## Response

The response includes an HTTP status code and a list of response headers.

### Status Code

200 (Success), the blob is sealed; the call is idempotent and will succeed if the blob is already sealed

409 (InvalidBlobType), when called on an existing page blob or block blob

404 (BlobNotFound), when called on a non-existent blob

### Remarks

If an append blob has a lease, a lease ID will be needed to seal the blob.

After a blob is sealed, properties, blob index tags, and metadata can still be updated. Soft deleting a sealed blob will preserve the sealed state. Sealed blobs can be overwritten.  

Taking a snapshot of a sealed blob will include the sealed flag. We **will** return the property in the case of already existing snapshots in the new version.

When copying a sealed blob, the sealed flag will be propagated by default. A header will be exposed that will allow the flag to be overwritten.

A new XML element will be added to the ListBlob response named Sealed whose value can be either true or false.

Calling AppendBlock on a blob that is already sealed will return error code listed in the table below. This applies to older versions of the API.

|**Error code** | **HTTP status code** | **User message** |
|---------------| ---------------------|------------------|
| BlobIsSealed | Conflict (409) | The specified blob is sealed and its contents cannot be modified unless the blob is recreated after a delete. |

Calling append blob seal on an already sealed append blob results in a status code 200 success but no-op.

## See also
 [Blob Service Error Codes](Blob-Service-Error-Codes.md) 
