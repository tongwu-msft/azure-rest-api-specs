---
title: "NodeTypeNodesHealthEvaluation v82"
description: "NodeTypeNodesHealthEvaluation v82"
ms.date: "04/02/2021"
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
# NodeTypeNodesHealthEvaluation v82

Represents health evaluation for nodes of a particular node type. The node type nodes evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy node of the included node type that impacted current aggregated health state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`AggregatedHealthState`](#aggregatedhealthstate) | string (enum) | No |
| [`Description`](#description) | string | No |
| [`NodeTypeName`](#nodetypename) | string | No |
| [`MaxPercentUnhealthyNodes`](#maxpercentunhealthynodes) | integer | No |
| [`TotalCount`](#totalcount) | integer (int64) | No |
| [`UnhealthyEvaluations`](#unhealthyevaluations) | array of [HealthEvaluationWrapper](sfclient-v82-model-healthevaluationwrapper.md) | No |

____
### `AggregatedHealthState`
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
### `Description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Description of the health evaluation, which represents a summary of the evaluation process.

____
### `NodeTypeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The node type name as defined in the cluster manifest.

____
### `MaxPercentUnhealthyNodes`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Maximum allowed percentage of unhealthy nodes for the node type, specified as an entry in NodeTypeHealthPolicyMap.

____
### `TotalCount`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Total number of nodes of the node type found in the health store.

____
### `UnhealthyEvaluations`
__Type__: array of [HealthEvaluationWrapper](sfclient-v82-model-healthevaluationwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of unhealthy evaluations that led to the aggregated health state. Includes all the unhealthy NodeHealthEvaluation of this node type that impacted the aggregated health.
