---
title: "HttpRouteMatchHeader v82"
description: "HttpRouteMatchHeader v82"
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
# HttpRouteMatchHeader v82

Describes header information for http route matching.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`value`](#value) | string | No |
| [`type`](#type) | string (enum) | No |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of header to match in request.

____
### `value`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value of header to match in request.

____
### `type`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
how to match header value



