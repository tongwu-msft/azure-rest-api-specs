---
title: "ClusterHealthChunk"
ms.date: "2017-10-02"
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
# ClusterHealthChunk

Represents the health chunk of the cluster.
Contains the cluster aggregated health state, and the cluster entities that respect the input filter.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [HealthState](#healthstate) | string (enum) | No |
| [NodeHealthStateChunks](#nodehealthstatechunks) | [NodeHealthStateChunkList](sfclient-model-nodehealthstatechunklist.md) | No |
| [ApplicationHealthStateChunks](#applicationhealthstatechunks) | [ApplicationHealthStateChunkList](sfclient-model-applicationhealthstatechunklist.md) | No |

____
### HealthState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The HealthState representing the aggregated health state of the cluster computed by Health Manager.
The health evaluation of the entity reflects all events reported on the entity and its children (if any).
The aggregation is done by applying the desired cluster health policy and the application health policies.


The HealthState representing the aggregated health state of the cluster computed by Health Manager.
The health evaluation of the entity reflects all events reported on the entity and its children (if any).
The aggregation is done by applying the desired cluster health policy and the application health policies.



____
### NodeHealthStateChunks
__Type__: [NodeHealthStateChunkList](sfclient-model-nodehealthstatechunklist.md) <br/>
__Required__: No<br/>
<br/>
The list of node health state chunks in the cluster that respect the filters in the cluster health chunk query description.


____
### ApplicationHealthStateChunks
__Type__: [ApplicationHealthStateChunkList](sfclient-model-applicationhealthstatechunklist.md) <br/>
__Required__: No<br/>
<br/>
The list of application health state chunks in the cluster that respect the filters in the cluster health chunk query description.

