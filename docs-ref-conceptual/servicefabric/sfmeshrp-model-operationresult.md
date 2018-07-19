---
title: "OperationResult"
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
# OperationResult

List of operations available at the listed Azure resource provider.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`display`](#display) | [AvailableOperationDisplay](sfmeshrp-model-availableoperationdisplay.md) | No |
| [`origin`](#origin) | string | No |
| [`nextLink`](#nextlink) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the operation.

____
### `display`
__Type__: [AvailableOperationDisplay](sfmeshrp-model-availableoperationdisplay.md) <br/>
__Required__: No<br/>
<br/>
The object that represents the operation.

____
### `origin`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Origin result

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The URL to use for getting the next set of results.
