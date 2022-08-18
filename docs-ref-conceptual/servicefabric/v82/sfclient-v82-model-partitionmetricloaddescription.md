---
title: "PartitionMetricLoadDescription v82"
description: "PartitionMetricLoadDescription v82"
ms.date: "10/20/2021"
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
# PartitionMetricLoadDescription v82

Represents load information for a partition, which contains the metrics load information about primary, all secondary replicas/instances or a specific secondary replica/instance on a specific node , all auxiliary replicas or a specific auxiliary replica on a specific node.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`PrimaryReplicaLoadEntries`](#primaryreplicaloadentries) | array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) | No |
| [`SecondaryReplicasOrInstancesLoadEntries`](#secondaryreplicasorinstancesloadentries) | array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) | No |
| [`SecondaryReplicaOrInstanceLoadEntriesPerNode`](#secondaryreplicaorinstanceloadentriespernode) | array of [ReplicaMetricLoadDescription](sfclient-v82-model-replicametricloaddescription.md) | No |
| [`AuxiliaryReplicasLoadEntries`](#auxiliaryreplicasloadentries) | array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) | No |
| [`AuxiliaryReplicaLoadEntriesPerNode`](#auxiliaryreplicaloadentriespernode) | array of [ReplicaMetricLoadDescription](sfclient-v82-model-replicametricloaddescription.md) | No |

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition.

____
### `PrimaryReplicaLoadEntries`
__Type__: array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for primary replica, in case partition is from a stateful service.


____
### `SecondaryReplicasOrInstancesLoadEntries`
__Type__: array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for all secondary replicas or instances.


____
### `SecondaryReplicaOrInstanceLoadEntriesPerNode`
__Type__: array of [ReplicaMetricLoadDescription](sfclient-v82-model-replicametricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for a specific secondary replica or instance located on a specific node.


____
### `AuxiliaryReplicasLoadEntries`
__Type__: array of [MetricLoadDescription](sfclient-v82-model-metricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for all auxiliary replicas.


____
### `AuxiliaryReplicaLoadEntriesPerNode`
__Type__: array of [ReplicaMetricLoadDescription](sfclient-v82-model-replicametricloaddescription.md) <br/>
__Required__: No<br/>
<br/>
Partition's load information for a specific auxiliary replica located on a specific node.

