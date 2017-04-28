---
title: "StatefulServicePartitionInfo"
ms.date: "2017-04-27"
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
# StatefulServicePartitionInfo

Information about a partition of a stateful Service Fabric service..

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceKind](#servicekind) | string | Yes |
| [HealthState](#healthstate) | string (enum) | No |
| [PartitionStatus](#partitionstatus) | string (enum) | No |
| [PartitionInformation](#partitioninformation) | [PartitionInformation](model-PartitionInformation.md) | No |
| [TargetReplicaSetSize](#targetreplicasetsize) | integer (int64) | No |
| [MinReplicaSetSize](#minreplicasetsize) | integer (int64) | No |
| [LastQuorumLossDuration](#lastquorumlossduration) | string (duration) | No |
| [CurrentConfigurationEpoch](#currentconfigurationepoch) | [Epoch](model-Epoch.md) | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateful' for objects of type 'StatefulServicePartitionInfo'.

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
### PartitionStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the service fabric service partition. Possible values are following.

  - Invalid - Indicates the partition status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Ready - Indicates that the partition is ready. This means that for a stateless service partition there is atleast one instance that is up and for a stateful service partition the number of ready replicas is greater than or equal to the MinReplicaSetSize. The value is 1.
  - NotReady - Indicates that the partition is not ready. This status is returned when none of the other states apply. The value is 2.
  - InQuorumLoss  - Indicates that the partition is in quorum loss. This means that number of replicas that are up and participating in a replica set is less than MinReplicaSetSize for this partition. The value is 3.
  - Reconfiguring - Indicates that the partition is undergoing reconfiguration of its replica sets. This can happen due to failover, upgrade, load balancing or addition or removal of replicas from the replica set. The value is 4.
  - Deleting - Indicates that the partition is being deleted. The value is 5.


____
### PartitionInformation
__Type__: [PartitionInformation](model-PartitionInformation.md) <br/>
__Required__: No<br/>
<br/>
Information about the partition identity, partitioning scheme and keys supported by it.

____
### TargetReplicaSetSize
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The target replica set size as a number.

____
### MinReplicaSetSize
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The minimum replica set size as a number.

____
### LastQuorumLossDuration
__Type__: string (duration) <br/>
__Required__: No<br/>
<br/>
The duration for which this partition was in quorum loss. If the partition is currently in quorum loss, it returns the duration since it has been in that state. This field is using ISO8601 format for specifying the duration.

____
### CurrentConfigurationEpoch
__Type__: [Epoch](model-Epoch.md) <br/>
__Required__: No<br/>
<br/>
An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.

