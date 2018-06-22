---
title: "ApplicationHealthPolicy"
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
# ApplicationHealthPolicy

Defines a health policy used to evaluate the health of an application or one of its children entities.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [defaultServiceTypeHealthPolicy](#defaultservicetypehealthpolicy) | [ServiceTypeHealthPolicy](sfrp-model-servicetypehealthpolicy.md) | No |
| [serviceTypeHealthPolicies](#servicetypehealthpolicies) | map of string to [ServiceTypeHealthPolicy](sfrp-model-servicetypehealthpolicy.md) | No |

____
### defaultServiceTypeHealthPolicy
__Type__: [ServiceTypeHealthPolicy](sfrp-model-servicetypehealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
The health policy used by default to evaluate the health of a service type.

____
### serviceTypeHealthPolicies
__Type__: map of string to [ServiceTypeHealthPolicy](sfrp-model-servicetypehealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
The map with service type health policy per service type name. The map is empty by default.
