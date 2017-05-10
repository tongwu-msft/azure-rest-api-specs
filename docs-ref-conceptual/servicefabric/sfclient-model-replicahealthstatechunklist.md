---
title: "ReplicaHealthStateChunkList"
ms.date: "2017-05-09"
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
# ReplicaHealthStateChunkList

The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Items](#items) | array of [ReplicaHealthStateChunk](sfclient-model-replicahealthstatechunk.md) | No |

____
### Items
__Type__: array of [ReplicaHealthStateChunk](sfclient-model-replicahealthstatechunk.md) <br/>
__Required__: No<br/>
<br/>
The list of replica health state chunks that respect the input filters in the chunk query.

