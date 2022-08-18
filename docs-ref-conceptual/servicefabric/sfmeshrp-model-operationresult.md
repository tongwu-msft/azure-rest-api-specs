---
title: "OperationResult"
description: Describe the list of operations available at the listed Azure resource provider and provides the available properties for the operation results.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
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
