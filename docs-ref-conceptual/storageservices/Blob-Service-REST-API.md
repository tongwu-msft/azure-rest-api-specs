---
title: "Blob Service REST API"
ms.custom: na
ms.date: 2016-06-29
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: fa36aa0e-256a-488b-bc85-af7c3a230937
caps.latest.revision: 47
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
# Blob Service REST API
The Blob service stores text and binary data as blobs in the cloud. The Blob service offers the following three resources: the storage account, containers, and blobs. Within your storage account, containers provide a way to organize sets of blobs.  
  
 You can store text and binary data in one of the following types of blobs:  
  
-   Block blobs, which are optimized for streaming.  
  
-   Append blobs, which are optimized for append operations.  
  
-   Page blobs, which are optimized for random read/write operations and which provide the ability to write to a range of bytes in a blob.  
  
 For more information about block blobs and page blobs, see [Understanding Block Blobs, Append Blobs, and Page Blobs](Understanding-Block-Blobs--Append-Blobs--and-Page-Blobs.md).  
  
 The REST API for the Blob service defines HTTP operations against container and blob resources. The API includes the operations listed in the following table.  
  
|Operation|Resource Type|Description|  
|---------------|-------------------|-----------------|  
|[List Containers](List-Containers2.md)|Account|Lists all of the containers in a storage account.|  
|[Set Blob Service Properties](Set-Blob-Service-Properties.md)|Account|Sets the properties of the Blob service, including logging and metrics settings, and the default service version.|  
|[Get Blob Service Properties](Get-Blob-Service-Properties.md)|Account|Gets the properties of the Blob service, including logging and metrics settings, and the default service version.|  
|[Preflight Blob Request](Preflight-Blob-Request.md)|Account|Queries the Cross-Origin Resource Sharing (CORS) rules for the Blob service prior to sending the actual request.|  
|[Get Blob Service Stats](Get-Blob-Service-Stats.md)|Account|Retrieves statistics related to replication for the Blob service. This operation is only available on the secondary location endpoint when read-access geo-redundant replication is enabled for the storage account.|  
|[Create Container](Create-Container.md)|Container|Creates a new container in a storage account.|  
|[Get Container Properties](Get-Container-Properties.md)|Container|Returns all user-defined metadata and system properties of a container.|  
|[Get Container Metadata](Get-Container-Metadata.md)|Container|Returns only user-defined metadata of a container.|  
|[Set Container Metadata](Set-Container-Metadata.md)|Container|Sets user-defined metadata of a container.|  
|[Get Container ACL](Get-Container-ACL.md)|Container|Gets the public access policy and any stored access policies for the container.|  
|[Set Container ACL](Set-Container-ACL.md)|Container|Sets the public access policy and any stored access policies for the container.|  
|[Lease Container](Lease-Container.md)|Container|Establishes and manages a lock on a container for delete operations.|  
|[Delete Container](Delete-Container.md)|Container|Deletes the container and any blobs that it contains.|  
|[List Blobs](List-Blobs.md)|Container|Lists all of the blobs in a container.|  
|[Put Blob](Put-Blob.md)|Block, append, and page blobs|Creates a new blob or replaces an existing blob within a container.|  
|[Get Blob](Get-Blob.md)|Block, append, and page blobs|Reads or downloads a blob from the Blob service, including its user-defined metadata and system properties.|  
|[Get Blob Properties](Get-Blob-Properties.md)|Block, append, and page blobs|Returns all system properties and user-defined metadata on the blob.|  
|[Set Blob Properties](Set-Blob-Properties.md)|Block, append, and page blobs|Sets system properties defined for an existing blob.|  
|[Get Blob Metadata](Get-Blob-Metadata.md)|Block, append, and page blobs|Retrieves all user-defined metadata of an existing blob or snapshot.|  
|[Set Blob Metadata](Set-Blob-Metadata.md)|Block, append, and page blobs|Sets user-defined metadata of an existing blob.|
|[Delete Blob](Delete-Blob.md)|Block, append and page blobs|Marks a blob for deletion.|    
|[Undelete Blob](Undelete-Blob.md)|Block, append and page blobs|Restores the contents and metadata of soft deleted blob and/or all associated soft deleted snapshots.|  
|[Lease Blob](Lease-Blob.md)|Block, append, and page blobs|Establishes and manages a lock on write and delete operations. To delete or write to a locked blob, a client must provide the lease ID.|  
|[Snapshot Blob](Snapshot-Blob.md)|Block, append, and page blobs|Creates a read-only snapshot of a blob.|  
|[Copy Blob](Copy-Blob.md)|Block, append, and page blobs|Copies a source blob to a destination blob in this storage account or in another storage account.|  
|[Abort Copy Blob](Abort-Copy-Blob.md)|Block, append, and page blobs|Aborts a pending `Copy Blob` operation, and leaves a destination blob with zero length and full metadata.|  
|[Put Block](Put-Block.md)|Block blobs only|Creates a new block to be committed as part of a block blob.|  
|[Put Block From URL](Put-Block-From-URL.md)|Block blobs only|Creates a new block to be committed as part of a block blob where the contents are read from a URL.|  
|[Put Block List](Put-Block-List.md)|Block blobs only|Commits a blob by specifying the set of block IDs that comprise the block blob.|  
|[Get Block List](Get-Block-List.md)|Block blobs only|Retrieves the list of blocks that have been uploaded as part of a block blob.|  
|[Set Blob Tier](set-blob-tier.md)|Block and page blobs|Sets the tier of a blob.|  
|[Put Page](Put-Page.md)|Page blobs only|Writes a range of pages into a page blob.|  
|[Get Page Ranges](Get-Page-Ranges.md)|Page blobs only|Returns a list of valid page ranges for a page blob or a snapshot of a page blob.|  
|[Incremental Copy Blob](Incremental-Copy-Blob.md)|Page blobs only|Copies a snapshot of a source page blob to a destination page blob. Only differential changes are transferred.|  
|[Append Block](Append-Block.md)|Append blobs only|Writes a block of data to the end of an append blob.|  
  
## In This Section  
 [Blob Service Concepts](Blob-Service-Concepts.md)  
  
 [Operations on the Account (Blob Service)](Operations-on-the-Account--Blob-Service-.md)  
  
 [Operations on Containers](Operations-on-Containers.md)  
  
 [Operations on Blobs](Operations-on-Blobs.md)  
  
## See Also  
 [Storage Services REST](Azure-Storage-Services-REST-API-Reference.md)
