---
title: Blob Storage REST API - Azure Storage
description: Azure Blob Storage stores text and binary data as objects in the cloud.
author: pemari-msft
ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Azure Blob Storage REST API

Azure Blob Storage stores text and binary data as objects in the cloud. Blob Storage offers the following resources: the storage account, containers, and blobs. Within your storage account, containers provide a way to organize sets of blobs.  
  
You can store text and binary data in one of the following types of blobs:  
  
- Block blobs, which are optimized for streaming.  
  
- Append blobs, which are optimized for append operations.  
  
- Page blobs, which are optimized for random read/write operations, and which provide the ability to write to a range of bytes in a blob.  
  
For more information, see [Understanding block blobs, append blobs, and page blobs](Understanding-Block-Blobs--Append-Blobs--and-Page-Blobs.md).  
  
The REST API for Blob Storage defines HTTP operations against the storage account, containers, and blobs. The API includes the operations listed in the following table.  
  
|Operation|Resource type|Description|  
|---------------|-------------------|-----------------|  
|[List Containers](List-Containers2.md)|Account|Lists all of the containers in a storage account.|  
|[Set Blob Storage Properties](Set-Blob-Service-Properties.md)|Account|Sets the properties of Blob Storage, including logging and metrics settings, and the default service version.|  
|[Get Blob Storage Properties](Get-Blob-Service-Properties.md)|Account|Gets the properties Blob Storage, including logging and metrics settings, and the default service version.|  
|[Preflight Blob Request](Preflight-Blob-Request.md)|Account|Queries the Cross-Origin Resource Sharing (CORS) rules for Blob Storage, prior to sending the actual request.|  
|[Get Blob Storage Stats](Get-Blob-Service-Stats.md)|Account|Retrieves statistics related to replication for Blob Storage. This operation is only available on the secondary location endpoint when read-access geo-redundant replication is enabled for the storage account.|  
|[Get Account Information](get-account-information.md)|Account|Returns the SKU name and account kind for the specified account.|  
|[Get User Delegation Key](Get-User-Delegation-Key.md)|Account|Gets a key that can be used to sign a user delegation shared access signature. This signature grants access to resources in Blob Storage by using Azure Active Directory (Azure AD) credentials.|  
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
|[Get Blob](Get-Blob.md)|Block, append, and page blobs|Reads or downloads a blob from Blob Storage, including its user-defined metadata and system properties.|  
|[Get Blob Properties](Get-Blob-Properties.md)|Block, append, and page blobs|Returns all system properties and user-defined metadata on the blob.|  
|[Set Blob Properties](Set-Blob-Properties.md)|Block, append, and page blobs|Sets system properties defined for an existing blob.|  
|[Set Blob Expiry](Set-Blob-Expiry.md)|Block blobs|Sets expiry time for an existing blob.| 
|[Get Blob Metadata](Get-Blob-Metadata.md)|Block, append, and page blobs|Retrieves all user-defined metadata of an existing blob or snapshot.|  
|[Set Blob Metadata](Set-Blob-Metadata.md)|Block, append, and page blobs|Sets user-defined metadata of an existing blob.|
|[Get Blob Tags](get-blob-tags.md)|Block, append, and page blobs|Retrieves user-defined tags of an existing blob.|
|[Set Blob Tags](set-blob-tags.md)|Block, append, and page blobs|Sets user-defined tags of an existing blob that form a secondary index.|
|[Find Blobs By Tags](find-blobs-by-tags.md)|Block, append, and page blobs|Lists blobs by their user-defined tags.|
|[Delete Blob](Delete-Blob.md)|Block, append, and page blobs|Marks a blob for deletion.|    
|[Undelete Blob](Undelete-Blob.md)|Block, append, and page blobs|Restores the contents and metadata of a soft-deleted blob, or all associated soft-deleted snapshots.|  
|[Lease Blob](Lease-Blob.md)|Block, append, and page blobs|Establishes and manages a lock on write and delete operations. To delete or write to a locked blob, a client must provide the lease ID.|  
|[Snapshot Blob](Snapshot-Blob.md)|Block, append, and page blobs|Creates a read-only snapshot of a blob.|  
|[Copy Blob](Copy-Blob.md)|Block, append, and page blobs|Copies a source blob to a destination blob in this storage account or in another storage account.|  
|[Abort Copy Blob](Abort-Copy-Blob.md)|Block, append, and page blobs|Stops a pending `Copy Blob` operation, and leaves a destination blob with zero length and full metadata.|  
|[Put Block](Put-Block.md)|Block blobs only|Creates a new block to be committed as part of a block blob.|  
|[Put Block From URL](Put-Block-From-URL.md)|Block blobs only|Creates a new block to be committed as part of a block blob where the contents are read from a URL.|  
|[Put Block List](Put-Block-List.md)|Block blobs only|Commits a blob by specifying the set of block IDs that comprise the block blob.|  
|[Get Block List](Get-Block-List.md)|Block blobs only|Retrieves the list of blocks that have been uploaded as part of a block blob.|  
|[Query Blob Contents](query-blob-contents.md)|Block blobs only| Applies a simple Structured Query Language (SQL) statement on a blob's contents, and returns only the queried subset of the data.
|[Set Blob Tier](set-blob-tier.md)|Block and page blobs|Sets the tier of a blob.|  
|[Put Page](Put-Page.md)|Page blobs only|Writes a range of pages into a page blob.|  
|[Get Page Ranges](Get-Page-Ranges.md)|Page blobs only|Returns a list of valid page ranges for a page blob or a snapshot of a page blob.|  
|[Incremental Copy Blob](Incremental-Copy-Blob.md)|Page blobs only|Copies a snapshot of a source page blob to a destination page blob. Only differential changes are transferred.|  
|[Append Block](Append-Block.md)|Append blobs only|Writes a block of data to the end of an append blob.|  
  
## In this section
  
[Blob Storage concepts](Blob-Service-Concepts.md)  
  
[Operations on the account (Blob Storage)](Operations-on-the-Account--Blob-Service-.md)  
  
[Operations on containers](Operations-on-Containers.md)  
  
[Operations on blobs](Operations-on-Blobs.md)  

[Operations on blobs (hierarchical namespace-enabled accounts)](Operations-on-Blobs-Hierarchical-Namespace.md)  
  
## See also

[Storage services REST](Azure-Storage-Services-REST-API-Reference.md)
