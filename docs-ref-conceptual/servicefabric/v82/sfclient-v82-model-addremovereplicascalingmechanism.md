---
title: "AddRemoveReplicaScalingMechanism v82"
description: "AddRemoveReplicaScalingMechanism v82"
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
# AddRemoveReplicaScalingMechanism v82

Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`minCount`](#mincount) | integer | Yes |
| [`maxCount`](#maxcount) | integer | Yes |
| [`scaleIncrement`](#scaleincrement) | integer | Yes |

____
### `minCount`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Minimum number of containers (scale down won't be performed below this number).

____
### `maxCount`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Maximum number of containers (scale up won't be performed above this number).

____
### `scaleIncrement`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Each time auto scaling is performed, this number of containers will be added or removed.
