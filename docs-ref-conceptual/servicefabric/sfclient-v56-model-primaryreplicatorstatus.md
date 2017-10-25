---
title: "PrimaryReplicatorStatus"
ms.date: "2017-05-09"
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



## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [ReplicationQueueStatus](#replicationqueuestatus) | [ReplicatorQueueStatus](sfclient-v56-model-replicatorqueuestatus.md) | No |
| [RemoteReplicators](#remotereplicators) | array of [RemoteReplicatorStatus](sfclient-v56-model-remotereplicatorstatus.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Primary' for objects of type 'PrimaryReplicatorStatus'.

____
### ReplicationQueueStatus
__Type__: [ReplicatorQueueStatus](sfclient-v56-model-replicatorqueuestatus.md) <br/>
__Required__: No<br/>
<br/>
Details about the replication queue on the primary replicator.

____
### RemoteReplicators
__Type__: array of [RemoteReplicatorStatus](sfclient-v56-model-remotereplicatorstatus.md) <br/>
__Required__: No<br/>
<br/>
The status of all the active and idle secondary replicators that the primary is aware of.
