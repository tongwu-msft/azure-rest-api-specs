---
title: "SecondaryIdleReplicatorStatus"
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
# SecondaryIdleReplicatorStatus

Status of the secondary replicator when it is in idle mode and is being built by the primary.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [ReplicationQueueStatus](#replicationqueuestatus) | [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) | No |
| [LastReplicationOperationReceivedTimeUtc](#lastreplicationoperationreceivedtimeutc) | string (date-time) | No |
| [IsInBuild](#isinbuild) | boolean | No |
| [CopyQueueStatus](#copyqueuestatus) | [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) | No |
| [LastCopyOperationReceivedTimeUtc](#lastcopyoperationreceivedtimeutc) | string (date-time) | No |
| [LastAcknowledgementSentTimeUtc](#lastacknowledgementsenttimeutc) | string (date-time) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'IdleSecondary' for objects of type 'SecondaryIdleReplicatorStatus'.

____
### ReplicationQueueStatus
__Type__: [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) <br/>
__Required__: No<br/>
<br/>
Provides various statistics of the queue used in the service fabric replicator.
Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.
Depending on the role of the replicator, the properties in this type imply different meanings.


____
### LastReplicationOperationReceivedTimeUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time-stamp (UTC) at which a replication operation was received from the primary.
UTC 0 represents an invalid value, indicating that a replication operation message was never received.


____
### IsInBuild
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Value that indicates whether the replica is currently being built.

____
### CopyQueueStatus
__Type__: [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) <br/>
__Required__: No<br/>
<br/>
Provides various statistics of the queue used in the service fabric replicator.
Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.
Depending on the role of the replicator, the properties in this type imply different meanings.


____
### LastCopyOperationReceivedTimeUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time-stamp (UTC) at which a copy operation was received from the primary.
UTC 0 represents an invalid value, indicating that a copy operation message was never received.


____
### LastAcknowledgementSentTimeUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time-stamp (UTC) at which an acknowledgment was sent to the primary replicator.
UTC 0 represents an invalid value, indicating that an acknowledgment message was never sent.

