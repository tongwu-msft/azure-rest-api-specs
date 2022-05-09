---
title: "PartitionHealthStateChunkList v82"
description: "PartitionHealthStateChunkList v82"
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
# PartitionHealthStateChunkList v82

The list of partition health state chunks that respect the input filters in the chunk query description.
Returned by get cluster health state chunks query as part of the parent application hierarchy.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Items`](#items) | array of [PartitionHealthStateChunk](sfclient-v82-model-partitionhealthstatechunk.md) | No |

____
### `Items`
__Type__: array of [PartitionHealthStateChunk](sfclient-v82-model-partitionhealthstatechunk.md) <br/>
__Required__: No<br/>
<br/>
The list of partition health state chunks that respect the input filters in the chunk query.

