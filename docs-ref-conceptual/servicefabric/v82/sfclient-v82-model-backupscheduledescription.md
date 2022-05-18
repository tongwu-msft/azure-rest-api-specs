---
title: "BackupScheduleDescription v82"
description: "BackupScheduleDescription v82"
ms.date: "10/21/2020"
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
# BackupScheduleDescription v82

Describes the backup schedule parameters.
## Inheritance

'BackupScheduleDescription' is the base type of the polymorphic type model. The 'ScheduleKind' property is the discriminator for the derived types. 
The value of the 'ScheduleKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| ScheduleKind | Derived Type |
| --- | --- | 
| FrequencyBased | [FrequencyBasedBackupScheduleDescription](sfclient-v82-model-frequencybasedbackupscheduledescription.md) |
| TimeBased | [TimeBasedBackupScheduleDescription](sfclient-v82-model-timebasedbackupscheduledescription.md) |

