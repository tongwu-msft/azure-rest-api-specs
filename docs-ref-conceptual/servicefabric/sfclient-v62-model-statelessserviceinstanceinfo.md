---
title: "StatelessServiceInstanceInfo"
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
# StatelessServiceInstanceInfo

Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceKind`](#servicekind) | string | Yes |
| [`ReplicaStatus`](#replicastatus) | string (enum) | No |
| [`HealthState`](#healthstate) | string (enum) | No |
| [`NodeName`](#nodename) | string | No |
| [`Address`](#address) | string | No |
| [`LastInBuildDurationInSeconds`](#lastinbuilddurationinseconds) | string | No |
| [`InstanceId`](#instanceid) | string | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'StatelessServiceInstanceInfo'.

____
### `ReplicaStatus`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The status of a replica of a service.

Possible values are: 

  - `Invalid` - Indicates the replica status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `InBuild` - The replica is being built. This means that a primary replica is seeding this replica. The value is 1.
  - `Standby` - The replica is in standby. The value is 2.
  - `Ready` - The replica is ready. The value is 3.
  - `Down` - The replica is down. The value is 4.
  - `Dropped` - Replica is dropped. This means that the replica has been removed from the replica set. If it is persisted, its state has been deleted. The value is 5.



____
### `HealthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

Possible values are: 

  - `Invalid` - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ok` - Indicates the health state is okay. The value is 1.
  - `Warning` - Indicates the health state is at a warning level. The value is 2.
  - `Error` - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - `Unknown` - Indicates an unknown health status. The value is 65535.



____
### `NodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of a Service Fabric node.

____
### `Address`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The address the replica is listening on.

____
### `LastInBuildDurationInSeconds`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The last in build duration of the replica in seconds.

____
### `InstanceId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Id of a stateless service instance. InstanceId is used by Service Fabric to uniquely identify an instance of a partition of a stateless service. It is unique within a partition and does not change for the lifetime of the instance. If the instance has failed over on the same or different node, it will get a different value for the InstanceId.
