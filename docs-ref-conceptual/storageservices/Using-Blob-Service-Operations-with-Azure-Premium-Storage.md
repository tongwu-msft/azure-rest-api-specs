---
title: "Using Blob Service Operations with Azure Premium Storage"
ms.custom: na
ms.date: 2016-06-29
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: e8bf5476-6a6f-4357-8c64-eb5e23e2905a
caps.latest.revision: 9
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
# Using Blob Service Operations with Azure Premium Storage
Azure Premium Storage offers a world-class cloud storage solution for Azure Virtual Machine workloads requiring high performance and low latency. To learn about Azure Premium Storage, see [Premium Storage: High-Performance Storage for Azure Virtual Machine Workloads](http://go.microsoft.com/fwlink/?LinkId=521898). 
  
 Premium Storage is currently available only for storing data on disks used by Azure Virtual Machines. These disks are backed by page blobs in Azure Storage. This topic provides information about performing REST operations against page blobs in Premium Storage accounts using the Azure Storage Services REST API.  
  
 To create and manage Resource Manager Premium storage accounts, please see the [Storage Resource Provider REST API reference](/rest/api/storagerp/). To create and manage classic Premium storage accounts, please see the [Service Management REST API reference](https://msdn.microsoft.com/library/azure/ee460790.aspx).   
  
 You can also access page blobs in Premium Storage via the [Azure Storage Client Library for .NET](http://go.microsoft.com/fwlink/?LinkID=398944&clcid=0x409).  
  
## Premium Storage Supports Page Blobs Only  
 Premium Storage currently supports only Azure Virtual Machine disks backed by page blobs. A premium storage account stores only page blobs, and only REST APIs for page blobs and their containers are supported. Any API called on a Premium Storage account must be of version 2014-02-14 or later.  
  
> [!NOTE]
>  Azure block blobs and the File, Table, and Queue services are not currently supported in premium storage accounts.  
>   
>  A premium storage account endpoint cannot be mapped to a custom domain name.  
  
## REST API Restrictions on Premium Storage  
 There are certain restrictions to bear in mind when using the Blob service REST API against a Premium Storage account:  
  
-   Only REST operations using version 2014-02-14 and later are supported for Premium Storage. See [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md) for details.  
  
-   The number of snapshots per page blob in a Premium Storage account is limited to 100. If that limit is exceeded, the [Snapshot Blob](Snapshot-Blob.md) operation returns error code 409 (SnapshotCountExceeded).  
  
-   A snapshot of a page blob in a Premium Storage account may be taken once every ten minutes. If that rate is exceeded, the `Snapshot Blob` operation returns error code 409 (SnaphotOperationRateExceeded).  
  
-   Public access to a container containing page blobs in Premium Storage is not permitted. Calling [Set Container ACL](Set-Container-ACL.md) with the `x-ms-blob-public-access` header returns error code 400 (UnsupportedHeader). You can, however, obtain public access for Premium Storage by creating a [SAS URI](/azure/storage/storage-dotnet-shared-access-signature-part-1) with the right permissions and an infinite expiration time.
  
 For additional error information, see [Blob Service Error Codes](Blob-Service-Error-Codes.md).  
  
## Restrictions on REST API Operations Against Disks Attached to a Virtual Machine  
 When a disk backed by a page blob in Premium Storage is attached to an Azure Virtual Machine, certain REST API operations are not permitted. These operations are permitted against the disk only if it is detached from the Virtual Machine. If a restricted operation is called against an attached disk, the service returns error code 409 (SystemInUse).  
  
 The table below shows operations that are restricted for attached disks.  
  
|Operation Type|Restricted Operations for Attached Disks|  
|--------------------|----------------------------------------------|  
|Read operations|[Get Blob](Get-Blob.md)<br /><br /> [Get Page Ranges](Get-Page-Ranges.md)|  
|Write operations|[Put Blob](Put-Blob.md)<br /><br /> [Put Page](Put-Page.md)<br /><br /> [Set Blob Properties](Set-Blob-Properties.md)<br /><br /> [Set Blob Metadata](Set-Blob-Metadata.md)|  
|Delete operations|[Delete Blob](Delete-Blob.md)|  
|Lease operations|[Lease Blob](Lease-Blob.md)|  
  
## See Also  
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)
