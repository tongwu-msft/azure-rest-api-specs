---
title: "NodeImpact v82"
description: "NodeImpact v82"
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
# NodeImpact v82

Describes the expected impact of a repair to a particular node.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`NodeName`](#nodename) | string | Yes |
| [`ImpactLevel`](#impactlevel) | string (enum) | No |

____
### `NodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the impacted node.

____
### `ImpactLevel`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The level of impact expected.



