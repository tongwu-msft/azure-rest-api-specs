---
title: "ServiceHostUpgradeImpact v82"
description: "ServiceHostUpgradeImpact v82"
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
# ServiceHostUpgradeImpact enum v82

type: string

The expected impact of the upgrade.

Possible values are: 

  - `Invalid` - Indicates the upgrade impact is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `None` - The upgrade is not expected to cause service host restarts. The value is 1.
  - `ServiceHostRestart` - The upgrade is expected to cause a service host restart. The value is 2.
  - `UnexpectedServiceHostRestart` - The upgrade will cause an unexpected service host restart. This indicates a bug in the Service Fabric runtime and proceeding with an upgrade with this impact may lead to skipped safety checks. Running the upgrade with the ForceRestart flag will force proper safety checks. The value is 3.

