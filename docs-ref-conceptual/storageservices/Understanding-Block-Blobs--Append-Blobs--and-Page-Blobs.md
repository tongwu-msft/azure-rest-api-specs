---
title: Understanding block blobs, append blobs, and page blobs
titleSuffix: Azure Storage
description: Overview of block blobs, append blobs, and page blobs.
author: pemari-msft

ms.date: 04/01/2021
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Understanding block blobs, append blobs, and page blobs

The storage service offers three types of blobs, *block blobs*, *append blobs*, and *page blobs*. You specify the blob type when you create the blob. Once the blob has been created, its type cannot be changed, and it can be updated only by using operations appropriate for that blob type, *i.e.*, writing a block or list of blocks to a block blob, appending blocks to an append blob, and writing pages to a page blob.  
  
All blobs reflect committed changes immediately. Each version of the blob has a unique tag, called an *ETag*, that you can use with access conditions to assure you only change a specific instance of the blob.  

Any blob can be leased for exclusive write access. When a blob is leased, only calls that include the current lease ID can modify the blob or (for block blobs) its blocks.  

Any blob can be duplicated in a snapshot. For information about snapshots, see [Creating a Snapshot of a Blob](Creating-a-Snapshot-of-a-Blob.md).  
  
> [!NOTE]
> Blobs in the Azure storage emulator are limited to a maximum size of 2 GiB.  
  
## About block blobs

Block blobs are optimized for uploading large amounts of data efficiently. Block blobs are composed of blocks, each of which is identified by a block ID. A block blob can include up to 50,000 blocks. Each block in a block blob can be a different size, up to the maximum size permitted for the service version in use. To create or modify a block blob, write a set of blocks via the [Put Block](Put-Block.md) operation and then commit the blocks to a blob with the [Put Block List](Put-Block-List.md) operation.

Blobs that are less than a certain size (determined by service version) can be uploaded in their entirety with a single write operation via [Put Blob](Put-Blob.md).

The following table describes the maximum block and blob sizes permitted by service version.

| Service version | Maximum block size (via Put Block) | Maximum blob size (via Put Block List) | Maximum blob size via single write operation (via Put Blob) |
|-|-|-|-|
| Version 2019-12-12 and later | 4000 MiB | Approximately 190.7 TiB (4000 MiB X 50,000 blocks) | 5000 MiB (preview) |
| Version 2016-05-31 through version 2019-07-07 | 100 MiB | Approximately 4.75 TiB (100 MiB X 50,000 blocks) | 256 MiB |
| Versions prior to 2016-05-31 | 4 MiB | Approximately 195 GiB (4 MiB X 50,000 blocks) | 64 MiB |

Storage clients default to a 128 MiB maximum single blob upload, settable in the Azure Storage client library for .NET version 11 by using the [SingleBlobUploadThresholdInBytes](/dotnet/api/microsoft.azure.storage.blob.blobrequestoptions.singleblobuploadthresholdinbytes) property of the [BlobRequestOptions](/dotnet/api/microsoft.azure.storage.blob.blobrequestoptions) object. When a block blob upload is larger than the value in this property, storage clients break the file into blocks. You can set the number of threads used to upload the blocks in parallel on a per-request basis using the [ParallelOperationThreadCount](/dotnet/api/microsoft.azure.storage.blob.blobrequestoptions.paralleloperationthreadcount) property of the [BlobRequestOptions](/dotnet/api/microsoft.azure.storage.blob.blobrequestoptions) object.  

When you upload a block to a blob in your storage account, it is associated with the specified block blob, but it does not become part of the blob until you commit a list of blocks that includes the new block's ID. New blocks remain in an uncommitted state until they are specifically committed or discarded. There can be a maximum of 100,000 uncommitted blocks. Writing a block does not update the last modified time of an existing blob.  

Block blobs include features that help you manage large files over networks. With a block blob, you can upload multiple blocks in parallel to decrease upload time. Each block can include an MD5 hash to verify the transfer, so you can track upload progress and re-send blocks as needed. You can upload blocks in any order, and determine their sequence in the final block list commitment step. You can also upload a new block to replace an existing uncommitted block of the same block ID. You have one week to commit blocks to a blob before they are discarded. All uncommitted blocks are also discarded when a block list commitment operation occurs but does not include them.  

You can modify an existing block blob by inserting, replacing, or deleting existing blocks. After uploading the block or blocks that have changed, you can commit a new version of the blob by committing the new blocks with the existing blocks you want to keep using a single commit operation. To insert the same range of bytes in two different locations of the committed blob, you can commit the same block in two places within the same commit operation. For any commit operation, if any block is not found, the entire commitment operation fails with an error, and the blob is not modified. Any block commitment overwrites the blob's existing properties and metadata, and discards all uncommitted blocks.  

Block IDs are strings of equal length within a blob. Block client code usually uses base-64 encoding to normalize strings into equal lengths. When using base-64 encoding, the pre-encoded string must be 64 bytes or less. Block ID values can be duplicated in different blobs.

If you write a block for a blob that does not exist, a new block blob is created, with a length of zero bytes. This blob will appear in blob lists that include uncommitted blobs. If you don't commit any block to this blob, it and its uncommitted blocks will be discarded one week after the last successful block upload. All uncommitted blocks are also discarded when a new blob of the same name is created using a single step (rather than the two-step block upload-then-commit process).  

## About page blobs

Page blobs are a collection of 512-byte pages optimized for random read and write operations. To create a page blob, you initialize the page blob and specify the maximum size the page blob will grow. To add or update the contents of a page blob, you write a page or pages by specifying an offset and a range that both align to 512-byte page boundaries. A write to a page blob can overwrite just one page, some pages, or up to 4 MiB of the page blob. Writes to page blobs happen in-place and are immediately committed to the blob. The maximum size for a page blob is 8 TiB.  
  
Azure virtual machine disks are backed by page blobs. Azure offers two types of durable disk storage: premium and standard. Premium storage for page blobs is designed for Azure virtual machine workloads that require consistent high performance and low latency. For detailed information, see the **Premium solid-state drives (SSD)** section of the article [Select a disk type for IaaS VMs](/azure/virtual-machines/windows/disks-types#premium-ssd). For information about the scalability targets for premium storage for page blobs, see [Azure Storage Scalability and Performance Targets](/azure/storage/storage-scalability-targets).
  
## About append blobs

An append blob is composed of blocks and is optimized for append operations. When you modify an append blob, blocks are added to the end of the blob only, via the [Append Block](Append-Block.md) operation. Updating or deleting of existing blocks is not supported. Unlike a block blob, an append blob does not expose its block IDs.  

Each block in an append blob can be a different size, up to a maximum of 4 MiB, and an append blob can include up to 50,000 blocks. The maximum size of an append blob is therefore slightly more than 195 GiB (4 MiB X 50,000 blocks).  
  
## See Also

- [Blob service concepts](Blob-Service-Concepts.md)
- [Blob service REST API](Blob-Service-REST-API.md)
