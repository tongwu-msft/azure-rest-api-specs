---
title: "NodeLoadMetricInformation v82"
description: "NodeLoadMetricInformation v82"
ms.date: "10/21/2020"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# NodeLoadMetricInformation v82

Represents data structure that contains load information for a certain metric on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`NodeCapacity`](#nodecapacity) | string | No |
| [`NodeLoad`](#nodeload) | string | No |
| [`NodeRemainingCapacity`](#noderemainingcapacity) | string | No |
| [`IsCapacityViolation`](#iscapacityviolation) | boolean | No |
| [`NodeBufferedCapacity`](#nodebufferedcapacity) | string | No |
| [`NodeRemainingBufferedCapacity`](#noderemainingbufferedcapacity) | string | No |
| [`CurrentNodeLoad`](#currentnodeload) | string (double) | No |
| [`NodeCapacityRemaining`](#nodecapacityremaining) | string (double) | No |
| [`BufferedNodeCapacityRemaining`](#bufferednodecapacityremaining) | string (double) | No |
| [`PlannedNodeLoadRemoval`](#plannednodeloadremoval) | string (double) | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the metric for which this load information is provided.

____
### `NodeCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Total capacity on the node for this metric.

____
### `NodeLoad`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Current load on the node for this metric. In future releases of Service Fabric this parameter will be deprecated in favor of CurrentNodeLoad.

____
### `NodeRemainingCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remaining capacity on the node for this metric. In future releases of Service Fabric this parameter will be deprecated in favor of NodeCapacityRemaining.

____
### `IsCapacityViolation`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates if there is a capacity violation for this metric on the node.

____
### `NodeBufferedCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The value that indicates the reserved capacity for this metric on the node.

____
### `NodeRemainingBufferedCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remaining reserved capacity for this metric on the node. In future releases of Service Fabric this parameter will be deprecated in favor of BufferedNodeCapacityRemaining.

____
### `CurrentNodeLoad`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
Current load on the node for this metric.

____
### `NodeCapacityRemaining`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The remaining capacity on the node for the metric.

____
### `BufferedNodeCapacityRemaining`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The remaining capacity which is not reserved by NodeBufferPercentage for this metric on the node.

____
### `PlannedNodeLoadRemoval`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
This value represents the load of the replicas that are planned to be removed in the future.
This kind of load is reported for replicas that are currently being moving to other nodes and for replicas that are currently being dropped but still use the load on the source node.

