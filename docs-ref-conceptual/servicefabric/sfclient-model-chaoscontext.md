---
title: "ChaosContext"
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
# ChaosContext

Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about
the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long. 
This map is set by the starter of the Chaos run to optionally store the context about the specific run. 


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Map](#map) | object | No |

____
### Map
__Type__: object <br/>
__Required__: No<br/>
<br/>
Describes a map that contains a collection of ChaosContextMapItem's.

