---
title: Operations on blobs (REST API) - Azure Storage
description: Operations on blobs.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Operations on blobs

Microsoft Azure Storage provides REST operations for working with blobs in the Blob service.  
  
## In this section  

This section contains reference information for operations on block blobs, append blobs and page blobs.  
  
### Operations on block blobs, append blobs and page blobs  

[Put Blob](Put-Blob.md)  
Creates a new blob or replaces an existing blob within a container.  

[Get Blob](Get-Blob.md)  
Reads or download a blob from the Blob service, including its user-defined metadata and system properties.  

[Get Blob Properties](Get-Blob-Properties.md)  
Returns all user-defined metadata, standard HTTP properties, and system properties for the blob.  

[Set Blob Properties](Set-Blob-Properties.md)  
Sets values for system properties defined for a blob.  

[Get Blob Metadata](Get-Blob-Metadata.md)  
Returns all user-defined metadata for the specified blob.  

[Set Blob Metadata](Set-Blob-Metadata.md)  
Sets user-defined metadata for the specified blob as one or more name-value pairs.  

[Lease Blob](Lease-Blob.md)  
Establishes and manages a lock on write and delete operations. To delete or write to a locked blob, a client must provide the lease ID.  

[Snapshot Blob](Snapshot-Blob.md)  
Creates a snapshot of a blob.  

[Copy Blob](Copy-Blob.md)  
Copies a blob to a destination within the storage account.  

[Copy Blob From URL](copy-blob-from-url.md)
Copies a blob to a destination within the storage account synchronously for source blob sizes up to 256 MB.

[Abort Copy Blob](Abort-Copy-Blob.md)  
Aborts a pending `Copy Blob` operation, and leaves a destination blob with zero length and full metadata.  

[Delete Blob](Delete-Blob.md)  
Marks the specified blob for deletion.  

[Undelete Blob](Undelete-Blob.md)
Restores the contents and metadata of a soft deleted blob and any associated soft deleted snapshots.

[Set Blob Tier](set-blob-tier.md)  
Sets the access tier of a blob.  

[Blob Batch](blob-batch.md)
Performs multiple API calls within a single request.
  
### Operations on block blobs  

[Put Block](Put-Block.md)  
Creates a new block to be committed as part of a block blob.  

[Put Block From URL](Put-Block-From-URL.md)  
Creates a new block to be committed as part of a block blob where the contents are read from a URL.

[Put Block List](Put-Block-List.md)  
Commits a block blob by specifying the set of block IDs that comprise the blob.  

[Get Block List](Get-Block-List.md)  
Retrieves the list of blocks that have been uploaded as part of a block blob.  
  
### Operations on page blobs

[Put Page](Put-Page.md)  
Writes a range of pages into a page blob.  

[Put Page From URL](put-page-from-url.md)
Writes a range of pages to a page blob where the contents are read from a URL.

[Get Page Ranges](Get-Page-Ranges.md)  
Returns a list of valid page ranges for a page blob or a snapshot of a page blob.  

[Incremental Copy Blob](Incremental-Copy-Blob.md)  
Copies a snapshot of a source page blob to a destination page blob. Only differential changes are transferred.
  
### Operations on append blobs
  
[Append Block](Append-Block.md)  
Appends a block as part of an append blob. 

[Append Block from URL](append-block-from-url.md)
Appends a block as part of an append blob where the contents are read from a URL.  
  
## See also

[Blob service concepts](Blob-Service-Concepts.md)
