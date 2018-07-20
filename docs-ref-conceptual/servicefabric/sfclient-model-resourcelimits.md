---
title: "ResourceLimits"
ms.date: "2018-07-20"
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
# ResourceLimits

This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`memoryInGB`](#memoryingb) | number (double) | No |
| [`cpu`](#cpu) | number (double) | No |

____
### `memoryInGB`
__Type__: number (double) <br/>
__Required__: No<br/>
<br/>
The memory limit in GB.

____
### `cpu`
__Type__: number (double) <br/>
__Required__: No<br/>
<br/>
CPU limits in cores. At present, only full cores are supported.
