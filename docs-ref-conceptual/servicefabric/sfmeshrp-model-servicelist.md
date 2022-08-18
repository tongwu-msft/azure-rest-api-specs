---
title: "ServiceList"
description: Describes the list of all services in an application and provides the names, types, and requirement statuses for the value and nextLink properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# ServiceList

A pageable list of all services in an application.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | array of [ServiceResourceDescription](sfmeshrp-model-serviceresourcedescription.md) | No |
| [`nextLink`](#nextlink) | string | No |

____
### `value`
__Type__: array of [ServiceResourceDescription](sfmeshrp-model-serviceresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
URI to fetch the next page of the list.
