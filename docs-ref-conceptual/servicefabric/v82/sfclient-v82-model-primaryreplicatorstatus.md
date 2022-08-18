---
title: "PrimaryReplicatorStatus v82"
description: "PrimaryReplicatorStatus v82"
ms.date: "10/21/2020"
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
# PrimaryReplicatorStatus v82

Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ReplicationQueueStatus`](#replicationqueuestatus) | [ReplicatorQueueStatus](sfclient-v82-model-replicatorqueuestatus.md) | No |
| [`RemoteReplicators`](#remotereplicators) | array of [RemoteReplicatorStatus](sfclient-v82-model-remotereplicatorstatus.md) | No |

____
### `ReplicationQueueStatus`
__Type__: [ReplicatorQueueStatus](sfclient-v82-model-replicatorqueuestatus.md) <br/>
__Required__: No<br/>
<br/>
Details about the replication queue on the primary replicator.

____
### `RemoteReplicators`
__Type__: array of [RemoteReplicatorStatus](sfclient-v82-model-remotereplicatorstatus.md) <br/>
__Required__: No<br/>
<br/>
The status of all the active and idle secondary replicators that the primary is aware of.
