---
title: "ContainerVolume"
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
# ContainerVolume

Describes how a volume is attached to a container.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`readOnly`](#readonly) | boolean | No |
| [`destinationPath`](#destinationpath) | string | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the volume.

____
### `readOnly`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
The flag indicating whether the volume is read only. Default is 'false'.

____
### `destinationPath`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The path within the container at which the volume should be mounted. Only valid path characters are allowed.
