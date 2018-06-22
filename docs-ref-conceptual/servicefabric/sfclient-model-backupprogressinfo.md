---
title: "BackupProgressInfo"
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
# BackupProgressInfo

Describes the progress of a partition's backup.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`BackupState`](#backupstate) | string (enum) | No |
| [`TimeStampUtc`](#timestamputc) | string (date-time) | No |
| [`BackupId`](#backupid) | string (uuid) | No |
| [`BackupLocation`](#backuplocation) | string | No |
| [`EpochOfLastBackupRecord`](#epochoflastbackuprecord) | [BackupEpoch](sfclient-model-backupepoch.md) | No |
| [`LsnOfLastBackupRecord`](#lsnoflastbackuprecord) | string | No |
| [`FailureError`](#failureerror) | [FabricErrorError](sfclient-model-fabricerrorerror.md) | No |

____
### `BackupState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Represents the current state of the partition backup operation.


Possible values are: 

  - `Invalid` - Indicates an invalid backup state. All Service Fabric enumerations have the invalid type.
  - `Accepted` - Operation has been validated and accepted. Backup is yet to be triggered.
  - `BackupInProgress` - Backup operation has been triggered and is under process.
  - `Success` - Operation completed with success.
  - `Failure` - Operation completed with failure.
  - `Timeout` - Operation timed out.



____
### `TimeStampUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
TimeStamp in UTC when operation succeeded or failed.

____
### `BackupId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Unique ID of the newly created backup.

____
### `BackupLocation`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Location, relative to the backup store, of the newly created backup.

____
### `EpochOfLastBackupRecord`
__Type__: [BackupEpoch](sfclient-model-backupepoch.md) <br/>
__Required__: No<br/>
<br/>
Specifies the epoch of the last record included in backup.

____
### `LsnOfLastBackupRecord`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The LSN of last record included in backup.

____
### `FailureError`
__Type__: [FabricErrorError](sfclient-model-fabricerrorerror.md) <br/>
__Required__: No<br/>
<br/>
Denotes the failure encountered in performing backup operation.
