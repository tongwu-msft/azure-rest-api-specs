---
title: "EventHealthEvaluation"
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
# EventHealthEvaluation

Represents health evaluation of a HealthEvent that was reported on the entity.
The health evaluation is returned when evaluating health of an entity results in Error or Warning.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [AggregatedHealthState](#aggregatedhealthstate) | string (enum) | No |
| [Description](#description) | string | No |
| [ConsiderWarningAsError](#considerwarningaserror) | boolean | No |
| [UnhealthyEvent](#unhealthyevent) | [HealthEvent](sfclient-model-healthevent.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Event' for objects of type 'EventHealthEvaluation'.

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
### ConsiderWarningAsError
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates whether warnings are treated with the same severity as errors. The field is specified in the health policy used to evaluate the entity.

____
### UnhealthyEvent
__Type__: [HealthEvent](sfclient-model-healthevent.md) <br/>
__Required__: No<br/>
<br/>
Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.

