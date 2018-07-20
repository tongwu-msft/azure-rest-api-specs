---
title: "DeployedStatelessServiceInstanceInfo"
ms.date: "2018-07-20"
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
# DeployedStatelessServiceInstanceInfo

Information about a stateless service instance deployed on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceKind`](#servicekind) | string | Yes |
| [`ServiceName`](#servicename) | string | No |
| [`ServiceTypeName`](#servicetypename) | string | No |
| [`ServiceManifestName`](#servicemanifestname) | string | No |
| [`CodePackageName`](#codepackagename) | string | No |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`ReplicaStatus`](#replicastatus) | string (enum) | No |
| [`Address`](#address) | string | No |
| [`ServicePackageActivationId`](#servicepackageactivationid) | string | No |
| [`HostProcessId`](#hostprocessid) | string | No |
| [`InstanceId`](#instanceid) | string | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'DeployedStatelessServiceInstanceInfo'.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.

____
### `ServiceTypeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the service type as specified in the service manifest.

____
### `ServiceManifestName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service manifest in which this service type is defined.

____
### `CodePackageName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the code package that hosts this replica.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition ID is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the IDs of its partitions would be different.

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
### `Address`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The last address returned by the replica in Open or ChangeRole.

____
### `ServicePackageActivationId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.


____
### `HostProcessId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Host process ID of the process that is hosting the replica. This will be zero if the replica is down. In hyper-v containers this host process ID will be from different kernel.

____
### `InstanceId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Id of a stateless service instance. InstanceId is used by Service Fabric to uniquely identify an instance of a partition of a stateless service. It is unique within a partition and does not change for the lifetime of the instance. If the instance has failed over on the same or different node, it will get a different value for the InstanceId.
