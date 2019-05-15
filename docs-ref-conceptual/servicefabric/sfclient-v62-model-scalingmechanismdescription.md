---
title: "ScalingMechanismDescription"
ms.date: "2018-04-23"
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
# ScalingMechanismDescription

Describes the mechanism for performing a scaling operation.
# Inheritance

'ScalingMechanismDescription' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| PartitionInstanceCount | [PartitionInstanceCountScaleMechanism](sfclient-v62-model-partitioninstancecountscalemechanism.md) |
| AddRemoveIncrementalNamedPartition | [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v62-model-addremoveincrementalnamedpartitionscalingmechanism.md) |

