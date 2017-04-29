---
title: "DeployedStatefulServiceReplicaDetailInfo"
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
# DeployedStatefulServiceReplicaDetailInfo

Information about a stateful replica running in a code package.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceKind](#servicekind) | string | Yes |
| [ServiceName](#servicename) | string | No |
| [PartitionId](#partitionid) | string (uuid) | No |
| [CurrentServiceOperation](#currentserviceoperation) | string (enum) | No |
| [CurrentServiceOperationStartTimeUtc](#currentserviceoperationstarttimeutc) | string (date-time) | No |
| [ReportedLoad](#reportedload) | array of [LoadMetricReportInfo](sfclient-model-loadmetricreportinfo.md) | No |
| [ReplicaId](#replicaid) | string (int64) | No |
| [CurrentReplicatorOperation](#currentreplicatoroperation) | string (enum) | No |
| [ReadStatus](#readstatus) | string (enum) | No |
| [WriteStatus](#writestatus) | string (enum) | No |
| [ReplicatorStatus](#replicatorstatus) | [ReplicatorStatus](sfclient-model-replicatorstatus.md) | No |
| [ReplicaStatus](#replicastatus) | [KeyValueStoreReplicaStatus](sfclient-model-keyvaluestorereplicastatus.md) | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateful' for objects of type 'DeployedStatefulServiceReplicaDetailInfo'.

____
### ServiceName
__Type__: string <br/>
__Required__: No<br/>
<br/>
Full hierarchical name of the service in URI format starting with `fabric:`.

____
### PartitionId
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition id is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the ids of its partitions would be different.

____
### CurrentServiceOperation
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the current active life-cycle operation on a stateful service replica or stateless service instance. Possible values are following.
  - Unknown - Reserved for future use.
  - None - The service replica or instance is not going through any life-cycle changes.
  - Open - The service replica or instance is being opened.
  - ChangeRole - The service replica is changing roles.
  - Close - The service replica or instance is being closed.
  - Abort - The service replica or instance is being aborted.


____
### CurrentServiceOperationStartTimeUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The start time of the current service operation in UTC format.

____
### ReportedLoad
__Type__: array of [LoadMetricReportInfo](sfclient-model-loadmetricreportinfo.md) <br/>
__Required__: No<br/>
<br/>
List of load reported by replica.

____
### ReplicaId
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Id of the stateful service replica.

____
### CurrentReplicatorOperation
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the operation currently being executed by the Replicator. Possible values are following.
  - Invalid - Default value if the replicator is not yet ready.
  - None - Replicator is not running any operation from Service Fabric perspective.
  - Open - Replicator is opening.
  - ChangeRole - Replicator is in the process of changing its role.
  - UpdateEpoch - Due to a change in the replica set, replicator is being updated with its Epoch.
  - Close - Replicator is closing.
  - Abort - Replicator is being aborted.
  - OnDataLoss - Replicator is handling the data loss condition, where the user service may potentially be recovering state from an external source.
  - WaitForCatchup - Replicator is waiting for a quorum of replicas to be caught up to the latest state.
  - Build - Replicator is in the process of building one or more replicas.


____
### ReadStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the access status of the partition. Possible values are following.
  - Invalid - Indicates that the read or write operation access status is not valid. This value is not returned to the caller.
  - Granted - Indicates that the read or write operation access is granted and the operation is allowed.
  - ReconfigurationPending - Indicates that the client should try again later, because a reconfiguration is in progress. 
  - NotPrimary - Indicates that this client request was received by a replica that is not a Primary replica.
  - NoWriteQuorum - Indicates that no write quorum is available and, therefore, no write operation can be accepted.


____
### WriteStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the access status of the partition. Possible values are following.
  - Invalid - Indicates that the read or write operation access status is not valid. This value is not returned to the caller.
  - Granted - Indicates that the read or write operation access is granted and the operation is allowed.
  - ReconfigurationPending - Indicates that the client should try again later, because a reconfiguration is in progress. 
  - NotPrimary - Indicates that this client request was received by a replica that is not a Primary replica.
  - NoWriteQuorum - Indicates that no write quorum is available and, therefore, no write operation can be accepted.


____
### ReplicatorStatus
__Type__: [ReplicatorStatus](sfclient-model-replicatorstatus.md) <br/>
__Required__: No<br/>
<br/>
Represents a base class for primary or secondary replicator status.
Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.


____
### ReplicaStatus
__Type__: [KeyValueStoreReplicaStatus](sfclient-model-keyvaluestorereplicastatus.md) <br/>
__Required__: No<br/>
<br/>
Key value store related information for the replica.
