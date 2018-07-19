---
title: "ServiceReplicaDescription"
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
# ServiceReplicaDescription

This type describes a replica of a service resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`osType`](#ostype) | string (enum) | Yes |
| [`codePackages`](#codepackages) | array of [ContainerCodePackageProperties](sfmeshrp-model-containercodepackageproperties.md) | Yes |
| [`networkRefs`](#networkrefs) | array of [NetworkRef](sfmeshrp-model-networkref.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfmeshrp-model-diagnosticsref.md) | No |
| [`replicaName`](#replicaname) | string | No |

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

____
### `replicaName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the replica.
