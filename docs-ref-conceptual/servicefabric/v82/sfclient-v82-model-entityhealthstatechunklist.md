---
title: "EntityHealthStateChunkList v82"
description: "EntityHealthStateChunkList v82"
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
# EntityHealthStateChunkList v82

A base type for the list of health state chunks found in the cluster. It contains the total number of health states that match the input filters.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`TotalCount`](#totalcount) | integer (int64) | No |

____
### `TotalCount`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Total number of entity health state objects that match the specified filters from the cluster health chunk query description.

