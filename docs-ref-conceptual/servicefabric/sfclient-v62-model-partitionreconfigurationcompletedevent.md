---
title: "PartitionReconfigurationCompletedEvent"
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
# PartitionReconfigurationCompletedEvent

Partition Reconfiguration Completed event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`PartitionId`](#partitionid) | string (uuid) | Yes |
| [`NodeName`](#nodename) | string | Yes |
| [`NodeInstanceId`](#nodeinstanceid) | string | Yes |
| [`ServiceType`](#servicetype) | string | Yes |
| [`CcEpochDataLossVersion`](#ccepochdatalossversion) | integer (int64) | Yes |
| [`CcEpochConfigVersion`](#ccepochconfigversion) | integer (int64) | Yes |
| [`ReconfigType`](#reconfigtype) | string | Yes |
| [`Result`](#result) | string | Yes |
| [`Phase0DurationMs`](#phase0durationms) | number (double) | Yes |
| [`Phase1DurationMs`](#phase1durationms) | number (double) | Yes |
| [`Phase2DurationMs`](#phase2durationms) | number (double) | Yes |
| [`Phase3DurationMs`](#phase3durationms) | number (double) | Yes |
| [`Phase4DurationMs`](#phase4durationms) | number (double) | Yes |
| [`TotalDurationMs`](#totaldurationms) | number (double) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'PartitionReconfigurationCompleted' for objects of type 'PartitionReconfigurationCompletedEvent'.

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
### `NodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `NodeInstanceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Id of Node instance.

____
### `ServiceType`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Type of Service.

____
### `CcEpochDataLossVersion`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
CcEpochDataLoss version.

____
### `CcEpochConfigVersion`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
CcEpochConfig version.

____
### `ReconfigType`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Type of reconfiguration.

____
### `Result`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Describes reconfiguration result.

____
### `Phase0DurationMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Duration of Phase0 in milli-seconds.

____
### `Phase1DurationMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Duration of Phase1 in milli-seconds.

____
### `Phase2DurationMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Duration of Phase2 in milli-seconds.

____
### `Phase3DurationMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Duration of Phase3 in milli-seconds.

____
### `Phase4DurationMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Duration of Phase4 in milli-seconds.

____
### `TotalDurationMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Total duration in milli-seconds.
