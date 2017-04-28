---
title: "DeployedServicePackagesHealthEvaluation"
ms.date: "2017-04-27"
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
# DeployedServicePackagesHealthEvaluation

Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [AggregatedHealthState](#aggregatedhealthstate) | string (enum) | No |
| [Description](#description) | string | No |
| [TotalCount](#totalcount) | integer (int64) | No |
| [UnhealthyEvaluations](#unhealthyevaluations) | array of [HealthEvaluationWrapper](model-HealthEvaluationWrapper.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'DeployedServicePackages' for objects of type 'DeployedServicePackagesHealthEvaluation'.

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
### Description
__Type__: string <br/>
__Required__: No<br/>
<br/>
Description of the health evaluation, which represents a summary of the evaluation process.

____
### TotalCount
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Total number of deployed service packages of the deployed application in the health store.

____
### UnhealthyEvaluations
__Type__: array of [HealthEvaluationWrapper](model-HealthEvaluationWrapper.md) <br/>
__Required__: No<br/>
<br/>
List of unhealthy evaluations that led to the aggregated health state. Includes all the unhealthy DeployedServicePackageHealthEvaluation that impacted the aggregated health.
