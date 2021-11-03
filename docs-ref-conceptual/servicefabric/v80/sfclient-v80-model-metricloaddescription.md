---
title: "MetricLoadDescription v80"
description: "MetricLoadDescription v80"
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
# MetricLoadDescription v80

Specifies metric load information.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`MetricName`](#metricname) | string | No |
| [`CurrentLoad`](#currentload) | integer (int64) | No |
| [`PredictedLoad`](#predictedload) | integer (int64) | No |

____
### `MetricName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the reported metric.

____
### `CurrentLoad`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The current value of the metric load.

____
### `PredictedLoad`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The predicted value of the metric load.
