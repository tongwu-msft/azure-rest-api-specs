---
title: "HttpRouteMatchPath v82"
description: "HttpRouteMatchPath v82"
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
# HttpRouteMatchPath v82

Path to match for routing.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`value`](#value) | string | Yes |
| [`rewrite`](#rewrite) | string | No |
| [`type`](#type) | string | Yes |

____
### `value`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Uri path to match for request.

____
### `rewrite`
__Type__: string <br/>
__Required__: No<br/>
<br/>
replacement string for matched part of the Uri.

____
### `type`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `prefix` <br/>
<br/>
how to match value in the Uri
