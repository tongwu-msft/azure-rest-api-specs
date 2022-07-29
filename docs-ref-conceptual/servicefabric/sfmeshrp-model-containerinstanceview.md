---
title: "Understand how to use a container instance view"
description: Learn how to leverage a container instance view in Service Fabric Mesh Resource Manager and explore its runtime properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore the Container Instance View

Runtime information of a container instance.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`restartCount`](#restartcount) | integer | No |
| [`currentState`](#currentstate) | [ContainerState](sfmeshrp-model-containerstate.md) | No |
| [`previousState`](#previousstate) | [ContainerState](sfmeshrp-model-containerstate.md) | No |
| [`events`](#events) | array of [ContainerEvent](sfmeshrp-model-containerevent.md) | No |

____
### `restartCount`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The number of times the container has been restarted.

____
### `currentState`
__Type__: [ContainerState](sfmeshrp-model-containerstate.md) <br/>
__Required__: No<br/>
<br/>
Current container instance state.

____
### `previousState`
__Type__: [ContainerState](sfmeshrp-model-containerstate.md) <br/>
__Required__: No<br/>
<br/>
Previous container instance state.

____
### `events`
__Type__: array of [ContainerEvent](sfmeshrp-model-containerevent.md) <br/>
__Required__: No<br/>
<br/>
The events of this container instance.
