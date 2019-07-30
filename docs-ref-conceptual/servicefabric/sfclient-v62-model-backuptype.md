---
title: "BackupType"
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
# BackupType enum

type: string

Describes the type of backup, whether its full or incremental.


Possible values are: 

  - `Invalid` - Indicates an invalid backup type. All Service Fabric enumerations have the invalid type.
  - `Full` - Indicates a full backup.
  - `Incremental` - Indicates an incremental backup. A backup chain is comprised of a full backup followed by 0 or more incremental backups.

