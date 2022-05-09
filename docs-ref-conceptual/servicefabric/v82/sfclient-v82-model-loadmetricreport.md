---
title: "LoadMetricReport v82"
description: "LoadMetricReport v82"
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
# LoadMetricReport v82

Represents the load metric report which contains the time metric was reported, its name and value.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`LastReportedUtc`](#lastreportedutc) | string (date-time) | No |
| [`Name`](#name) | string | No |
| [`Value`](#value) | string (int32) | No |
| [`CurrentValue`](#currentvalue) | string (double) | No |

____
### `LastReportedUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Gets the UTC time when the load was reported.

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the load metric.

____
### `Value`
__Type__: string (int32) <br/>
__Required__: No<br/>
<br/>
The value of the load metric. In future releases of Service Fabric this parameter will be deprecated in favor of CurrentValue.

____
### `CurrentValue`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The value of the load metric.
