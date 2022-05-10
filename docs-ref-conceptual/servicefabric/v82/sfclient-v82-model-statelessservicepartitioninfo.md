---
title: "StatelessServicePartitionInfo v82"
description: "StatelessServicePartitionInfo v82"
ms.date: "01/28/2021"
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
# StatelessServicePartitionInfo v82

Information about a partition of a stateless Service Fabric service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`HealthState`](#healthstate) | string (enum) | No |
| [`PartitionStatus`](#partitionstatus) | string (enum) | No |
| [`PartitionInformation`](#partitioninformation) | [PartitionInformation](sfclient-v82-model-partitioninformation.md) | No |
| [`InstanceCount`](#instancecount) | integer (int64) | No |
| [`MinInstanceCount`](#mininstancecount) | integer | No |
| [`MinInstancePercentage`](#mininstancepercentage) | integer | No |

____
### `HealthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

Possible values are: 

  - `Invalid` - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ok` - Indicates the health state is okay. The value is 1.
  - `Warning` - Indicates the health state is at a warning level. The value is 2.
  - `Error` - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - `Unknown` - Indicates an unknown health status. The value is 65535.



____
### `PartitionStatus`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The status of the service fabric service partition.

Possible values are: 

  - `Invalid` - Indicates the partition status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ready` - Indicates that the partition is ready. This means that for a stateless service partition there is at least one instance that is up and for a stateful service partition the number of ready replicas is greater than or equal to the MinReplicaSetSize. The value is 1.
  - `NotReady` - Indicates that the partition is not ready. This status is returned when none of the other states apply. The value is 2.
  - `InQuorumLoss` - Indicates that the partition is in quorum loss. This means that number of replicas that are up and participating in a replica set is less than MinReplicaSetSize for this partition. The value is 3.
  - `Reconfiguring` - Indicates that the partition is undergoing reconfiguration of its replica sets. This can happen due to failover, upgrade, load balancing or addition or removal of replicas from the replica set. The value is 4.
  - `Deleting` - Indicates that the partition is being deleted. The value is 5.



____
### `PartitionInformation`
__Type__: [PartitionInformation](sfclient-v82-model-partitioninformation.md) <br/>
__Required__: No<br/>
<br/>
Information about the partition identity, partitioning scheme and keys supported by it.

____
### `InstanceCount`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Number of instances of this partition.

____
### `MinInstanceCount`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
MinInstanceCount is the minimum number of instances that must be up to meet the EnsureAvailability safety check during operations like upgrade or deactivate node.
The actual number that is used is max( MinInstanceCount, ceil( MinInstancePercentage/100.0 * InstanceCount) ).
Note, if InstanceCount is set to -1, during MinInstanceCount computation -1 is first converted into the number of nodes on which the instances are allowed to be placed according to the placement constraints on the service.


____
### `MinInstancePercentage`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
MinInstancePercentage is the minimum percentage of InstanceCount that must be up to meet the EnsureAvailability safety check during operations like upgrade or deactivate node.
The actual number that is used is max( MinInstanceCount, ceil( MinInstancePercentage/100.0 * InstanceCount) ).
Note, if InstanceCount is set to -1, during MinInstancePercentage computation, -1 is first converted into the number of nodes on which the instances are allowed to be placed according to the placement constraints on the service.

