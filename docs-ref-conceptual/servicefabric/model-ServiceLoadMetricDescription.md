---
title: "ServiceLoadMetricDescription"
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

Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight. Possible values are following.

  - Zero - Disables resource balancing for this metric. This value is zero.
  - Low - Specifies the metric weight of the service load as Low. The value is 1.
  - Medium - Specifies the metric weight of the service load as Medium. The value is 2.
  - High - Specifies the metric weight of the service load as High. The value is 3.



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
