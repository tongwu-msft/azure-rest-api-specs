---
title: "ChaosScheduleStatus"
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
# ChaosScheduleStatus enum

type: string

Current status of the schedule.


Possible values are: 

  - `Invalid` - Indicates an invalid Chaos Schedule status. All Service Fabric enumerations have the invalid type. The valus is zero.
  - `Stopped` - Indicates that the schedule is stopped and not being used to schedule runs of chaos. The value is one.
  - `Active` - Indicates that the schedule is active and is being used to schedule runs of Chaos. The value is two.
  - `Expired` - Indicates that the schedule is expired and will no longer be used to schedule runs of Chaos. The value is three.
  - `Pending` - Indicates that the schedule is pending and is not yet being used to schedule runs of Chaos but will be used when the start time is passed. The value is four.

