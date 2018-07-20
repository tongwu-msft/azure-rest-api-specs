---
title: "RestoreProgressInfo"
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
# RestoreProgressInfo

Describes the progress of a restore operation on a partition.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`RestoreState`](#restorestate) | string (enum) | No |
| [`TimeStampUtc`](#timestamputc) | string (date-time) | No |
| [`RestoredEpoch`](#restoredepoch) | [BackupEpoch](sfclient-model-backupepoch.md) | No |
| [`RestoredLsn`](#restoredlsn) | string | No |
| [`FailureError`](#failureerror) | [FabricErrorError](sfclient-model-fabricerrorerror.md) | No |

____
### `RestoreState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Represents the current state of the partition restore operation.


Possible values are: 

  - `Invalid` - Indicates an invalid restore state. All Service Fabric enumerations have the invalid type.
  - `Accepted` - Operation has been validated and accepted. Restore is yet to be triggered.
  - `RestoreInProgress` - Restore operation has been triggered and is under process.
  - `Success` - Operation completed with success.
  - `Failure` - Operation completed with failure.
  - `Timeout` - Operation timed out.



____
### `TimeStampUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Timestamp when operation succeeded or failed.

____
### `RestoredEpoch`
__Type__: [BackupEpoch](sfclient-model-backupepoch.md) <br/>
__Required__: No<br/>
<br/>
Describes the epoch at which the partition is restored.

____
### `RestoredLsn`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Restored LSN.

____
### `FailureError`
__Type__: [FabricErrorError](sfclient-model-fabricerrorerror.md) <br/>
__Required__: No<br/>
<br/>
Denotes the failure encountered in performing restore operation.
