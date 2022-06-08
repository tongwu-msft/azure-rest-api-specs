---
title: "NetworkProperties"
description: Describes the network and its properties and provides the names, types, and requirements statuses for the available properties.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# NetworkProperties

Describes a network.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`addressPrefix`](#addressprefix) | string | Yes |
| [`ingressConfig`](#ingressconfig) | [IngressConfig](sfmeshrp-model-ingressconfig.md) | No |

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
Configuration for public connectivity for this network.
