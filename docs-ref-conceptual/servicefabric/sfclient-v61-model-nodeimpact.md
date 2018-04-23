---
title: "NodeImpact"
ms.date: "2018-01-22"
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
# NodeImpact

Describes the expected impact of a repair to a particular node.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [NodeName](#nodename) | string | Yes |
| [ImpactLevel](#impactlevel) | string (enum) | No |

____
### NodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the impacted node.

____
### ImpactLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The level of impact expected.



