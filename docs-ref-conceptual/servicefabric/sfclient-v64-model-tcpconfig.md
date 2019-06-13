---
title: "TcpConfig"
ms.date: "2018-11-26"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# TcpConfig

Describes the tcp configuration for external connectivity for this network.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`port`](#port) | integer | Yes |
| [`destination`](#destination) | [GatewayDestination](sfclient-v64-model-gatewaydestination.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
tcp gateway config name.

____
### `port`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Specifies the port at which the service endpoint below needs to be exposed.

____
### `destination`
__Type__: [GatewayDestination](sfclient-v64-model-gatewaydestination.md) <br/>
__Required__: Yes<br/>
<br/>
Describes destination endpoint for routing traffic.
