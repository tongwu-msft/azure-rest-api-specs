---
title: "PartitionPrimaryMoveAnalysisEvent"
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
# PartitionPrimaryMoveAnalysisEvent

Partition Primary Move Analysis event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`PartitionId`](#partitionid) | string (uuid) | Yes |
| [`Metadata`](#metadata) | [AnalysisEventMetadata](sfclient-v62-model-analysiseventmetadata.md) | Yes |
| [`WhenMoveCompleted`](#whenmovecompleted) | string (date-time) | Yes |
| [`PreviousNode`](#previousnode) | string | Yes |
| [`CurrentNode`](#currentnode) | string | Yes |
| [`MoveReason`](#movereason) | string | Yes |
| [`RelevantTraces`](#relevanttraces) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'PartitionPrimaryMoveAnalysis' for objects of type 'PartitionPrimaryMoveAnalysisEvent'.

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
### `Metadata`
__Type__: [AnalysisEventMetadata](sfclient-v62-model-analysiseventmetadata.md) <br/>
__Required__: Yes<br/>
<br/>
Metadata about an Analysis Event.

____
### `WhenMoveCompleted`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
Time when the move was completed.

____
### `PreviousNode`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `CurrentNode`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `MoveReason`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Move reason.

____
### `RelevantTraces`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Relevant traces.
