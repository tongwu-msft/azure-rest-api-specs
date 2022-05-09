---
title: "BackupInfo v82"
description: "BackupInfo v82"
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
# BackupInfo v82

Represents a backup point which can be used to trigger a restore.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`BackupId`](#backupid) | string (uuid) | No |
| [`BackupChainId`](#backupchainid) | string (uuid) | No |
| [`ApplicationName`](#applicationname) | string | No |
| [`ServiceName`](#servicename) | string | No |
| [`PartitionInformation`](#partitioninformation) | [PartitionInformation](sfclient-v82-model-partitioninformation.md) | No |
| [`BackupLocation`](#backuplocation) | string | No |
| [`BackupType`](#backuptype) | string (enum) | No |
| [`EpochOfLastBackupRecord`](#epochoflastbackuprecord) | [Epoch](sfclient-v82-model-epoch.md) | No |
| [`LsnOfLastBackupRecord`](#lsnoflastbackuprecord) | string | No |
| [`CreationTimeUtc`](#creationtimeutc) | string (date-time) | No |
| [`ServiceManifestVersion`](#servicemanifestversion) | string | No |
| [`FailureError`](#failureerror) | [FabricErrorError](sfclient-v82-model-fabricerrorerror.md) | No |

____
### `BackupId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Unique backup ID .

____
### `BackupChainId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Unique backup chain ID. All backups part of the same chain has the same backup chain id. A backup chain is comprised of 1 full backup and multiple incremental backups.

____
### `ApplicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the Service Fabric application this partition backup belongs to.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the Service Fabric service this partition backup belongs to.

____
### `PartitionInformation`
__Type__: [PartitionInformation](sfclient-v82-model-partitioninformation.md) <br/>
__Required__: No<br/>
<br/>
Information about the partition to which this backup belongs to

____
### `BackupLocation`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Location of the backup, relative to the backup store.

____
### `BackupType`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Describes the type of backup, whether its full or incremental.


Possible values are: 

  - `Invalid` - Indicates an invalid backup type. All Service Fabric enumerations have the invalid type.
  - `Full` - Indicates a full backup.
  - `Incremental` - Indicates an incremental backup. A backup chain is comprised of a full backup followed by 0 or more incremental backups.



____
### `EpochOfLastBackupRecord`
__Type__: [Epoch](sfclient-v82-model-epoch.md) <br/>
__Required__: No<br/>
<br/>
Epoch of the last record in this backup.

____
### `LsnOfLastBackupRecord`
__Type__: string <br/>
__Required__: No<br/>
<br/>
LSN of the last record in this backup.

____
### `CreationTimeUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The date time when this backup was taken.

____
### `ServiceManifestVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Manifest Version of the service this partition backup belongs to.

____
### `FailureError`
__Type__: [FabricErrorError](sfclient-v82-model-fabricerrorerror.md) <br/>
__Required__: No<br/>
<br/>
Denotes the failure encountered in getting backup point information.
