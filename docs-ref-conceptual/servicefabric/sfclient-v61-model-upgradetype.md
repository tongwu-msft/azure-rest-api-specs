---
title: "UpgradeType"
ms.date: "2018-01-22"
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
# UpgradeType enum

type: string

The type of upgrade out of the following possible values.

Possible values are: 

  - Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Rolling - The upgrade progresses one upgrade domain at a time. The value is 1.
  - Rolling_ForceRestart - The upgrade gets restarted by force. The value is 2.

