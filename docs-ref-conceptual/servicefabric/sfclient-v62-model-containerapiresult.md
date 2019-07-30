---
title: "ContainerApiResult"
ms.date: "2018-04-23"
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
# ContainerApiResult

Container API result.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Status`](#status) | integer | Yes |
| [`Content-Type`](#content-type) | string | No |
| [`Content-Encoding`](#content-encoding) | string | No |
| [`Body`](#body) | string | No |

____
### `Status`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
HTTP status code returned by the target container API

____
### `Content-Type`
__Type__: string <br/>
__Required__: No<br/>
<br/>
HTTP content type

____
### `Content-Encoding`
__Type__: string <br/>
__Required__: No<br/>
<br/>
HTTP content encoding

____
### `Body`
__Type__: string <br/>
__Required__: No<br/>
<br/>
container API result body
