---
title: "ReconfigurationType v82"
description: "ReconfigurationType v82"
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
# ReconfigurationType enum v82

type: string

The type of reconfiguration for replica of a stateful service.

Possible values are: 

  - `Unknown` - Indicates the invalid reconfiguration type.
  - `SwapPrimary` - Specifies that the primary replica is being swapped with a different replica.
  - `Failover` - Reconfiguration triggered in response to a primary going down. This could be due to many reasons such as primary replica crashing etc.
  - `Other` - Reconfigurations where the primary replica is not changing.

