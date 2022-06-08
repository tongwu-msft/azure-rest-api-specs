---
title: "ResourceLimits"
description: Describes the resource limits for a given container and provides the property name, types, and requirement statuses for resource limits.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# ResourceLimits

This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`memoryInGB`](#memoryingb) | number (double) | No |
| [`cpu`](#cpu) | number (double) | No |

____
### `memoryInGB`
__Type__: number (double) <br/>
__Required__: No<br/>
<br/>
The memory limit in GB.

____
### `cpu`
__Type__: number (double) <br/>
__Required__: No<br/>
<br/>
CPU limits in cores. At present, only full cores are supported.
