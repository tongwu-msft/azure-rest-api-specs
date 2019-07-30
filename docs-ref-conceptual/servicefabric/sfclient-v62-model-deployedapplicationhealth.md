---
title: "DeployedApplicationHealth"
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
# DeployedApplicationHealth

Information about the health of an application deployed on a Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`AggregatedHealthState`](#aggregatedhealthstate) | string (enum) | No |
| [`HealthEvents`](#healthevents) | array of [HealthEvent](sfclient-v62-model-healthevent.md) | No |
| [`UnhealthyEvaluations`](#unhealthyevaluations) | array of [HealthEvaluationWrapper](sfclient-v62-model-healthevaluationwrapper.md) | No |
| [`HealthStatistics`](#healthstatistics) | [HealthStatistics](sfclient-v62-model-healthstatistics.md) | No |
| [`Name`](#name) | string | No |
| [`NodeName`](#nodename) | string | No |
| [`DeployedServicePackageHealthStates`](#deployedservicepackagehealthstates) | array of [DeployedServicePackageHealthState](sfclient-v62-model-deployedservicepackagehealthstate.md) | No |

____
### `AggregatedHealthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The HealthState representing the aggregated health state of the entity computed by Health Manager.
The health evaluation of the entity reflects all events reported on the entity and its children (if any).
The aggregation is done by applying the desired health policy.


The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

Possible values are: 

  - `Invalid` - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ok` - Indicates the health state is okay. The value is 1.
  - `Warning` - Indicates the health state is at a warning level. The value is 2.
  - `Error` - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - `Unknown` - Indicates an unknown health status. The value is 65535.



____
### `HealthEvents`
__Type__: array of [HealthEvent](sfclient-v62-model-healthevent.md) <br/>
__Required__: No<br/>
<br/>
The list of health events reported on the entity.

____
### `UnhealthyEvaluations`
__Type__: array of [HealthEvaluationWrapper](sfclient-v62-model-healthevaluationwrapper.md) <br/>
__Required__: No<br/>
<br/>
The unhealthy evaluations that show why the current aggregated health state was returned by Health Manager.

____
### `HealthStatistics`
__Type__: [HealthStatistics](sfclient-v62-model-healthstatistics.md) <br/>
__Required__: No<br/>
<br/>
Shows the health statistics for all children types of the queried entity.

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the application deployed on the node whose health information is described by this object.

____
### `NodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the node where this application is deployed.

____
### `DeployedServicePackageHealthStates`
__Type__: array of [DeployedServicePackageHealthState](sfclient-v62-model-deployedservicepackagehealthstate.md) <br/>
__Required__: No<br/>
<br/>
Deployed service package health states for the current deployed application as found in the health store.
