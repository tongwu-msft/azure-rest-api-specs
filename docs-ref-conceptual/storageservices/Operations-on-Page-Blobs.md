---
title: Operations on page blobs (REST API) - Azure Storage
description: Operations on page blobs.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Operations on page blobs

The REST API operations in this section apply only to page blobs. See [Understanding Block Blobs, Append Blobs, and Page Blobs](Understanding-Block-Blobs--Append-Blobs--and-Page-Blobs.md) for more information.  
  
## In this section  
 [Put Page](Put-Page.md)  
 Puts a range of pages into a page blob, or clears a range of pages from the blob.  

 [Put Page From URL](Put-Page-From-Url.md)  
 Puts a range of pages into a page blob using a URL as the source of the data.  
  
 [Get Page Ranges](Get-Page-Ranges.md)  
 Returns a list of active page ranges for a page blob. Active page ranges are those that have been populated with data.

 [Incremental Copy Blob](Incremental-Copy-Blob.md)  
 Copies a snapshot of a source page blob to a destination page blob. Only differential changes are transferred.