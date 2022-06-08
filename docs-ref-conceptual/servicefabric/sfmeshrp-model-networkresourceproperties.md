---
title: "NetworkResourceProperties"
description: Describes the properties of a network resource and provides the names, types, and requirement statuses for all available properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
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
