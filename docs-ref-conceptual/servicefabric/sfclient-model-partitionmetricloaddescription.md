---
title: "PartitionMetricLoadDescription"
description: "PartitionMetricLoadDescription"
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
# PartitionMetricLoadDescription

Represents load information for a partition, which contains the metrics load information about primary, all secondary replicas/instances or a specific secondary replica/instance located on a specific node.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`PrimaryReplicaLoadEntries`](#primaryreplicaloadentries) | array of [MetricLoadDescription](sfclient-model-metricloaddescription.md) | No |
| [`SecondaryReplicasOrInstancesLoadEntries`](#secondaryreplicasorinstancesloadentries) | array of [MetricLoadDescription](sfclient-model-metricloaddescription.md) | No |
| [`SecondaryReplicaOrInstanceLoadEntriesPerNode`](#secondaryreplicaorinstanceloadentriespernode) | array of [ReplicaMetricLoadDescription](sfclient-model-replicametricloaddescription.md) | No |

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition.

____
### `PrimaryReplicaLoadEntries`
__Type__: array of [MetricLoadDescription](sfclient-model-metricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for primary replica, in case partition is from a stateful service.


____
### `SecondaryReplicasOrInstancesLoadEntries`
__Type__: array of [MetricLoadDescription](sfclient-model-metricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for all secondary replicas or instances.


____
### `SecondaryReplicaOrInstanceLoadEntriesPerNode`
__Type__: array of [ReplicaMetricLoadDescription](sfclient-model-replicametricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for a specific secondary replica or instance located on a specific node.

