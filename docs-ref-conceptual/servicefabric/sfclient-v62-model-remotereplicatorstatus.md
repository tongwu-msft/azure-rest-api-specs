---
title: "RemoteReplicatorStatus"
ms.date: "2018-04-23"
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
| [`ReplicaId`](#replicaid) | string | No |
| [`LastAcknowledgementProcessedTimeUtc`](#lastacknowledgementprocessedtimeutc) | string (date-time) | No |
| [`LastReceivedReplicationSequenceNumber`](#lastreceivedreplicationsequencenumber) | string | No |
| [`LastAppliedReplicationSequenceNumber`](#lastappliedreplicationsequencenumber) | string | No |
| [`IsInBuild`](#isinbuild) | boolean | No |
| [`LastReceivedCopySequenceNumber`](#lastreceivedcopysequencenumber) | string | No |
| [`LastAppliedCopySequenceNumber`](#lastappliedcopysequencenumber) | string | No |
| [`RemoteReplicatorAcknowledgementStatus`](#remotereplicatoracknowledgementstatus) | [RemoteReplicatorAcknowledgementStatus](sfclient-v62-model-remotereplicatoracknowledgementstatus.md) | No |

____
### `ReplicaId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Represents the replica ID of the remote secondary replicator.

____
### `LastAcknowledgementProcessedTimeUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last timestamp (in UTC) when an acknowledgement from the secondary replicator was processed on the primary.
UTC 0 represents an invalid value, indicating that no acknowledgement messages were ever processed.


____
### `LastReceivedReplicationSequenceNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The highest replication operation sequence number that the secondary has received from the primary.

____
### `LastAppliedReplicationSequenceNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The highest replication operation sequence number that the secondary has applied to its state.

____
### `IsInBuild`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A value that indicates whether the secondary replica is in the process of being built.

____
### `LastReceivedCopySequenceNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The highest copy operation sequence number that the secondary has received from the primary.
A value of -1 implies that the secondary has received all copy operations.


____
### `LastAppliedCopySequenceNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The highest copy operation sequence number that the secondary has applied to its state.
A value of -1 implies that the secondary has applied all copy operations and the copy process is complete.


____
### `RemoteReplicatorAcknowledgementStatus`
__Type__: [RemoteReplicatorAcknowledgementStatus](sfclient-v62-model-remotereplicatoracknowledgementstatus.md) <br/>
__Required__: No<br/>
<br/>
Represents the acknowledgment status for the remote secondary replicator.
