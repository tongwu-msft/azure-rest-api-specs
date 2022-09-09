---
title: "Understand Available Operation Display and its properties"
description: Learn about Available Operation Display, which is an operation available at the listed Azure resource provider in Service Fabric Mesh API resource manager.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore Available Operation Display and its properties

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
