---
title: "BackupPolicyDescription"
ms.date: "2018-07-20"
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
# BackupPolicyDescription

Describes a backup policy for configuring periodic backup.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | Yes |
| [`AutoRestoreOnDataLoss`](#autorestoreondataloss) | boolean | Yes |
| [`MaxIncrementalBackups`](#maxincrementalbackups) | integer | Yes |
| [`Schedule`](#schedule) | [BackupScheduleDescription](sfclient-model-backupscheduledescription.md) | Yes |
| [`Storage`](#storage) | [BackupStorageDescription](sfclient-model-backupstoragedescription.md) | Yes |

____
### `Name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The unique name identifying this backup policy.

____
### `AutoRestoreOnDataLoss`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Specifies whether to trigger restore automatically using the latest available backup in case the partition experiences a data loss event.

____
### `MaxIncrementalBackups`
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: `255` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
Defines the maximum number of incremental backups to be taken between two full backups. This is just the upper limit. A full backup may be taken before specified number of incremental backups are completed in one of the following conditions
- The replica has never taken a full backup since it has become primary,
- Some of the log records since the last backup has been truncated, or
- Replica passed the MaxAccumulatedBackupLogSizeInMB limit.


____
### `Schedule`
__Type__: [BackupScheduleDescription](sfclient-model-backupscheduledescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the backup schedule parameters.

____
### `Storage`
__Type__: [BackupStorageDescription](sfclient-model-backupstoragedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the details of backup storage where to store the periodic backups.
