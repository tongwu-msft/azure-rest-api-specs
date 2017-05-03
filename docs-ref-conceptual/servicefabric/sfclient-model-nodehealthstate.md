---
title: "NodeHealthState"
ms.date: "2017-05-03"
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
# NodeHealthState

Represents the health state of a node, which contains the node identifier and its aggregated health state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [AggregatedHealthState](#aggregatedhealthstate) | string (enum) | No |
| [Name](#name) | string | No |
| [Id](#id) | [NodeId](sfclient-model-nodeid.md) | No |

____
### AggregatedHealthState
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
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the node.

____
### Id
__Type__: [NodeId](sfclient-model-nodeid.md) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.
