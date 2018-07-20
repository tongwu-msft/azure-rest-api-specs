---
title: "ScalingMechanismKind"
ms.date: "2018-07-20"
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
# ScalingMechanismKind enum

type: string

Enumerates the ways that a service can be scaled.

Possible values are: 

  - `Invalid` - Indicates the scaling mechanism is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `PartitionInstanceCount` - Indicates a mechanism for scaling where new instances are added or removed from a partition. The value is 1.
  - `AddRemoveIncrementalNamedPartition` - Indicates a mechanism for scaling where new named partitions are added or removed from a service. The value is 2.

