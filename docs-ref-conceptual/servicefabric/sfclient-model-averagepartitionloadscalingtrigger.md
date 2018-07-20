---
title: "AveragePartitionLoadScalingTrigger"
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
# AveragePartitionLoadScalingTrigger

Represents a scaling trigger related to an average load of a metric/resource of a partition.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`MetricName`](#metricname) | string | Yes |
| [`LowerLoadThreshold`](#lowerloadthreshold) | string (double) | Yes |
| [`UpperLoadThreshold`](#upperloadthreshold) | string (double) | Yes |
| [`ScaleIntervalInSeconds`](#scaleintervalinseconds) | integer (int64) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'AveragePartitionLoad' for objects of type 'AveragePartitionLoadScalingTrigger'.

____
### `MetricName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the metric for which usage should be tracked.

____
### `LowerLoadThreshold`
__Type__: string (double) <br/>
__Required__: Yes<br/>
<br/>
The lower limit of the load below which a scale in operation should be performed.

____
### `UpperLoadThreshold`
__Type__: string (double) <br/>
__Required__: Yes<br/>
<br/>
The upper limit of the load beyond which a scale out operation should be performed.

____
### `ScaleIntervalInSeconds`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The period in seconds on which a decision is made whether to scale or not.
