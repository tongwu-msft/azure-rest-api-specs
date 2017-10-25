---
title: "ReplicaHealthStateChunk"
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
# ReplicaHealthStateChunk

Represents the health state chunk of a stateful service replica or a stateless service instance.
The replica health state contains the replica ID and its aggregated health state.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [HealthState](#healthstate) | string (enum) | No |
| [ReplicaOrInstanceId](#replicaorinstanceid) | string | No |

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
### ReplicaOrInstanceId
__Type__: string <br/>
__Required__: No<br/>
<br/>
Id of a stateful service replica or a stateless service instance. This id is used in the queries that apply to both stateful and stateless services. It is used by Service Fabric to uniquely identify a replica of a partition of a stateful service or an instance of a stateless service partition. It is unique within a partition and does not change for the lifetime of the replica or the instance. If a stateful replica gets dropped and another replica gets created on the same node for the same partition, it will get a different value for the id. If a staless instance is failed over on the same or different node it will get a different value for the id.
