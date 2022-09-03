---
title: "Understand Application Resource Description List"
description: Learn about application resource description list, which is a pageable list of application resources in Service Fabric Mesh API resource manager.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore Application Resource Description List and its properties

A pageable list of application resources.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | array of [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) | No |
| [`nextLink`](#nextlink) | string | No |

____
### `value`
__Type__: array of [ApplicationResourceDescription](sfmeshrp-model-applicationresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
URI to fetch the next page of the list.
