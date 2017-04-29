---
title: "PartitionHealthStateChunk"
ms.date: "2017-04-29"
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
# PartitionHealthStateChunk

Represents the health state chunk of a partition, which contains the partition id, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [HealthState](#healthstate) | string (enum) | No |
| [PartitionId](#partitionid) | string (uuid) | No |
| [ReplicaHealthStateChunks](#replicahealthstatechunks) | [ReplicaHealthStateChunkList](sfclient-model-replicahealthstatechunklist.md) | No |

____
### HealthState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

  - Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - Ok - Indicates the health state is okay. The value is 1.
  - Warning - Indicates the health state is at a warning level. The value is 2.
  - Error - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - Unknown - Indicates an unknown health status. The value is 65535.


____
### PartitionId
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
The ID of the partition.

____
### ReplicaHealthStateChunks
__Type__: [ReplicaHealthStateChunkList](sfclient-model-replicahealthstatechunklist.md) <br/>
__Required__: No<br/>
<br/>
The list of replica health state chunks belonging to the partition that respect the filters in the cluster health chunk query description.

