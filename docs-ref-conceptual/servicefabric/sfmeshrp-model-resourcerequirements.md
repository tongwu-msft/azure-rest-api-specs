---
title: "ResourceRequirements"
description: Describes the resource requirements for a container or service and provides the names, types, and requirements statuses for the available properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# ResourceRequirements

This type describes the resource requirements for a container or a service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`requests`](#requests) | [ResourceRequests](sfmeshrp-model-resourcerequests.md) | Yes |
| [`limits`](#limits) | [ResourceLimits](sfmeshrp-model-resourcelimits.md) | No |

____
### `requests`
__Type__: [ResourceRequests](sfmeshrp-model-resourcerequests.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the requested resources for a given container.

____
### `limits`
__Type__: [ResourceLimits](sfmeshrp-model-resourcelimits.md) <br/>
__Required__: No<br/>
<br/>
Describes the maximum limits on the resources for a given container.
