---
title: "RemoteReplicatorStatus"
ms.date: "2017-05-03"
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
# RemoteReplicatorStatus

Represents the state of the secondary replicator from the primary replicator’s point of view. 


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ReplicaId](#replicaid) | string (int64) | No |
| [LastAcknowledgementProcessedTimeUtc](#lastacknowledgementprocessedtimeutc) | string (date-time) | No |
| [LastReceivedReplicationSequenceNumber](#lastreceivedreplicationsequencenumber) | string (int64) | No |
| [LastAppliedReplicationSequenceNumber](#lastappliedreplicationsequencenumber) | string (int64) | No |
| [IsInBuild](#isinbuild) | boolean | No |
| [LastReceivedCopySequenceNumber](#lastreceivedcopysequencenumber) | string (int64) | No |
| [LastAppliedCopySequenceNumber](#lastappliedcopysequencenumber) | string (int64) | No |
| [RemoteReplicatorAcknowledgementStatus](#remotereplicatoracknowledgementstatus) | [RemoteReplicatorAcknowledgementStatus](sfclient-model-remotereplicatoracknowledgementstatus.md) | No |

____
### ReplicaId
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the replica id of the remote secondary replicator.

____
### LastAcknowledgementProcessedTimeUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last timestamp (in UTC) when an acknowledgement from the secondary replicator was processed on the primary.
UTC 0 represents an invalid value, indicating that no acknowledgement messages were ever processed.


____
### LastReceivedReplicationSequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The highest replication operation sequence number that the secondary has received from the primary.

____
### LastAppliedReplicationSequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The highest replication operation sequence number that the secondary has applied to its state.

____
### IsInBuild
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A value that indicates whether the secondary replica is in the process of being built.

____
### LastReceivedCopySequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The highest copy operation sequence number that the secondary has received from the primary.
A value of -1 implies that the secondary has received all copy operations.


____
### LastAppliedCopySequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The highest copy operation sequence number that the secondary has applied to its state.
A value of -1 implies that the secondary has applied all copy operations and the copy process is complete.


____
### RemoteReplicatorAcknowledgementStatus
__Type__: [RemoteReplicatorAcknowledgementStatus](sfclient-model-remotereplicatoracknowledgementstatus.md) <br/>
__Required__: No<br/>
<br/>
Represents the acknowledgement status for the remote secondary replicator.
