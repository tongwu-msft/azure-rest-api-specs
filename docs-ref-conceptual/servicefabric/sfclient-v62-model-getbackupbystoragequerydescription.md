---
title: "GetBackupByStorageQueryDescription"
ms.date: "2018-04-23"
ms.prod: "azure"
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
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
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
# GetBackupByStorageQueryDescription

Describes additional filters to be applied, while listing backups, and backup storage details from where to fetch the backups.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StartDateTimeFilter`](#startdatetimefilter) | string (date-time) | No |
| [`EndDateTimeFilter`](#enddatetimefilter) | string (date-time) | No |
| [`Latest`](#latest) | boolean | No |
| [`Storage`](#storage) | [BackupStorageDescription](sfclient-v62-model-backupstoragedescription.md) | Yes |
| [`BackupEntity`](#backupentity) | [BackupEntity](sfclient-v62-model-backupentity.md) | Yes |

____
### `StartDateTimeFilter`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Specifies the start date time in ISO8601 from which to enumerate backups. If not specified, backups are enumerated from the beginning.

____
### `EndDateTimeFilter`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Specifies the end date time in ISO8601 till which to enumerate backups. If not specified, backups are enumerated till the end.

____
### `Latest`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
If specified as true, gets the most recent backup (within the specified time range) for every partition under the specified backup entity.

____
### `Storage`
__Type__: [BackupStorageDescription](sfclient-v62-model-backupstoragedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the parameters for the backup storage from where to enumerate backups. This is optional and by default backups are enumerated from the backup storage where this backup entity is currently being backed up (as specified in backup policy). This parameter is useful to be able to enumerate backups from another cluster where you may intend to restore.

____
### `BackupEntity`
__Type__: [BackupEntity](sfclient-v62-model-backupentity.md) <br/>
__Required__: Yes<br/>
<br/>
Indicates the entity for which to enumerate backups.
