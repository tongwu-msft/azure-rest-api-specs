---
title: "HttpRouteConfig v82"
description: "HttpRouteConfig v82"
ms.date: "10/21/2020"
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
# HttpRouteConfig v82

Describes the hostname properties for http routing.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`match`](#match) | [HttpRouteMatchRule](sfclient-v82-model-httproutematchrule.md) | Yes |
| [`destination`](#destination) | [GatewayDestination](sfclient-v82-model-gatewaydestination.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
http route name.

____
### `match`
__Type__: [HttpRouteMatchRule](sfclient-v82-model-httproutematchrule.md) <br/>
__Required__: Yes<br/>
<br/>
Describes a rule for http route matching.

____
### `destination`
__Type__: [GatewayDestination](sfclient-v82-model-gatewaydestination.md) <br/>
__Required__: Yes<br/>
<br/>
Describes destination endpoint for routing traffic.
