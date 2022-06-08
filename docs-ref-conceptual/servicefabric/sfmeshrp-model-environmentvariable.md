---
title: "EnvironmentVariable"
description: Describes an environment variable for containers and includes names, types, and requirement statuses for the name and value properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# EnvironmentVariable

Describes an environment variable for the container.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`value`](#value) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the environment variable.

____
### `value`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The value of the environment variable.
