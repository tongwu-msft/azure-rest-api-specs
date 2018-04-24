---
title: "ServiceTypeHealthPolicyMapItem"
ms.date: "2018-01-22"
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
# ServiceTypeHealthPolicyMapItem

Defines an item in ServiceTypeHealthPolicyMap.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Key](#key) | string | Yes |
| [Value](#value) | [ServiceTypeHealthPolicy](sfrp-2017-07-01-preview-model-servicetypehealthpolicy.md) | Yes |

____
### Key
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key of the service type health policy map item. This is the name of the service type.

____
### Value
__Type__: [ServiceTypeHealthPolicy](sfrp-2017-07-01-preview-model-servicetypehealthpolicy.md) <br/>
__Required__: Yes<br/>
<br/>
The value of the service type health policy map item. This is the ServiceTypeHealthPolicy for this service type.
