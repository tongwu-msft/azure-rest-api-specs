---
title: "NodeUpgradePhase"
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
# NodeUpgradePhase enum

type: string

The state of the upgrading node.

Possible values are: 

  - `Invalid` - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `PreUpgradeSafetyCheck` - The upgrade has not started yet due to pending safety checks. The value is 1
  - `Upgrading` - The upgrade is in progress. The value is 2
  - `PostUpgradeSafetyCheck` - The upgrade has completed and post upgrade safety checks are being performed. The value is 3

