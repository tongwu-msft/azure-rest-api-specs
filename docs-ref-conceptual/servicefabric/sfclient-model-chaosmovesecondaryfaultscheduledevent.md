---
title: "ChaosMoveSecondaryFaultScheduledEvent"
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
# ChaosMoveSecondaryFaultScheduledEvent

Chaos Move Secondary Fault Scheduled event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`PartitionId`](#partitionid) | string (uuid) | Yes |
| [`FaultGroupId`](#faultgroupid) | string (uuid) | Yes |
| [`FaultId`](#faultid) | string (uuid) | Yes |
| [`ServiceName`](#servicename) | string | Yes |
| [`SourceNode`](#sourcenode) | string | Yes |
| [`DestinationNode`](#destinationnode) | string | Yes |
| [`ForcedMove`](#forcedmove) | boolean | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ChaosMoveSecondaryFaultScheduled' for objects of type 'ChaosMoveSecondaryFaultScheduledEvent'.

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
### `ServiceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service name.

____
### `SourceNode`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `DestinationNode`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `ForcedMove`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates a forced move.
