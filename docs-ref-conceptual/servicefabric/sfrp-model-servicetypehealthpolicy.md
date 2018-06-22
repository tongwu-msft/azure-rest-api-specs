---
title: "ServiceTypeHealthPolicy"
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
# ServiceTypeHealthPolicy

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

