---
title: "ReplicaMetricLoadDescription v82"
description: "ReplicaMetricLoadDescription v82"
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
# ReplicaMetricLoadDescription v82

Specifies metric loads of a partition's specific secondary replica or instance.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`NodeName`](#nodename) | string | No |
| [`ReplicaOrInstanceLoadEntries`](#replicaorinstanceloadentries) | array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) | No |

____
### `NodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Node name of a specific secondary replica or instance.

____
### `ReplicaOrInstanceLoadEntries`
__Type__: array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Loads of a different metrics for a partition's secondary replica or instance.
