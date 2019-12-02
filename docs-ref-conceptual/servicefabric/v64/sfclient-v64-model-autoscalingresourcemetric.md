---
title: "AutoScalingResourceMetric"
ms.date: 11/26/2018
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
# AutoScalingResourceMetric

Describes the resource that is used for triggering auto scaling.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`kind`](#kind) | string | Yes |
| [`name`](#name) | string (enum) | Yes |

____
### kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Resource' for objects of type 'AutoScalingResourceMetric'.

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


