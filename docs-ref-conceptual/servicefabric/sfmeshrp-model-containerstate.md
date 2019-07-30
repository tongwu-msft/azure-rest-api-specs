---
title: "ContainerState"
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
# ContainerState

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
