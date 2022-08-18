---
title: "EndpointProperties"
description: Describes a container endpoint for endpoint properties and provides the names, types, and requirements statuses for the name and port properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
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
