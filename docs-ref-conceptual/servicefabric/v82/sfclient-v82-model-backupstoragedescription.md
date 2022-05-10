---
title: "BackupStorageDescription v82"
description: "BackupStorageDescription v82"
ms.date: "04/02/2021"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# BackupStorageDescription v82

Describes the parameters for the backup storage.
## Inheritance

'BackupStorageDescription' is the base type of the polymorphic type model. The 'StorageKind' property is the discriminator for the derived types. 
The value of the 'StorageKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| StorageKind | Derived Type |
| --- | --- | 
| AzureBlobStore | [AzureBlobBackupStorageDescription](sfclient-v82-model-azureblobbackupstoragedescription.md) |
| FileShare | [FileShareBackupStorageDescription](sfclient-v82-model-filesharebackupstoragedescription.md) |
| DsmsAzureBlobStore | [DsmsAzureBlobBackupStorageDescription](sfclient-v82-model-dsmsazureblobbackupstoragedescription.md) |
| ManagedIdentityAzureBlobStore | [ManagedIdentityAzureBlobBackupStorageDescription](sfclient-v82-model-managedidentityazureblobbackupstoragedescription.md) |

