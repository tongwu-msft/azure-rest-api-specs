---
title: "DiagnosticsSinkProperties"
description: Service Fabric Mesh Resource Manager API Reference
services: service-fabric-mesh
author: VipulM-MSFT
ms.date: "2018-07-17"
ms.prod: "azure"
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# DiagnosticsSinkProperties

Properties of a DiagnosticsSink.
# Inheritance

'DiagnosticsSinkProperties' is the base type of the polymorphic type model. The 'kind' property is the discriminator for the derived types. 
The value of the 'kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| kind | Derived Type |
| --- | --- | 
| AzureInternalMonitoringPipeline | [AzureInternalMonitoringPipelineSinkDescription](sfmeshrp-model-azureinternalmonitoringpipelinesinkdescription.md) |

