---
title: "EndpointProperties"
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
# EndpointProperties

Describes a container endpoint.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`port`](#port) | integer | No |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the endpoint.

____
### `port`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Port used by the container.
