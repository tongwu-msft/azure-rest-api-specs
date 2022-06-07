---
title: "SafetyCheck v82"
description: "SafetyCheck v82"
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
# SafetyCheck v82

Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.
## Inheritance

'SafetyCheck' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| EnsureSeedNodeQuorum | [SeedNodeSafetyCheck](sfclient-v82-model-seednodesafetycheck.md) |
| EnsureAvailability | [EnsureAvailabilitySafetyCheck](sfclient-v82-model-ensureavailabilitysafetycheck.md) |
| EnsurePartitionQuorum | [EnsurePartitionQuorumSafetyCheck](sfclient-v82-model-ensurepartitionquorumsafetycheck.md) |
| WaitForInbuildReplica | [WaitForInbuildReplicaSafetyCheck](sfclient-v82-model-waitforinbuildreplicasafetycheck.md) |
| WaitForPrimaryPlacement | [WaitForPrimaryPlacementSafetyCheck](sfclient-v82-model-waitforprimaryplacementsafetycheck.md) |
| WaitForPrimarySwap | [WaitForPrimarySwapSafetyCheck](sfclient-v82-model-waitforprimaryswapsafetycheck.md) |
| WaitForReconfiguration | [WaitForReconfigurationSafetyCheck](sfclient-v82-model-waitforreconfigurationsafetycheck.md) |

