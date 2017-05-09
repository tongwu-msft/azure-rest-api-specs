---
title: "NodeId"
ms.date: "2017-05-08"
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
# NodeId

An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Id](#id) | string | No |

____
### Id
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value of the node Id. This is a 128 bit integer.
