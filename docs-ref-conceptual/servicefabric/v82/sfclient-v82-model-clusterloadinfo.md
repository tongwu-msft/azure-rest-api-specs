---
title: "ClusterLoadInfo v82"
description: "ClusterLoadInfo v82"
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
# ClusterLoadInfo v82

Information about load in a Service Fabric cluster. It holds a summary of all metrics and their load in a cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`LastBalancingStartTimeUtc`](#lastbalancingstarttimeutc) | string (date-time) | No |
| [`LastBalancingEndTimeUtc`](#lastbalancingendtimeutc) | string (date-time) | No |
| [`LoadMetricInformation`](#loadmetricinformation) | array of [LoadMetricInformation](sfclient-v82-model-loadmetricinformation.md) | No |

____
### `LastBalancingStartTimeUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The starting time of last resource balancing run.

____
### `LastBalancingEndTimeUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The end time of last resource balancing run.

____
### `LoadMetricInformation`
__Type__: array of [LoadMetricInformation](sfclient-v82-model-loadmetricinformation.md) <br/>
__Required__: No<br/>
<br/>
List that contains metrics and their load information in this cluster.
