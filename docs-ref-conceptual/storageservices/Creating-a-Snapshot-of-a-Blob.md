---
title: Create a snapshot of a blob (REST) - Azure Storage
description: A blob snapshot is a read-only version of a blob that's taken at a point in time. Once a snapshot has been created, it can be read, copied, or deleted, but not modified. Snapshots provide a way to back up a blob as it appears at a moment in time. 
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Create a snapshot of a blob

A blob snapshot is a read-only version of a blob that's taken at a single point in time. After a snapshot has been created, it can be read, copied, or deleted, but not modified. Snapshots provide a way to back up a blob as it appears at a particular moment in time.
  
 A snapshot of a blob has the same name as the base blob from which the snapshot is taken, with a `DateTime` value appended to indicate the time at which the snapshot was taken. For example, if the page blob URI is `http://storagesample.core.blob.windows.net/mydrives/myvhd`, the snapshot URI will be something like `http://storagesample.core.blob.windows.net/mydrives/myvhd?snapshot=2011-03-09T01:42:34.9360000Z`. You can use this value to reference the snapshot for further operations. A blob's snapshots share the blob's URI and are distinguished only by this `DateTime` value.  
  
 A blob may have any number of snapshots. Snapshots persist until they're explicitly deleted. A snapshot can't outlive its source blob. You can enumerate the snapshots associated with your blob to track your current snapshots.  
  
 **Inheriting properties**  
  
 When you create a snapshot of a blob, system properties are copied to the snapshot with the same values, including:
 
 - ContentType
 - ContentEncoding
 - ContentLanguage
 - Length
 - CacheControl
 - ContentMd5
 
  A lease associated with the base blob isn't copied to the snapshot. Snapshots can't be leased.  
  
 **Copying snapshots**  
  
 Copy operations involving blobs and snapshots follow these rules:  
  
-   You can copy a snapshot over its base blob. By promoting a snapshot to the position of the base blob, you can restore an earlier version of a blob. The snapshot remains, but its source is overwritten with a copy that can be both read and written.  
  
-   You can copy a snapshot to a destination blob that has a different name. The resulting destination blob is a writeable blob, not a snapshot.  
  
-   When a source blob is copied, any snapshots of the source blob are not copied to the destination. When a destination blob is overwritten by a copy, any snapshots associated with the destination blob remain intact under its name.  
  
-   When you create a snapshot of a block blob, the blob's committed block list is also copied to the snapshot. Any uncommitted blocks are not copied.  
  
 **Specifying an access condition**  
  
 You can specify an access condition so that the snapshot is created only if that condition is met. If the specified condition isn't met, the snapshot isn't created, and Azure Blob storage returns status code [HTTPStatusCode.PreconditionFailed](https://msdn.microsoft.com/library/system.net.httpstatuscode.aspx). For more information, see [Snapshot Blob](Snapshot-Blob.md).
  
 **Deleting snapshots**  
  
 A blob that has snapshots can't be deleted unless the snapshots are also deleted. You can delete a snapshot individually, or you can delete all snapshots when you delete the source blob. If you try to delete a blob that still has snapshots, your call returns an error.

## See also
  
 [Snapshot Blob](Snapshot-Blob.md)   
 [Put Block](Put-Block.md)   
 [Put Block List](Put-Block-List.md)   
 [Put Page](Put-Page.md)   
 [Delete Blob](Delete-Blob.md)   
 [Listing Blob storage resources](Enumerating-Blob-Resources.md)  
 [Understanding how snapshots accrue charges](Understanding-How-Snapshots-Accrue-Charges.md)
