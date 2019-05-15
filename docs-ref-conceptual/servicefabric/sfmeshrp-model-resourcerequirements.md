---
title: "ResourceRequirements"
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
