---
title: "GatewayResourceDescription"
ms.date: 11/26/2018
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# GatewayResourceDescription

This type describes a gateway resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`properties`](#properties) | [GatewayProperties](sfclient-v64-model-gatewayproperties.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the Gateway resource.

____
### `properties`
__Type__: [GatewayProperties](sfclient-v64-model-gatewayproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes properties of a gateway resource.
