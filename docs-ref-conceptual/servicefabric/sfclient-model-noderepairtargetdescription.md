---
title: "NodeRepairTargetDescription"
ms.date: "11/23/2019"
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
# NodeRepairTargetDescription

Describes the list of nodes targeted by a repair action.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`NodeNames`](#nodenames) | array of string | No |

____
### `NodeNames`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
The list of nodes targeted by a repair action.
