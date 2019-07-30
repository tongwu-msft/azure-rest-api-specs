---
title: "VolumeResourceDescriptionList"
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
