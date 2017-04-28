---
title: "ApplicationCapacityDescription"
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
# ApplicationCapacityDescription

Describes capacity information for services of this application. This description can be used for describing the following.
- Reserving the capacity for the services on the nodes
- Limiting the total number of nodes that services of this application can run on
- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [MinimumNodes](#minimumnodes) | integer (int64) | No |
| [MaximumNodes](#maximumnodes) | integer (int64) | No |
| [ApplicationMetrics](#applicationmetrics) | array of [ApplicationMetricDescription](model-ApplicationMetricDescription.md) | No |

____
### MinimumNodes
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The minimum number of nodes where Service Fabric will reserve capacity for this application. Note that this does not mean that the services of this application will be placed on all of those nodes. If this property is set to zero, no capacity will be reserved. The value of this property cannot be more than the value of the MaximumNodes property.

____
### MaximumNodes
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 0 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum number of nodes where Service Fabric will reserve capacity for this application. Note that this does not mean that the services of this application will be placed on all of those nodes. By default, the value of this property is zero and it means that the services can be placed on any node.

____
### ApplicationMetrics
__Type__: array of [ApplicationMetricDescription](model-ApplicationMetricDescription.md) <br/>
__Required__: No<br/>
<br/>
List of application capacity metric description.
