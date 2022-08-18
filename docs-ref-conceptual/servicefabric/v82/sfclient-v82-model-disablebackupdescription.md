---
title: "DisableBackupDescription v82"
description: "DisableBackupDescription v82"
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
# DisableBackupDescription v82

It describes the body parameters while disabling backup of a backup entity(Application/Service/Partition).

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`CleanBackup`](#cleanbackup) | boolean | Yes |

____
### `CleanBackup`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Boolean flag to delete backups. It can be set to true for deleting all the backups which were created for the backup entity that is getting disabled for backup.
