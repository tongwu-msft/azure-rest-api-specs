---
title: "ReconfigurationType"
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
# ReconfigurationType enum

type: string

The type of reconfiguration for replica of a stateful service.

Possible values are: 

  - Unknown - Indicates the invalid reconfiguration type.
  - SwapPrimary - Specifies that the primary replica is being swapped with a different replica.
  - Failover - Reconfiguration triggered in response to a primary going down. This could be due to many reasons such as primary replica crashing etc.
  - Other - Reconfigurations where the primary replica is not changing.

