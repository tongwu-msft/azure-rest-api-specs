---
title: Service type health policy evaluation
description: "Learn about ServiceTypeHealthPolicy that represents the health policy used to evaluate the health of services belonging to a service type."
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# Service type health policy evaluation

Represents the health policy used to evaluate the health of services belonging to a service type.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [maxPercentUnhealthyServices](#maxpercentunhealthyservices) | integer | No |

____
### maxPercentUnhealthyServices
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum percentage of services allowed to be unhealthy before your application is considered in error.

