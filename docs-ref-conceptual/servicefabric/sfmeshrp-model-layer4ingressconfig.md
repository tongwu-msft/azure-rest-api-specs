---
title: "Layer4IngressConfig"
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
# Layer4IngressConfig

Describes the layer4 configuration for public connectivity for this network.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`publicPort`](#publicport) | integer | No |
| [`applicationName`](#applicationname) | string | No |
| [`serviceName`](#servicename) | string | No |
| [`endpointName`](#endpointname) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Layer4 ingress config name.

____
### `publicPort`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Specifies the public port at which the service endpoint below needs to be exposed.

____
### `applicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application name which contains the service to be exposed.

____
### `serviceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The service whose endpoint needs to be exposed at the public port.

____
### `endpointName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The service endpoint that needs to be exposed.
