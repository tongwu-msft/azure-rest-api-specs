---
title: "Understand container labels and how to use them"
description: Learn how to leverage container label properties in Service Fabric Mesh Resource Manager and explore its runtime properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore container labels, their properties and how to use them

Describes a container label.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`value`](#value) | string | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the container label.

____
### `value`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The value of the container label.
