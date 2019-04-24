---
title: "AvailableOperationDisplay"
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
# AvailableOperationDisplay

An operation available at the listed Azure resource provider.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`provider`](#provider) | string | No |
| [`resource`](#resource) | string | No |
| [`operation`](#operation) | string | No |
| [`description`](#description) | string | No |

____
### `provider`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the operation provider.

____
### `resource`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the resource on which the operation is available.

____
### `operation`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the available operation.

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Description of the available operation.
