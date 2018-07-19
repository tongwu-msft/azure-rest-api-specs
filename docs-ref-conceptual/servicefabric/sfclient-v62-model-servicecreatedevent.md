---
title: "ServiceCreatedEvent"
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
# ServiceCreatedEvent

Service Created event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`ServiceId`](#serviceid) | string | Yes |
| [`ServiceTypeName`](#servicetypename) | string | Yes |
| [`ApplicationName`](#applicationname) | string | Yes |
| [`ApplicationTypeName`](#applicationtypename) | string | Yes |
| [`ServiceInstance`](#serviceinstance) | integer (int64) | Yes |
| [`IsStateful`](#isstateful) | boolean | Yes |
| [`PartitionCount`](#partitioncount) | integer (int32) | Yes |
| [`TargetReplicaSetSize`](#targetreplicasetsize) | integer (int32) | Yes |
| [`MinReplicaSetSize`](#minreplicasetsize) | integer (int32) | Yes |
| [`ServicePackageVersion`](#servicepackageversion) | string | Yes |
| [`PartitionId`](#partitionid) | string (uuid) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ServiceCreated' for objects of type 'ServiceCreatedEvent'.

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
### `ServiceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is an encoded representation of the service name. This is used in the REST APIs to identify the service resource.
Starting in version 6.0, hierarchical names are delimited with the "\~" character. For example, if the service name is "fabric:/myapp/app1/svc1",
the service identity would be "myapp~app1\~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


____
### `ServiceTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service type name.

____
### `ApplicationName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Application name.

____
### `ApplicationTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Application type name.

____
### `ServiceInstance`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Id of Service instance.

____
### `IsStateful`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates if Service is stateful.

____
### `PartitionCount`
__Type__: integer (int32) <br/>
__Required__: Yes<br/>
<br/>
Number of partitions.

____
### `TargetReplicaSetSize`
__Type__: integer (int32) <br/>
__Required__: Yes<br/>
<br/>
Size of target replicas set.

____
### `MinReplicaSetSize`
__Type__: integer (int32) <br/>
__Required__: Yes<br/>
<br/>
Minimum size of replicas set.

____
### `ServicePackageVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Version of Service package.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition ID is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the IDs of its partitions would be different.
