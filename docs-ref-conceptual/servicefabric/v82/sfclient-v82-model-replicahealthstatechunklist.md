---
title: "ReplicaHealthStateChunkList v82"
description: "ReplicaHealthStateChunkList v82"
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
# ReplicaHealthStateChunkList v82

The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Items`](#items) | array of [ReplicaHealthStateChunk](sfclient-v82-model-replicahealthstatechunk.md) | No |

____
### `Items`
__Type__: array of [ReplicaHealthStateChunk](sfclient-v82-model-replicahealthstatechunk.md) <br/>
__Required__: No<br/>
<br/>
The list of replica health state chunks that respect the input filters in the chunk query.

