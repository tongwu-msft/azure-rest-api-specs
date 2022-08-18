---
title: "ChaosStatus v82"
description: "ChaosStatus v82"
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
# ChaosStatus enum v82

type: string

Current status of the Chaos run.


Possible values are: 

  - `Invalid` - Indicates an invalid Chaos status. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Running` - Indicates that Chaos is not stopped. The value is one.
  - `Stopped` - Indicates that Chaos is not scheduling further faults. The value is two.

