---
title: "HealthStateCount"
ms.date: "2018-07-20"
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
# HealthStateCount

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
