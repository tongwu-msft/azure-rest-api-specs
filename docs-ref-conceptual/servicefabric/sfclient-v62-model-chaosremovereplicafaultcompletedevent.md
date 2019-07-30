---
title: "ChaosRemoveReplicaFaultCompletedEvent"
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
# ChaosRemoveReplicaFaultCompletedEvent

Chaos Remove Replica Fault Completed event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`PartitionId`](#partitionid) | string (uuid) | Yes |
| [`ReplicaId`](#replicaid) | integer (int64) | Yes |
| [`FaultGroupId`](#faultgroupid) | string (uuid) | Yes |
| [`FaultId`](#faultid) | string (uuid) | Yes |
| [`ServiceUri`](#serviceuri) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ChaosRemoveReplicaFaultCompleted' for objects of type 'ChaosRemoveReplicaFaultCompletedEvent'.

____
### `EventInstanceId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identifier for the FabricEvent instance.

____
### `TimeStamp`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
The time event was logged.

____
### `HasCorrelatedEvents`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Shows there is existing related events available.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition ID is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the IDs of its partitions would be different.

____
### `ReplicaId`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Id of a stateful service replica. ReplicaId is used by Service Fabric to uniquely identify a replica of a partition. It is unique within a partition and does not change for the lifetime of the replica. If a replica gets dropped and another replica gets created on the same node for the same partition, it will get a different value for the id. Sometimes the id of a stateless service instance is also referred as a replica id.

____
### `FaultGroupId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
Id of fault group.

____
### `FaultId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
Id of fault.

____
### `ServiceUri`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service name.
