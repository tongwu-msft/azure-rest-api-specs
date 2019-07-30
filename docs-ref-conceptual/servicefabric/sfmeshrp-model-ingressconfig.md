---
title: "IngressConfig"
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
# IngressConfig

Describes public connectivity configuration for the network.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`qosLevel`](#qoslevel) | string (enum) | No |
| [`layer4`](#layer4) | array of [Layer4IngressConfig](sfmeshrp-model-layer4ingressconfig.md) | No |
| [`publicIPAddress`](#publicipaddress) | string | No |

____
### `qosLevel`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The QoS tier for ingress.




____
### `layer4`
__Type__: array of [Layer4IngressConfig](sfmeshrp-model-layer4ingressconfig.md) <br/>
__Required__: No<br/>
<br/>
Configuration for layer4 public connectivity for this network.

____
### `publicIPAddress`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The public IP address for reaching this network.
