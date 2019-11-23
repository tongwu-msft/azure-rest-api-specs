---
title: "AverageLoadScalingTrigger"
ms.date: "11/23/2019"
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
# AverageLoadScalingTrigger

Describes the average load trigger used for auto scaling.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`metric`](#metric) | [AutoScalingMetric](sfclient-model-autoscalingmetric.md) | Yes |
| [`lowerLoadThreshold`](#lowerloadthreshold) | number (double) | Yes |
| [`upperLoadThreshold`](#upperloadthreshold) | number (double) | Yes |
| [`scaleIntervalInSeconds`](#scaleintervalinseconds) | integer | Yes |

____
### `metric`
__Type__: [AutoScalingMetric](sfclient-model-autoscalingmetric.md) <br/>
__Required__: Yes<br/>
<br/>
Description of the metric that is used for scaling.

____
### `lowerLoadThreshold`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Lower load threshold (if average load is below this threshold, service will scale down).

____
### `upperLoadThreshold`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Upper load threshold (if average load is above this threshold, service will scale up).

____
### `scaleIntervalInSeconds`
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMinimum__: `60` <br/>
<br/>
Scale interval that indicates how often will this trigger be checked.
