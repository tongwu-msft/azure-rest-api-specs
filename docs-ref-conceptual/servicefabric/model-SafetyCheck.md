---
title: "SafetyCheck"
ms.date: "2017-04-27"
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
# SafetyCheck

Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.
# Inheritance

The type 'SafetyCheck' is a base type of the polymorphic type model with property 'Kind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| EnsureSeedNodeQuorum | [SeedNodeSafetyCheck](model-SeedNodeSafetyCheck.md) |
| EnsureAvailability | [EnsureAvailabilitySafetyCheck](model-EnsureAvailabilitySafetyCheck.md) |
| EnsurePartitionQuorum | [EnsurePartitionQurumSafetyCheck](model-EnsurePartitionQurumSafetyCheck.md) |
| WaitForInbuildReplica | [WaitForInbuildReplicaSafetyCheck](model-WaitForInbuildReplicaSafetyCheck.md) |
| WaitForPrimaryPlacement | [WaitForPrimaryPlacementSafetyCheck](model-WaitForPrimaryPlacementSafetyCheck.md) |
| WaitForPrimarySwap | [WaitForPrimarySwapSafetyCheck](model-WaitForPrimarySwapSafetyCheck.md) |
| WaitForReconfiguration | [WaitForReconfigurationSafetyCheck](model-WaitForReconfigurationSafetyCheck.md) |

