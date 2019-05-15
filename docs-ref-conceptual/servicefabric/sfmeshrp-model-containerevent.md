---
title: "ContainerEvent"
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
# ContainerEvent

A container event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`count`](#count) | integer | No |
| [`firstTimestamp`](#firsttimestamp) | string | No |
| [`lastTimestamp`](#lasttimestamp) | string | No |
| [`message`](#message) | string | No |
| [`type`](#type) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the container event.

____
### `count`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The count of the event.

____
### `firstTimestamp`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Date/time of the first event.

____
### `lastTimestamp`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Date/time of the last event.

____
### `message`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The event message

____
### `type`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The event type.
