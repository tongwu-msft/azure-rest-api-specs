---
title: "BackupType v82"
description: "BackupType v82"
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
# BackupType enum v82

type: string

Describes the type of backup, whether its full or incremental.


Possible values are: 

  - `Invalid` - Indicates an invalid backup type. All Service Fabric enumerations have the invalid type.
  - `Full` - Indicates a full backup.
  - `Incremental` - Indicates an incremental backup. A backup chain is comprised of a full backup followed by 0 or more incremental backups.

