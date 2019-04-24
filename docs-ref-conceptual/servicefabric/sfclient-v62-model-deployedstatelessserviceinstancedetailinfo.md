---
title: "DeployedStatelessServiceInstanceDetailInfo"
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
# DeployedStatelessServiceInstanceDetailInfo

Information about a stateless instance running in a code package. Please note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceKind`](#servicekind) | string | Yes |
| [`ServiceName`](#servicename) | string | No |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`CurrentServiceOperation`](#currentserviceoperation) | string (enum) | No |
| [`CurrentServiceOperationStartTimeUtc`](#currentserviceoperationstarttimeutc) | string (date-time) | No |
| [`ReportedLoad`](#reportedload) | array of [LoadMetricReportInfo](sfclient-v62-model-loadmetricreportinfo.md) | No |
| [`InstanceId`](#instanceid) | string | No |
| [`DeployedServiceReplicaQueryResult`](#deployedservicereplicaqueryresult) | [DeployedStatelessServiceInstanceInfo](sfclient-v62-model-deployedstatelessserviceinstanceinfo.md) | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'DeployedStatelessServiceInstanceDetailInfo'.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Full hierarchical name of the service in URI format starting with `fabric:`.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition ID is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the IDs of its partitions would be different.

____
### `CurrentServiceOperation`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Specifies the current active life-cycle operation on a stateful service replica or stateless service instance.

Possible values are: 

  - `Unknown` - Reserved for future use.
  - `None` - The service replica or instance is not going through any life-cycle changes.
  - `Open` - The service replica or instance is being opened.
  - `ChangeRole` - The service replica is changing roles.
  - `Close` - The service replica or instance is being closed.
  - `Abort` - The service replica or instance is being aborted.



____
### `CurrentServiceOperationStartTimeUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The start time of the current service operation in UTC format.

____
### `ReportedLoad`
__Type__: array of [LoadMetricReportInfo](sfclient-v62-model-loadmetricreportinfo.md) <br/>
__Required__: No<br/>
<br/>
List of load reported by replica.

____
### `InstanceId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Id of a stateless service instance. InstanceId is used by Service Fabric to uniquely identify an instance of a partition of a stateless service. It is unique within a partition and does not change for the lifetime of the instance. If the instance has failed over on the same or different node, it will get a different value for the InstanceId.

____
### `DeployedServiceReplicaQueryResult`
__Type__: [DeployedStatelessServiceInstanceInfo](sfclient-v62-model-deployedstatelessserviceinstanceinfo.md) <br/>
__Required__: No<br/>
<br/>
Information about a stateless service instance deployed on a node.
