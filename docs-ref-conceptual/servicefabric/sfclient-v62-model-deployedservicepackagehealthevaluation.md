---
title: "DeployedServicePackageHealthEvaluation"
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
# DeployedServicePackageHealthEvaluation

Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`AggregatedHealthState`](#aggregatedhealthstate) | string (enum) | No |
| [`Description`](#description) | string | No |
| [`NodeName`](#nodename) | string | No |
| [`ApplicationName`](#applicationname) | string | No |
| [`ServiceManifestName`](#servicemanifestname) | string | No |
| [`UnhealthyEvaluations`](#unhealthyevaluations) | array of [HealthEvaluationWrapper](sfclient-v62-model-healthevaluationwrapper.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'DeployedServicePackage' for objects of type 'DeployedServicePackageHealthEvaluation'.

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
### `NodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of a Service Fabric node.

____
### `ApplicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### `ServiceManifestName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service manifest.

____
### `UnhealthyEvaluations`
__Type__: array of [HealthEvaluationWrapper](sfclient-v62-model-healthevaluationwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of unhealthy evaluations that led to the current aggregated health state. The type of the unhealthy evaluations can be EventHealthEvaluation.
