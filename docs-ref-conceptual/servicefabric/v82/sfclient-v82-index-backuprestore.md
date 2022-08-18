---
title: "BackupRestore v82"
description: "BackupRestore v82"
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
# BackupRestore APIs v82

| Name | Description |
| --- | --- |
| [Create Backup Policy](sfclient-v82-api-createbackuppolicy.md) | Creates a backup policy.<br/> |
| [Delete Backup Policy](sfclient-v82-api-deletebackuppolicy.md) | Deletes the backup policy.<br/> |
| [Get Backup Policy List](sfclient-v82-api-getbackuppolicylist.md) | Gets all the backup policies configured.<br/> |
| [Get Backup Policy By Name](sfclient-v82-api-getbackuppolicybyname.md) | Gets a particular backup policy by name.<br/> |
| [Get All Entities Backed Up By Policy](sfclient-v82-api-getallentitiesbackedupbypolicy.md) | Gets the list of backup entities that are associated with this policy.<br/> |
| [Update Backup Policy](sfclient-v82-api-updatebackuppolicy.md) | Updates the backup policy.<br/> |
| [Enable Application Backup](sfclient-v82-api-enableapplicationbackup.md) | Enables periodic backup of stateful partitions under this Service Fabric application.<br/> |
| [Disable Application Backup](sfclient-v82-api-disableapplicationbackup.md) | Disables periodic backup of Service Fabric application.<br/> |
| [Get Application Backup Configuration Info](sfclient-v82-api-getapplicationbackupconfigurationinfo.md) | Gets the Service Fabric application backup configuration information.<br/> |
| [Get Application Backup List](sfclient-v82-api-getapplicationbackuplist.md) | Gets the list of backups available for every partition in this application.<br/> |
| [Suspend Application Backup](sfclient-v82-api-suspendapplicationbackup.md) | Suspends periodic backup for the specified Service Fabric application.<br/> |
| [Resume Application Backup](sfclient-v82-api-resumeapplicationbackup.md) | Resumes periodic backup of a Service Fabric application which was previously suspended.<br/> |
| [Enable Service Backup](sfclient-v82-api-enableservicebackup.md) | Enables periodic backup of stateful partitions under this Service Fabric service.<br/> |
| [Disable Service Backup](sfclient-v82-api-disableservicebackup.md) | Disables periodic backup of Service Fabric service which was previously enabled.<br/> |
| [Get Service Backup Configuration Info](sfclient-v82-api-getservicebackupconfigurationinfo.md) | Gets the Service Fabric service backup configuration information.<br/> |
| [Get Service Backup List](sfclient-v82-api-getservicebackuplist.md) | Gets the list of backups available for every partition in this service.<br/> |
| [Suspend Service Backup](sfclient-v82-api-suspendservicebackup.md) | Suspends periodic backup for the specified Service Fabric service.<br/> |
| [Resume Service Backup](sfclient-v82-api-resumeservicebackup.md) | Resumes periodic backup of a Service Fabric service which was previously suspended.<br/> |
| [Enable Partition Backup](sfclient-v82-api-enablepartitionbackup.md) | Enables periodic backup of the stateful persisted partition.<br/> |
| [Disable Partition Backup](sfclient-v82-api-disablepartitionbackup.md) | Disables periodic backup of Service Fabric partition which was previously enabled.<br/> |
| [Get Partition Backup Configuration Info](sfclient-v82-api-getpartitionbackupconfigurationinfo.md) | Gets the partition backup configuration information<br/> |
| [Get Partition Backup List](sfclient-v82-api-getpartitionbackuplist.md) | Gets the list of backups available for the specified partition.<br/> |
| [Suspend Partition Backup](sfclient-v82-api-suspendpartitionbackup.md) | Suspends periodic backup for the specified partition.<br/> |
| [Resume Partition Backup](sfclient-v82-api-resumepartitionbackup.md) | Resumes periodic backup of partition which was previously suspended.<br/> |
| [Backup Partition](sfclient-v82-api-backuppartition.md) | Triggers backup of the partition's state.<br/> |
| [Get Partition Backup Progress](sfclient-v82-api-getpartitionbackupprogress.md) | Gets details for the latest backup triggered for this partition.<br/> |
| [Restore Partition](sfclient-v82-api-restorepartition.md) | Triggers restore of the state of the partition using the specified restore partition description.<br/> |
| [Get Partition Restore Progress](sfclient-v82-api-getpartitionrestoreprogress.md) | Gets details for the latest restore operation triggered for this partition.<br/> |
| [Get Backups From Backup Location](sfclient-v82-api-getbackupsfrombackuplocation.md) | Gets the list of backups available for the specified backed up entity at the specified backup location.<br/> |

