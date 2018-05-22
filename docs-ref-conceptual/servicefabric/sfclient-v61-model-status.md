---
title: "Status"
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
# Status enum

type: string

Possible values include: 'Invalid', 'Running', 'Stopped'

Possible values are: 

  - Invalid - Indicates an invalid Chaos status. All Service Fabric enumerations have the invalid type.
  - Running - Indicates that Chaos is not stopped.
  - Stopped - Indicates that Chaos is not scheduling further faults.

