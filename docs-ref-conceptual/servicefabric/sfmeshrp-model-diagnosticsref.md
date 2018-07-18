---
title: "DiagnosticsRef"
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
# DiagnosticsRef

Reference to sinks in DiagnosticsDescription.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`enabled`](#enabled) | boolean | No |
| [`sinkRefs`](#sinkrefs) | array of string | No |

____
### `enabled`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Status of whether or not sinks are enabled.

____
### `sinkRefs`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
List of sinks to be used if enabled. References the list of sinks in DiagnosticsDescription.
