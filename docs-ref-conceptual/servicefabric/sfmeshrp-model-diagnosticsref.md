---
title: "Understand how to use Diagnostics Reference"
description: Learn how to leverage diagnostics reference in Service Fabric Mesh Resource Manager and explore its runtime properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore diagnostics reference

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
