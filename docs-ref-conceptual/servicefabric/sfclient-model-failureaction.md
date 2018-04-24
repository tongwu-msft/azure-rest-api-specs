---
title: "FailureAction"
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
# FailureAction enum

type: string

The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.

Possible values are: 

  - Invalid - Indicates the failure action is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Rollback - The upgrade will start rolling back automatically. The value is 1
  - Manual - The upgrade will switch to UnmonitoredManual upgrade mode. The value is 2

