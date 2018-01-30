---
title: "ServiceLoadMetricWeight"
ms.date: "2018-01-22"
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
# ServiceLoadMetricWeight enum

type: string

Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.

Possible values are: 

  - Zero - Disables resource balancing for this metric. This value is zero.
  - Low - Specifies the metric weight of the service load as Low. The value is 1.
  - Medium - Specifies the metric weight of the service load as Medium. The value is 2.
  - High - Specifies the metric weight of the service load as High. The value is 3.

