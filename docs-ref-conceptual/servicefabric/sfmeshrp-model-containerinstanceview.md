---
title: "ContainerInstanceView"
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
# ContainerInstanceView

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
