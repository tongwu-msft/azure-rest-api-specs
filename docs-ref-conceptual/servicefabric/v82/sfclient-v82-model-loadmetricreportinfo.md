---
title: "LoadMetricReportInfo v82"
description: "LoadMetricReportInfo v82"
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
# LoadMetricReportInfo v82

Information about load reported by replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`Value`](#value) | integer (int32) | No |
| [`CurrentValue`](#currentvalue) | string (double) | No |
| [`LastReportedUtc`](#lastreportedutc) | string (date-time) | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the metric.

____
### `Value`
__Type__: integer (int32) <br/>
__Required__: No<br/>
<br/>
The value of the load for the metric. In future releases of Service Fabric this parameter will be deprecated in favor of CurrentValue.

____
### `CurrentValue`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The double value of the load for the metric.

____
### `LastReportedUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The UTC time when the load is reported.
