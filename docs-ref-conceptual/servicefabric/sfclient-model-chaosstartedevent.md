---
title: "ChaosStartedEvent"
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
# ChaosStartedEvent

Chaos Started event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`MaxConcurrentFaults`](#maxconcurrentfaults) | integer (int64) | Yes |
| [`TimeToRunInSeconds`](#timetoruninseconds) | number (double) | Yes |
| [`MaxClusterStabilizationTimeoutInSeconds`](#maxclusterstabilizationtimeoutinseconds) | number (double) | Yes |
| [`WaitTimeBetweenIterationsInSeconds`](#waittimebetweeniterationsinseconds) | number (double) | Yes |
| [`WaitTimeBetweenFautlsInSeconds`](#waittimebetweenfautlsinseconds) | number (double) | Yes |
| [`MoveReplicaFaultEnabled`](#movereplicafaultenabled) | boolean | Yes |
| [`IncludedNodeTypeList`](#includednodetypelist) | string | Yes |
| [`IncludedApplicationList`](#includedapplicationlist) | string | Yes |
| [`ClusterHealthPolicy`](#clusterhealthpolicy) | string | Yes |
| [`ChaosContext`](#chaoscontext) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ChaosStarted' for objects of type 'ChaosStartedEvent'.

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
### `MaxConcurrentFaults`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Maximum number of concurrent faults.

____
### `TimeToRunInSeconds`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Time to run in seconds.

____
### `MaxClusterStabilizationTimeoutInSeconds`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Maximum timeout for cluster stabilization in seconds.

____
### `WaitTimeBetweenIterationsInSeconds`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Wait time between iterations in seconds.

____
### `WaitTimeBetweenFautlsInSeconds`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Wait time between faults in seconds.

____
### `MoveReplicaFaultEnabled`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates MoveReplica fault is enabled.

____
### `IncludedNodeTypeList`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
List of included Node types.

____
### `IncludedApplicationList`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
List of included Applications.

____
### `ClusterHealthPolicy`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Health policy.

____
### `ChaosContext`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Chaos Context.
