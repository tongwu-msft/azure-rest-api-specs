---
title: "PrimaryReplicatorStatus"
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
# PrimaryReplicatorStatus

Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`ReplicationQueueStatus`](#replicationqueuestatus) | [ReplicatorQueueStatus](sfclient-v62-model-replicatorqueuestatus.md) | No |
| [`RemoteReplicators`](#remotereplicators) | array of [RemoteReplicatorStatus](sfclient-v62-model-remotereplicatorstatus.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Primary' for objects of type 'PrimaryReplicatorStatus'.

____
### `ReplicationQueueStatus`
__Type__: [ReplicatorQueueStatus](sfclient-v62-model-replicatorqueuestatus.md) <br/>
__Required__: No<br/>
<br/>
Provides various statistics of the queue used in the service fabric replicator.
Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.
Depending on the role of the replicator, the properties in this type imply different meanings.


____
### `RemoteReplicators`
__Type__: array of [RemoteReplicatorStatus](sfclient-v62-model-remotereplicatorstatus.md) <br/>
__Required__: No<br/>
<br/>
The status of all the active and idle secondary replicators that the primary is aware of.
