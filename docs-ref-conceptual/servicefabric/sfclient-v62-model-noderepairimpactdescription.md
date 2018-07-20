---
title: "NodeRepairImpactDescription"
ms.date: "2018-04-23"
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
# NodeRepairImpactDescription

Describes the expected impact of a repair on a set of nodes.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`NodeImpactList`](#nodeimpactlist) | array of [NodeImpact](sfclient-v62-model-nodeimpact.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Node' for objects of type 'NodeRepairImpactDescription'.

____
### `NodeImpactList`
__Type__: array of [NodeImpact](sfclient-v62-model-nodeimpact.md) <br/>
__Required__: No<br/>
<br/>
The list of nodes impacted by a repair action and their respective expected impact.
