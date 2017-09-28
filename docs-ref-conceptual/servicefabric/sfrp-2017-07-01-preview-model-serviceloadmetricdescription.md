---
title: "ServiceLoadMetricDescription"
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
# ServiceLoadMetricDescription

Specifies a metric to load balance a service during runtime.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | Yes |
| [Weight](#weight) | string (enum) | No |
| [PrimaryDefaultLoad](#primarydefaultload) | integer | No |
| [SecondaryDefaultLoad](#secondarydefaultload) | integer | No |
| [DefaultLoad](#defaultload) | integer | No |

____
### Name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the metric. If the service chooses to report load during runtime, the load metric name should match the name that is specified in Name exactly. Note that metric names are case sensitive.

____
### Weight
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The service load metric relative weight, compared to other metrics configured for this service, as a number.

The service load metric relative weight, compared to other metrics configured for this service, as a number.


____
### PrimaryDefaultLoad
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Used only for Stateful services. The default amount of load, as a number, that this service creates for this metric when it is a Primary replica.

____
### SecondaryDefaultLoad
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Used only for Stateful services. The default amount of load, as a number, that this service creates for this metric when it is a Secondary replica.

____
### DefaultLoad
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Used only for Stateless services. The default amount of load, as a number, that this service creates for this metric.
