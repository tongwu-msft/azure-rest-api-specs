---
title: Using Blob service operations with Azure Premium Storage (REST API)
description: Azure Premium Storage offers a world-class cloud storage solution for Azure Virtual Machine workloads requiring high performance and low latency.
author: pemari-msft

ms.date: 08/15/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Using Blob service operations with Azure Premium Storage

Azure Premium Storage offers a world-class cloud storage solution for Azure Virtual Machine workloads requiring high performance and low latency. To learn more about Azure Premium Storage, see [Premium Storage: High-Performance Storage for Azure Virtual Machine Workloads](http://go.microsoft.com/fwlink/?LinkId=521898).
  
 Premium Storage disks are backed by page blobs in Azure Storage. This topic provides information about performing REST operations against page blobs in Premium Storage accounts using the Azure Storage Services REST API.  
  
 To create and manage Resource Manager Premium storage accounts, please see the [Storage Resource Provider REST API reference](/rest/api/storagerp/). To create and manage classic Premium storage accounts, please see the [Service Management REST API reference](https://msdn.microsoft.com/library/azure/ee460790.aspx).
  
 You can also access page blobs in Premium Storage via the [Azure Storage Client Library for .NET](http://go.microsoft.com/fwlink/?LinkID=398944&clcid=0x409).  
  
## Premium Storage accounts support page blobs only
  
Premium Storage Accounts currently support only Azure Virtual Machine disks backed by page blobs. A premium storage account stores only page blobs, and only REST APIs for page blobs and their containers are supported. Any API called on a Premium Storage account must be of version 2014-02-14 or later.  Premium Block blobs can be created in BlockBlobStorage accounts.
  
> [!NOTE]
> Azure block blobs and the File, Table, and Queue services are not currently supported in premium storage accounts.  However, Premium BlockBlobStorage accounts do support block and append blobs.  For more information and to see all the various storage options in a table, visit [Types of storage accounts](https://docs.microsoft.com/azure/storage/common/storage-account-overview?toc=%2fazure%2fstorage%2fblobs%2ftoc.json#types-of-storage-accounts)
>
> A premium storage account endpoint cannot be mapped to a custom domain name.  
  
## REST API restrictions on Premium Storage

There are certain restrictions to bear in mind when using the Blob service REST API against a Premium Storage account:  
  
- Only REST operations using version 2014-02-14 and later are supported for Premium Storage. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md) for details.  
  
- The number of snapshots per page blob in a Premium Storage account is limited to 100. If that limit is exceeded, the [Snapshot Blob](Snapshot-Blob.md) operation returns error code 409 (SnapshotCountExceeded).  
  
- A snapshot of a page blob in a Premium Storage account may be taken once every ten minutes. If that rate is exceeded, the `Snapshot Blob` operation returns error code 409 (SnaphotOperationRateExceeded).  
  
- Public access to a container containing page blobs in Premium Storage is not permitted. Calling [Set Container ACL](Set-Container-ACL.md) with the `x-ms-blob-public-access` header returns error code 400 (UnsupportedHeader). You can, however, obtain public access for Premium Storage by creating a [SAS URI](/azure/storage/storage-dotnet-shared-access-signature-part-1) with the right permissions and an infinite expiration time.
  
 For additional error information, see [Blob Service Error Codes](Blob-Service-Error-Codes.md).  
  
## Restrictions on REST API operations against disks attached to a virtual machine

 When a disk backed by a page blob in Premium Storage is attached to an Azure Virtual Machine, certain REST API operations are not permitted. These operations are permitted against the disk only if it is detached from the Virtual Machine. If a restricted operation is called against an attached disk, the service returns error code 409 (SystemInUse).  
  
 The table below shows operations that are restricted for attached disks.  
  
|Operation Type|Restricted Operations for Attached Disks|  
|--------------------|----------------------------------------------|  
|Read operations|[Get Blob](Get-Blob.md)<br /><br /> [Get Page Ranges](Get-Page-Ranges.md)|  
|Write operations|[Put Blob](Put-Blob.md)<br /><br /> [Put Page](Put-Page.md)<br /><br /> [Set Blob Properties](Set-Blob-Properties.md)<br /><br /> [Set Blob Metadata](Set-Blob-Metadata.md)|  
|Delete operations|[Delete Blob](Delete-Blob.md)|  
|Lease operations|[Lease Blob](Lease-Blob.md)|  
  
## See also  

 [Blob Service Error Codes](Blob-Service-Error-Codes.md)
