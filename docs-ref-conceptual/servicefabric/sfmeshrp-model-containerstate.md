---
title: "Understand how to use Container state"
description: Learn how to leverage container state in Service Fabric Mesh Resource Manager and explore its runtime properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore the container state and its properties

The container state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`state`](#state) | string | No |
| [`startTime`](#starttime) | string (date-time) | No |
| [`exitCode`](#exitcode) | string | No |
| [`finishTime`](#finishtime) | string (date-time) | No |
| [`detailStatus`](#detailstatus) | string | No |

____
### `state`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The state of this container

____
### `startTime`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Date/time when the container state started.

____
### `exitCode`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The container exit code.

____
### `finishTime`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Date/time when the container state finished.

____
### `detailStatus`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Human-readable status of this state.
