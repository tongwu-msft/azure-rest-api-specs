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

A blob snapshot is a read-only version of a blob that's taken at a point in time. Once a snapshot has been created, it can be read, copied, or deleted, but not modified. Snapshots provide a way to back up a blob as it appears at a moment in time.  
  
 A snapshot of a blob has the same name as the base blob from which the snapshot is taken, with a `DateTime` value appended to indicate the time at which the snapshot was taken. For example, if the page blob URI is `http://storagesample.core.blob.windows.net/mydrives/myvhd`, the snapshot URI will be similar to `http://storagesample.core.blob.windows.net/mydrives/myvhd?snapshot=2011-03-09T01:42:34.9360000Z`. This value may be used to reference the snapshot for further operations. A blob's snapshots share its URI and are distinguished only by this `DateTime` value.  
  
 A blob may have any number of snapshots. Snapshots persist until they are explicitly deleted A snapshot cannot outlive its source blob. You can enumerate the snapshots associated with your blob to track your current snapshots.  
  
 **Inheriting Properties**  
  
 When you create a snapshot of a blob, system properties are copied to the snapshot with the same values, including:
 
 - ContentType
 - ContentEncoding
 - ContentLanguage
 - Length
 - CacheControl
 - ContentMd5
 
  A lease associated with the base blob is not copied to the snapshot. Snapshots cannot be leased.  
  
 **Copying Snapshots**  
  
 Copy operations involving blobs and snapshots follow these rules:  
  
-   You can copy a snapshot over its base blob. By promoting a snapshot to the position of the base blob, you can restore an earlier version of a blob. The snapshot remains, but its source is overwritten with a copy that can be both read and written.  
  
-   You can copy a snapshot to a destination blob with a different name. The resulting destination blob is a writeable blob and not a snapshot.  
  
-   When a source blob is copied, any snapshots of the source blob are not copied to the destination. When a destination blob is overwritten with a copy, any snapshots associated with the destination blob stay intact under its name.  
  
-   When you create a snapshot of a block blob, the blob's committed block list is also copied to the snapshot. Any uncommitted blocks are not copied.  
  
 **Specifying an Access Condition**  
  
 You can specify an access condition so that the snapshot is created only if a condition is met. To specify an access condition. If the specified condition is not met, the snapshot is not created, and the Blob service returns status code [HTTPStatusCode.PreconditionFailed](http://msdn.microsoft.com/library/system.net.httpstatuscode.aspx). See [Snapshot Blob](Snapshot-Blob.md) for more information.
  
 **Deleting Snapshots**  
  
 A blob that has snapshots cannot be deleted unless the snapshots are also deleted. You can delete a snapshot individually, or tell the storage service to delete all snapshots when deleting the source blob. If you attempt to delete a blob that still has snapshots, your call will return an error.

## See also
  
 [Snapshot Blob](Snapshot-Blob.md)   
 [Put Block](Put-Block.md)   
 [Put Block List](Put-Block-List.md)   
 [Put Page](Put-Page.md)   
 [Delete Blob](Delete-Blob.md)   
 [Enumerating Blob Resources](Enumerating-Blob-Resources.md)   
 [Understanding How Snapshots Accrue Charges](Understanding-How-Snapshots-Accrue-Charges.md)
