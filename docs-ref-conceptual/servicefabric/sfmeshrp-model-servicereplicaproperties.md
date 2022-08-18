---
title: "ServiceReplicaProperties"
description: Describes the properties of a service replica and provides the names, types, and requirement statuses of the available properties.
services: service-fabric-mesh
author: vipulm
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Service Fabric Mesh ServiceReplicaProperties

Describes the properties of a service replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`osType`](#ostype) | string (enum) | Yes |
| [`codePackages`](#codepackages) | array of [ContainerCodePackageProperties](sfmeshrp-model-containercodepackageproperties.md) | Yes |
| [`networkRefs`](#networkrefs) | array of [NetworkRef](sfmeshrp-model-networkref.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfmeshrp-model-diagnosticsref.md) | No |

____
### `osType`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
The Operating system type required by the code in service.





____
### `codePackages`
__Type__: array of [ContainerCodePackageProperties](sfmeshrp-model-containercodepackageproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the set of code packages that forms the service. A code package describes the container and the properties for running it. All the code packages are started together on the same host and share the same context (network, process etc.).


____
### `networkRefs`
__Type__: array of [NetworkRef](sfmeshrp-model-networkref.md) <br/>
__Required__: No<br/>
<br/>
The names of the private networks that this service needs to be part of.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfmeshrp-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.
