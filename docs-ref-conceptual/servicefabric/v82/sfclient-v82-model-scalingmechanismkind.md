---
title: "ScalingMechanismKind v82"
description: "ScalingMechanismKind v82"
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
# ScalingMechanismKind enum v82

type: string

Enumerates the ways that a service can be scaled.

Possible values are: 

  - `Invalid` - Indicates the scaling mechanism is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `PartitionInstanceCount` - Indicates a mechanism for scaling where new instances are added or removed from a partition. The value is 1.
  - `AddRemoveIncrementalNamedPartition` - Indicates a mechanism for scaling where new named partitions are added or removed from a service. The value is 2.

