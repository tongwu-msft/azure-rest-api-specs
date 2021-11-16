---
title: "UpgradeUnitState"
description: "UpgradeUnitState"
ms.date: "10/20/2021"
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
# UpgradeUnitState enum

type: string

The state of the upgrade unit.

Possible values are: 

  - `Invalid` - Indicates the upgrade unit state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Pending` - The upgrade unit has not started upgrading yet. The value is 1
  - `InProgress` - The upgrade unit is being upgraded but not complete yet. The value is 2
  - `Completed` - The upgrade unit has completed upgrade. The value is 3
  - `Failed` - The upgrade unit has failed to upgrade. The value is 4

