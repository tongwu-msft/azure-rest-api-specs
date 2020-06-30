---
title: "BackupPartitionDescription"
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
# BackupPartitionDescription

Describes the parameters for triggering partition's backup.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`BackupStorage`](#backupstorage) | [BackupStorageDescription](sfclient-model-backupstoragedescription.md) | No |

____
### `BackupStorage`
__Type__: [BackupStorageDescription](sfclient-model-backupstoragedescription.md) <br/>
__Required__: No<br/>
<br/>
Specifies the details of the backup storage where to save the backup.
