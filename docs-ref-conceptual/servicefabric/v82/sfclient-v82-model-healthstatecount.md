---
title: "HealthStateCount v82"
description: "HealthStateCount v82"
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
# HealthStateCount v82

Represents information about how many health entities are in Ok, Warning and Error health state.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`OkCount`](#okcount) | integer (int64) | No |
| [`WarningCount`](#warningcount) | integer (int64) | No |
| [`ErrorCount`](#errorcount) | integer (int64) | No |

____
### `OkCount`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The number of health entities with aggregated health state Ok.

____
### `WarningCount`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The number of health entities with aggregated health state Warning.

____
### `ErrorCount`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The number of health entities with aggregated health state Error.
