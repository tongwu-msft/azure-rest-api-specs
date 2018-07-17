---
title: "ServiceReplicaList"
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
# ServiceReplicaList

A pageable list of replicas of a service resource.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | array of [ServiceReplicaDescription](sfmeshrp-model-servicereplicadescription.md) | No |
| [`nextLink`](#nextlink) | string | No |

____
### `value`
__Type__: array of [ServiceReplicaDescription](sfmeshrp-model-servicereplicadescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.

____
### `nextLink`
__Type__: string <br/>
__Required__: No<br/>
<br/>
URI to fetch the next page of the list.
