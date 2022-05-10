---
title: "ScalingTriggerKind v82"
description: "ScalingTriggerKind v82"
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
# ScalingTriggerKind enum v82

type: string

Enumerates the ways that a service can be scaled.

Possible values are: 

  - `Invalid` - Indicates the scaling trigger is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `AveragePartitionLoad` - Indicates a trigger where scaling decisions are made based on average load of a partition. The value is 1.
  - `AverageServiceLoad` - Indicates a trigger where scaling decisions are made based on average load of a service. The value is 2.

