---
title: "PrimaryReplicatorStatus"
ms.date: "11/23/2019"
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
| [`ReplicationQueueStatus`](#replicationqueuestatus) | [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) | No |
| [`RemoteReplicators`](#remotereplicators) | array of [RemoteReplicatorStatus](sfclient-model-remotereplicatorstatus.md) | No |

____
### `ReplicationQueueStatus`
__Type__: [ReplicatorQueueStatus](sfclient-model-replicatorqueuestatus.md) <br/>
__Required__: No<br/>
<br/>
Details about the replication queue on the primary replicator.

____
### `RemoteReplicators`
__Type__: array of [RemoteReplicatorStatus](sfclient-model-remotereplicatorstatus.md) <br/>
__Required__: No<br/>
<br/>
The status of all the active and idle secondary replicators that the primary is aware of.
