---
title: "AutoScalingResourceMetric v82"
description: "AutoScalingResourceMetric v82"
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
# AutoScalingResourceMetric v82

Describes the resource that is used for triggering auto scaling.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string (enum) | Yes |

____
### `name`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
Name of the resource.

Enumerates the resources that are used for triggering auto scaling.

Possible values are: 

  - `cpu` - Indicates that the resource is CPU cores.
  - `memoryInGB` - Indicates that the resource is memory in GB.


