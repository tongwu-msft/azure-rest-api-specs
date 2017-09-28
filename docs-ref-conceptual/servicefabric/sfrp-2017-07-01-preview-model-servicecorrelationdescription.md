---
title: "ServiceCorrelationDescription"
ms.date: "2017-09-28"
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
# ServiceCorrelationDescription

Creates a particular correlation between services.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Scheme](#scheme) | string (enum) | Yes |
| [ServiceName](#servicename) | string | Yes |

____
### Scheme
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
The ServiceCorrelationScheme which describes the relationship between this service and the service specified via ServiceName.

The ServiceCorrelationScheme which describes the relationship between this service and the service specified via ServiceName.


____
### ServiceName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the service that the correlation relationship is established with.
