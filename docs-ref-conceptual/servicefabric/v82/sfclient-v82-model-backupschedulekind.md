---
title: "BackupScheduleKind v82"
description: "BackupScheduleKind v82"
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
# BackupScheduleKind enum v82

type: string

The kind of backup schedule, time based or frequency based.


Possible values are: 

  - `Invalid` - Indicates an invalid backup schedule kind. All Service Fabric enumerations have the invalid type.
  - `TimeBased` - Indicates a time-based backup schedule.
  - `FrequencyBased` - Indicates a frequency-based backup schedule.

