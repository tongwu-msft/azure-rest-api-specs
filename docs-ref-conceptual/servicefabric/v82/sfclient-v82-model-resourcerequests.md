---
title: "ResourceRequests v82"
description: "ResourceRequests v82"
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
# ResourceRequests v82

This type describes the requested resources for a given container. It describes the least amount of resources required for the container. A container can consume more than requested resources up to the specified limits before being restarted. Currently, the requested resources are treated as limits.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`memoryInGB`](#memoryingb) | number (double) | Yes |
| [`cpu`](#cpu) | number (double) | Yes |

____
### `memoryInGB`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
The memory request in GB for this container.

____
### `cpu`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Requested number of CPU cores. At present, only full cores are supported.
