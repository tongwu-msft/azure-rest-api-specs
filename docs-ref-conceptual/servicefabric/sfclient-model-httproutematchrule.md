---
title: "HttpRouteMatchRule"
ms.date: "2019-06-12"
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
# HttpRouteMatchRule

Describes a rule for http route matching.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`path`](#path) | [HttpRouteMatchPath](sfclient-model-httproutematchpath.md) | Yes |
| [`headers`](#headers) | array of [HttpRouteMatchHeader](sfclient-model-httproutematchheader.md) | No |

____
### `path`
__Type__: [HttpRouteMatchPath](sfclient-model-httproutematchpath.md) <br/>
__Required__: Yes<br/>
<br/>
Path to match for routing.

____
### `headers`
__Type__: array of [HttpRouteMatchHeader](sfclient-model-httproutematchheader.md) <br/>
__Required__: No<br/>
<br/>
headers and their values to match in request.
