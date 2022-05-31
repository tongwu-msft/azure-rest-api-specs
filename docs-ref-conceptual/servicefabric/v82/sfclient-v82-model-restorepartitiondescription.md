---
title: "RestorePartitionDescription v82"
description: "RestorePartitionDescription v82"
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
# RestorePartitionDescription v82

Specifies the parameters needed to trigger a restore of a specific partition.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`BackupId`](#backupid) | string (uuid) | Yes |
| [`BackupLocation`](#backuplocation) | string | Yes |
| [`BackupStorage`](#backupstorage) | [BackupStorageDescription](sfclient-v82-model-backupstoragedescription.md) | No |

____
### `BackupId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
Unique backup ID.

____
### `BackupLocation`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Location of the backup relative to the backup storage specified/ configured.

____
### `BackupStorage`
__Type__: [BackupStorageDescription](sfclient-v82-model-backupstoragedescription.md) <br/>
__Required__: No<br/>
<br/>
Location of the backup from where the partition will be restored.
