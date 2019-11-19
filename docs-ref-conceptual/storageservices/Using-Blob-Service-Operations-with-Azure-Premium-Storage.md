---
title: REST operations against page blobs with Azure premium storage (REST API)
description: Azure premium storage offers a solution for virtual machine workloads requiring high performance and low latency.
author: pemari-msft

ms.date: 10/03/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Perform REST operations against page blobs with premium storage

Azure premium storage offers a solution for Azure virtual machine workloads requiring high performance and low latency. Premium disks are backed by page blobs in Azure Storage. This topic provides information about performing REST operations against page blobs in general purpose v2 (GPv2) storage accounts with premium performance. To learn more about Azure premium storage, see [Premium SSD](https://go.microsoft.com/fwlink/?LinkId=521898).


For information about premium block blob storage, see [Azure Block Blob storage performance tiers](https://docs.microsoft.com/azure/storage/blobs/storage-blob-performance-tiers).

For information about premium file storage, see [How to create a premium Azure file share](https://docs.microsoft.com/azure/storage/files/storage-how-to-create-premium-fileshare).

To create and manage accounts by using Resource Manager, see the [Storage Resource Provider REST API reference](/rest/api/storagerp/). To create and manage classic accounts, see the [Service Management REST API reference](https://msdn.microsoft.com/library/azure/ee460790.aspx).

You can also access page blobs in GPv2 storage accounts via the [Azure Storage Client Library for .NET](https://go.microsoft.com/fwlink/?LinkID=398944&clcid=0x409).

## Premium GPv2 storage accounts support page blobs only

A premium GPv2 account stores only page blobs, and only REST APIs for page blobs and their containers are supported.

> [!NOTE]
> Premium GPv2 accounts do not support block blobs, or the File, Table, and Queue services. However, premium BlockBlobStorage accounts do support block and append blobs. For more information and to see all the various storage options, visit [Types of storage accounts](https://docs.microsoft.com/azure/storage/common/storage-account-overview#types-of-storage-accounts)
>
> A premium GPv2 endpoint cannot be mapped to a custom domain name.

## REST API restrictions on a premium GPv2 account

There are certain restrictions when using the Blob service REST API against a premium GPv2 account:

- Only REST operations using version 2014-02-14 and later are supported. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md) for details.

- The number of snapshots per page blob is limited to 100. If that limit is exceeded, the [Snapshot Blob](Snapshot-Blob.md) operation returns error code 409 (SnapshotCountExceeded).

- A snapshot of a page blob may be taken once every ten minutes. If that rate is exceeded, the `Snapshot Blob` operation returns error code 409 (SnapshotOperationRateExceeded).

- Public access to a container storing page blobs is not permitted. Calling [Set Container ACL](Set-Container-ACL.md) with the `x-ms-blob-public-access` header returns error code 400 (UnsupportedHeader). You can obtain public access by creating a [SAS URI](/azure/storage/storage-dotnet-shared-access-signature-part-1) with the right permissions and an infinite expiration time.

For additional error information, see [Blob Service Error Codes](Blob-Service-Error-Codes.md).

## Restrictions on REST API operations against disks attached to a virtual machine

When a disk backed by a page blob is attached to an Azure virtual machine, certain REST API operations are not permitted. These operations are permitted against the disk only if it is detached from the virtual machine. If a restricted operation is called against an attached disk, the service returns error code 409 (SystemInUse).

The following table shows operations that are restricted for attached disks.

|Operation Type|Restricted Operations for Attached Disks|
|--------------------|----------------------------------------------|
|Read operations|[Get Blob](Get-Blob.md), [Get Page Ranges](Get-Page-Ranges.md)|
|Write operations|[Put Blob](Put-Blob.md), [Put Page](Put-Page.md), [Set Blob Properties](Set-Blob-Properties.md), [Set Blob Metadata](Set-Blob-Metadata.md)|
|Delete operations|[Delete Blob](Delete-Blob.md)|
|Lease operations|[Lease Blob](Lease-Blob.md)|

## See also

 [Blob Service Error Codes](Blob-Service-Error-Codes.md)
