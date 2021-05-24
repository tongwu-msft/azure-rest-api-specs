---
title: "BackupState"
ms.date: 06/12/2019
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
# BackupState enum

type: string

Represents the current state of the partition backup operation.


Possible values are: 

  - `Invalid` - Indicates an invalid backup state. All Service Fabric enumerations have the invalid type.
  - `Accepted` - Operation has been validated and accepted. Backup is yet to be triggered.
  - `BackupInProgress` - Backup operation has been triggered and is under process.
  - `Success` - Operation completed with success.
  - `Failure` - Operation completed with failure.
  - `Timeout` - Operation timed out.

