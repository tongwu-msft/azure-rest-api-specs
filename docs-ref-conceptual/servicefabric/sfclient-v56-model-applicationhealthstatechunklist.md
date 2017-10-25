---
title: "ApplicationHealthStateChunkList"
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
# ApplicationHealthStateChunkList

The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [TotalCount](#totalcount) | integer (int64) | No |
| [Items](#items) | array of [ApplicationHealthStateChunk](sfclient-v56-model-applicationhealthstatechunk.md) | No |

____
### TotalCount
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Total number of entity health state objects that match the specified filters from the cluster health chunk query description.


____
### Items
__Type__: array of [ApplicationHealthStateChunk](sfclient-v56-model-applicationhealthstatechunk.md) <br/>
__Required__: No<br/>
<br/>
The list of application health state chunks that respect the input filters in the chunk query.

