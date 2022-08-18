---
title: "VolumeResourceDescriptionList"
description: Describe the volume resource description list and provides the names, types, and requirement statuses of properties for the list of volume resources.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# VolumeResourceDescriptionList

A pageable list of volume resources.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | array of [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) | No |
| [`nextLink`](#nextlink) | string | No |

____
### `value`
__Type__: array of [VolumeResourceDescription](sfmeshrp-model-volumeresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
URI to fetch the next page of the list.
