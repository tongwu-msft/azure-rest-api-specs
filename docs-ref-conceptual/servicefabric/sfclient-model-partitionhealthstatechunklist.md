---
title: "PartitionHealthStateChunkList"
ms.date: "2017-05-06"
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
# PartitionHealthStateChunkList

The list of partition health state chunks that respect the input filters in the chunk query description.
Returned by get cluster health state chunks query as part of the parent application hierarchy.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Items](#items) | array of [PartitionHealthStateChunk](sfclient-model-partitionhealthstatechunk.md) | No |

____
### Items
__Type__: array of [PartitionHealthStateChunk](sfclient-model-partitionhealthstatechunk.md) <br/>
__Required__: No<br/>
<br/>
The list of partition health state chunks that respect the input filters in the chunk query.

