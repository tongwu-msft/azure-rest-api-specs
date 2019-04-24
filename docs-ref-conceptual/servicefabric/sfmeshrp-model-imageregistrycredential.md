---
title: "ImageRegistryCredential"
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
# ImageRegistryCredential

Image registry credential.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`server`](#server) | string | Yes |
| [`username`](#username) | string | Yes |
| [`password`](#password) | string | No |

____
### `server`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Docker image registry server, without protocol such as `http` and `https`.

____
### `username`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The username for the private registry.

____
### `password`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The password for the private registry.
