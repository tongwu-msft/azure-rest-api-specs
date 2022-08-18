---
title: "HttpHostConfig v82"
description: "HttpHostConfig v82"
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
# HttpHostConfig v82

Describes the hostname properties for http routing.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`routes`](#routes) | array of [HttpRouteConfig](sfclient-v82-model-httprouteconfig.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
http hostname config name.

____
### `routes`
__Type__: array of [HttpRouteConfig](sfclient-v82-model-httprouteconfig.md) <br/>
__Required__: Yes<br/>
<br/>
Route information to use for routing. Routes are processed in the order they are specified. Specify routes that are more specific before routes that can handle general cases.
