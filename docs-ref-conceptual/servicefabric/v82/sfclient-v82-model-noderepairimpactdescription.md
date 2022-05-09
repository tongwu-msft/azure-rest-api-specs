---
title: "NodeRepairImpactDescription v82"
description: "NodeRepairImpactDescription v82"
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
# NodeRepairImpactDescription v82

Describes the expected impact of a repair on a set of nodes.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`NodeImpactList`](#nodeimpactlist) | array of [NodeImpact](sfclient-v82-model-nodeimpact.md) | No |

____
### `NodeImpactList`
__Type__: array of [NodeImpact](sfclient-v82-model-nodeimpact.md) <br/>
__Required__: No<br/>
<br/>
The list of nodes impacted by a repair action and their respective expected impact.
