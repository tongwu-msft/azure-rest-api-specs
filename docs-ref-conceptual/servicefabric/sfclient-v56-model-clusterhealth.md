---
title: "ClusterHealth"
ms.date: "2017-05-09"
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
# ClusterHealth

Represents the health of the cluster.
Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [AggregatedHealthState](#aggregatedhealthstate) | string (enum) | No |
| [HealthEvents](#healthevents) | array of [HealthEvent](sfclient-v56-model-healthevent.md) | No |
| [UnhealthyEvaluations](#unhealthyevaluations) | array of [HealthEvaluationWrapper](sfclient-v56-model-healthevaluationwrapper.md) | No |
| [NodeHealthStates](#nodehealthstates) | array of [NodeHealthState](sfclient-v56-model-nodehealthstate.md) | No |
| [ApplicationHealthStates](#applicationhealthstates) | array of [ApplicationHealthState](sfclient-v56-model-applicationhealthstate.md) | No |

____
### AggregatedHealthState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The HealthState representing the aggregated health state of the entity computed by Health Manager.
The health evaluation of the entity reflects all events reported on the entity and its children (if any).
The aggregation is done by applying the desired health policy.


The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

  - Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - Ok - Indicates the health state is okay. The value is 1.
  - Warning - Indicates the health state is at a warning level. The value is 2.
  - Error - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - Unknown - Indicates an unknown health status. The value is 65535.



____
### HealthEvents
__Type__: array of [HealthEvent](sfclient-v56-model-healthevent.md) <br/>
__Required__: No<br/>
<br/>
The list of health events reported on the entity.

____
### UnhealthyEvaluations
__Type__: array of [HealthEvaluationWrapper](sfclient-v56-model-healthevaluationwrapper.md) <br/>
__Required__: No<br/>
<br/>
The unhealthy evaluations that show why the current aggregated health state was returned by Health Manager.

____
### NodeHealthStates
__Type__: array of [NodeHealthState](sfclient-v56-model-nodehealthstate.md) <br/>
__Required__: No<br/>
<br/>
Cluster node health states as found in the health store.

____
### ApplicationHealthStates
__Type__: array of [ApplicationHealthState](sfclient-v56-model-applicationhealthstate.md) <br/>
__Required__: No<br/>
<br/>
Cluster application health states as found in the health store.
