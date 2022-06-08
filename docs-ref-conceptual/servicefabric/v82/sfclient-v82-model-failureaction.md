---
title: "FailureAction v82"
description: "FailureAction v82"
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
# FailureAction enum v82

type: string

The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.
Invalid indicates the failure action is invalid. Rollback specifies that the upgrade will start rolling back automatically.
Manual indicates that the upgrade will switch to UnmonitoredManual upgrade mode.


Possible values are: 

  - `Invalid` - Indicates the failure action is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Rollback` - The upgrade will start rolling back automatically. The value is 1
  - `Manual` - The upgrade will switch to UnmonitoredManual upgrade mode. The value is 2

