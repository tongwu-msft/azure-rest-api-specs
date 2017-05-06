---
title: "StatefulServiceReplicaInfo"
ms.date: "2017-05-06"
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
# StatefulServiceReplicaInfo

Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceKind](#servicekind) | string | Yes |
| [ReplicaStatus](#replicastatus) | string (enum) | No |
| [HealthState](#healthstate) | string (enum) | No |
| [NodeName](#nodename) | string | No |
| [Address](#address) | string | No |
| [LastInBuildDurationInSeconds](#lastinbuilddurationinseconds) | string (int64) | No |
| [ReplicaRole](#replicarole) | string (enum) | No |
| [ReplicaId](#replicaid) | string (int64) | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateful' for objects of type 'StatefulServiceReplicaInfo'.

____
### ReplicaStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of a replica of a service. Possible values are following.

  -Invalid - Indicates the replica status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  -InBuild - The replica is being built. This means that a primary replica is seeding this replica. The value is 1.
  -Standby - The replica is in standby. The value is 2.
  -Ready - The replica is ready. The value is 3.
  -Down - The replica is down. The value is 4.
  -Dropped - Replica is dropped. This means that the replica has been removed from the replica set. If it is persisted, its state has been deleted. The value is 5.


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
### NodeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the node.

____
### Address
__Type__: string <br/>
__Required__: No<br/>
<br/>
The address the replica is listening on.

____
### LastInBuildDurationInSeconds
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The last in build duration of the replica in seconds.

____
### ReplicaRole
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The role of a replica of a stateful service. Possible values are following.
  - Unknown - Indicates the initial role that a replica is created in. The value is zero.
  - None - Specifies that the replica has no responsibility in regard to the replica set. The value is 1
  - Primary - Refers to the replica in the set on which all read and write operations are complete in order to enforce strong consistency semantics. Read operations are handled directly by the Primary replica, while write operations must be acknowledged by a quorum of the replicas in the replica set. There can only be one Primary replica in a replica set at a time. The value is 2.
  - IdleSecondary - Refers to a replica in the set that receives a state transfer from the Primary replica to prepare for becoming an active Secondary replica. There can be multiple Idle Secondary replicas in a replica set at a time. Idle Secondary replicas do not count as a part of a write quorum. The value is 3.
  - ActiveSecondary - Refers to a replica in the set that receives state updates from the Primary replica, applies them, and sends acknowledgements back. Secondary replicas must participate in the write quorum for a replica set. There can be multiple active Secondary replicas in a replica set at a time. The number of active Secondary replicas is configurable that the reliability subsystem should maintain. The value is 4.


____
### ReplicaId
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a replica of a partition. The replica ID is unique within a partition and does not change for the lifetime of the replica. If a replica gets dropped and another replica gets created on the same node for the same partition, it will get a different replica ID.
