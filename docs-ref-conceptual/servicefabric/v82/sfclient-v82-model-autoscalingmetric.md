---
title: "AutoScalingMetric v82"
description: "AutoScalingMetric v82"
ms.date: "10/21/2020"
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
# AutoScalingMetric v82

Describes the metric that is used for triggering auto scaling operation. Derived classes will describe resources or metrics.
## Inheritance

'AutoScalingMetric' is the base type of the polymorphic type model. The 'kind' property is the discriminator for the derived types. 
The value of the 'kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| kind | Derived Type |
| --- | --- | 
| Resource | [AutoScalingResourceMetric](sfclient-v82-model-autoscalingresourcemetric.md) |

