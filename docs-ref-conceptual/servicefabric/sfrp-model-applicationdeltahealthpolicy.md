---
title: "ApplicationDeltaHealthPolicy"
ms.date: "2018-05-25"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# ApplicationDeltaHealthPolicy

Defines a delta health policy used to evaluate the health of an application or one of its child entities when upgrading the cluster.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [defaultServiceTypeDeltaHealthPolicy](#defaultservicetypedeltahealthpolicy) | [ServiceTypeDeltaHealthPolicy](sfrp-model-servicetypedeltahealthpolicy.md) | No |
| [serviceTypeDeltaHealthPolicies](#servicetypedeltahealthpolicies) | map of string to [ServiceTypeDeltaHealthPolicy](sfrp-model-servicetypedeltahealthpolicy.md) | No |

____
### defaultServiceTypeDeltaHealthPolicy
__Type__: [ServiceTypeDeltaHealthPolicy](sfrp-model-servicetypedeltahealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
The delta health policy used by default to evaluate the health of a service type when upgrading the cluster.

____
### serviceTypeDeltaHealthPolicies
__Type__: map of string to [ServiceTypeDeltaHealthPolicy](sfrp-model-servicetypedeltahealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
The map with service type delta health policy per service type name. The map is empty by default.
