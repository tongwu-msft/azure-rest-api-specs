---
title: "UpgradeDomainState v82"
description: "UpgradeDomainState v82"
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
# UpgradeDomainState enum v82

type: string

The state of the upgrade domain.

Possible values are: 

  - `Invalid` - Indicates the upgrade domain state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Pending` - The upgrade domain has not started upgrading yet. The value is 1
  - `InProgress` - The upgrade domain is being upgraded but not complete yet. The value is 2
  - `Completed` - The upgrade domain has completed upgrade. The value is 3

