---
title: "BackupEntity"
ms.date: "04/15/2020"
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
# BackupEntity

Describes the Service Fabric entity that is configured for backup.
## Inheritance

'BackupEntity' is the base type of the polymorphic type model. The 'EntityKind' property is the discriminator for the derived types. 
The value of the 'EntityKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| EntityKind | Derived Type |
| --- | --- | 
| Application | [ApplicationBackupEntity](sfclient-v71-model-applicationbackupentity.md) |
| Service | [ServiceBackupEntity](sfclient-v71-model-servicebackupentity.md) |
| Partition | [PartitionBackupEntity](sfclient-v71-model-partitionbackupentity.md) |

