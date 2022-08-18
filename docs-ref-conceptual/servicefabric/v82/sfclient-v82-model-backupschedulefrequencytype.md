---
title: "BackupScheduleFrequencyType v82"
description: "BackupScheduleFrequencyType v82"
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
# BackupScheduleFrequencyType enum v82

type: string

Describes the frequency with which to run the time based backup schedule.


Possible values are: 

  - `Invalid` - Indicates an invalid backup schedule frequency type. All Service Fabric enumerations have the invalid type.
  - `Daily` - Indicates that the time based backup schedule is repeated at a daily frequency.
  - `Weekly` - Indicates that the time based backup schedule is repeated at a weekly frequency.

