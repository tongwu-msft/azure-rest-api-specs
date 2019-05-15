---
title: "DiagnosticsDescription"
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
# DiagnosticsDescription

Describes the diagnostics options available

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`sinks`](#sinks) | array of [DiagnosticsSinkProperties](sfmeshrp-model-diagnosticssinkproperties.md) | No |
| [`enabled`](#enabled) | boolean | No |
| [`defaultSinkRefs`](#defaultsinkrefs) | array of string | No |

____
### `sinks`
__Type__: array of [DiagnosticsSinkProperties](sfmeshrp-model-diagnosticssinkproperties.md) <br/>
__Required__: No<br/>
<br/>
List of supported sinks that can be referenced.

____
### `enabled`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Status of whether or not sinks are enabled.

____
### `defaultSinkRefs`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
The sinks to be used if diagnostics is enabled. Sink choices can be overridden at the service and code package level.
