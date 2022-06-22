---
title: "Diagnostics Sink Properties"
description: Describes the properties of a Diagnostics Sink, including a description of the inheritance and a list of the derived types.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Diagnostics Sink Properties

Properties of a DiagnosticsSink.
## Inheritance

'DiagnosticsSinkProperties' is the base type of the polymorphic type model. The 'kind' property is the discriminator for the derived types. 
The value of the 'kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| kind | Derived Type |
| --- | --- | 
| AzureInternalMonitoringPipeline | [AzureInternalMonitoringPipelineSinkDescription](sfmeshrp-model-azureinternalmonitoringpipelinesinkdescription.md) |

