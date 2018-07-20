---
title: "UpgradeMode"
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
# UpgradeMode enum

type: string

The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.

Possible values are: 

  - `Invalid` - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `UnmonitoredAuto` - The upgrade will proceed automatically without performing any health monitoring. The value is 1
  - `UnmonitoredManual` - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
  - `Monitored` - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3

