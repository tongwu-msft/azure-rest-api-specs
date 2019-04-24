---
title: "Operations on Page Blobs"
ms.custom: na
ms.date: 2016-12-21
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: a65e8013-64a4-45cf-9a3d-dbffef75e46e
caps.latest.revision: 4
author: tamram
manager: carolz
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
# Operations on Page Blobs
The REST API operations in this section apply only to page blobs. See [Understanding Block Blobs, Append Blobs, and Page Blobs](Understanding-Block-Blobs--Append-Blobs--and-Page-Blobs.md) for more information.  
  
## In This Section  
 [Put Page](Put-Page.md)  
 Puts a range of pages into a page blob, or clears a range of pages from the blob.  

 [Put Page From URL](Put-Page-From-Url.md)  
 Puts a range of pages into a page blob using a URL as the source of the data.  
  
 [Get Page Ranges](Get-Page-Ranges.md)  
 Returns a list of active page ranges for a page blob. Active page ranges are those that have been populated with data.

 [Incremental Copy Blob](Incremental-Copy-Blob.md)  
 Copies a snapshot of a source page blob to a destination page blob. Only differential changes are transferred.