---
title: "LoadedPartitionInformationResult v82"
description: "LoadedPartitionInformationResult v82"
ms.date: "04/02/2021"
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
# LoadedPartitionInformationResult v82

Represents partition information.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceName`](#servicename) | string | Yes |
| [`PartitionId`](#partitionid) | string (uuid) | Yes |
| [`MetricName`](#metricname) | string | Yes |
| [`Load`](#load) | integer (int64) | Yes |

____
### `ServiceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the service this partition belongs to.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
Id of the partition.

____
### `MetricName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the metric for which this information is provided.

____
### `Load`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Load for metric.
