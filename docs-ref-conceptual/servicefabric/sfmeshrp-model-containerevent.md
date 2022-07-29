---
title: "Understand how to use a Container Event"
description: Learn how to leverage a Container Event in Service Fabric Mesh Resource Manager and explore its runtime properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore container event and their properties

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
