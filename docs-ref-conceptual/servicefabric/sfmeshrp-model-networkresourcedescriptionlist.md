---
title: "NetworkResourceDescriptionList"
description: Describes the network resource description list and provides the names, types, and requirement statuses for the value and nextLink properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# NetworkResourceDescriptionList

A pageable list of network resources.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | array of [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) | No |
| [`nextLink`](#nextlink) | string | No |

____
### `value`
__Type__: array of [NetworkResourceDescription](sfmeshrp-model-networkresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
URI to fetch the next page of the list.
