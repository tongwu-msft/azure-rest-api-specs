---
title: "BackupScheduleFrequencyType"
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
# BackupScheduleFrequencyType enum

type: string

Describes the frequency with which to run the time based backup schedule.


Possible values are: 

  - `Invalid` - Indicates an invalid backup schedule frequency type. All Service Fabric enumerations have the invalid type.
  - `Daily` - Indicates that the time based backup schedule is repeated at a daily frequency.
  - `Weekly` - Indicates that the time based backup schedule is repeated at a weekly frequency.

