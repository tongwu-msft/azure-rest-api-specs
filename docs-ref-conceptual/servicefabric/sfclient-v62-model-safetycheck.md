---
title: "SafetyCheck"
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
# SafetyCheck

Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.
# Inheritance

'SafetyCheck' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| EnsureSeedNodeQuorum | [SeedNodeSafetyCheck](sfclient-v62-model-seednodesafetycheck.md) |
| EnsureAvailability | [EnsureAvailabilitySafetyCheck](sfclient-v62-model-ensureavailabilitysafetycheck.md) |
| EnsurePartitionQuorum | [EnsurePartitionQurumSafetyCheck](sfclient-v62-model-ensurepartitionqurumsafetycheck.md) |
| WaitForInbuildReplica | [WaitForInbuildReplicaSafetyCheck](sfclient-v62-model-waitforinbuildreplicasafetycheck.md) |
| WaitForPrimaryPlacement | [WaitForPrimaryPlacementSafetyCheck](sfclient-v62-model-waitforprimaryplacementsafetycheck.md) |
| WaitForPrimarySwap | [WaitForPrimarySwapSafetyCheck](sfclient-v62-model-waitforprimaryswapsafetycheck.md) |
| WaitForReconfiguration | [WaitForReconfigurationSafetyCheck](sfclient-v62-model-waitforreconfigurationsafetycheck.md) |

