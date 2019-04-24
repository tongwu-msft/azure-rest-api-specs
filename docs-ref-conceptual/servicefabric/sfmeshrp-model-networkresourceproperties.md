---
title: "NetworkResourceProperties"
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
# NetworkResourceProperties

Describes properties of a network resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`provisioningState`](#provisioningstate) | string | No |
| [`description`](#description) | string | No |
| [`addressPrefix`](#addressprefix) | string | Yes |
| [`ingressConfig`](#ingressconfig) | [IngressConfig](sfmeshrp-model-ingressconfig.md) | No |

____
### `provisioningState`
__Type__: string <br/>
__Required__: No<br/>
<br/>
State of the resource.

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the network.

____
### `addressPrefix`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
the address prefix for this network.

____
### `ingressConfig`
__Type__: [IngressConfig](sfmeshrp-model-ingressconfig.md) <br/>
__Required__: No<br/>
<br/>
Describes public connectivity configuration for the network.
