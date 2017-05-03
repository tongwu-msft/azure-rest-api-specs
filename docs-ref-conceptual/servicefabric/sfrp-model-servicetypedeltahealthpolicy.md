---
title: "ServiceTypeDeltaHealthPolicy"
ms.date: "2017-05-03"
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
# ServiceTypeDeltaHealthPolicy

Service health policy


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [maxPercentDeltaUnhealthyServices](#maxpercentdeltaunhealthyservices) | integer | No |

____
### maxPercentDeltaUnhealthyServices
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
Maximum percentage of unhealthy services in cluster
