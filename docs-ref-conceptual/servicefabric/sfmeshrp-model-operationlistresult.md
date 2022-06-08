---
title: Service Fabric Operations Request Result
description: Describes the result of the request to list service fabric operations and provides the available properties for the operation list result.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Service Fabric Operations Request Result

Describes the result of the request to list Service Fabric operations.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | array of [OperationResult](sfmeshrp-model-operationresult.md) | No |
| [`nextLink`](#nextlink) | string | No |

____
### `value`
__Type__: array of [OperationResult](sfmeshrp-model-operationresult.md) <br/>
__Required__: No<br/>
<br/>
List of Service Fabric operations supported by the Microsoft.ServiceFabric resource provider.

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
URL to get the next set of operation list results if there are any.
