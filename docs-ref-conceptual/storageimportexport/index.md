---
title: Azure Storage Import-Export REST API Reference
description: TBD
author: NarayanThiru
ms.author: nanthi
ms.manager: nanthi
ms.topic: reference
ms.service: azure-import-export
ms.devlang: rest-api
---

# Azure Storage Import-Export REST API Reference

This API helps you manage Azure Import/Export jobs to transfer data to or from Blob storage. For more information, see [Azure Import/Export service documentation](/azure/storage/common/storage-import-export-service).

## REST Operation Groups

| Operation Group | Description |
| --- | --- |
| [Bit Locker Keys](xref:management.azure.com.storageimportexport.bitlockerkeys) | Provides operation return the list of Bitlocker Keys for all drives in the specified job. |
| [Jobs](xref:management.azure.com.storageimportexport.jobs) | Provides operations to create and manage Azure Import/Export jobs. |
| [Locations](xref:management.azure.com.storageimportexport.locations) | Provides operation to return single or list of the details about a location to which you can ship the disks associated with an import or export job. A location is an Azure region. |
| [Operations](xref:management.azure.com.storageimportexport.operations) | Provides operation to return the list of operations supported by the Azure Import/Export resource provider. |

## See Also

- [Azure Import/Export Service documentation](/azure/storage/common/storage-import-export-service)
