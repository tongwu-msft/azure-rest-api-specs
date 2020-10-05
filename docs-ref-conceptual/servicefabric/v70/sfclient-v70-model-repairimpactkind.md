---
title: "RepairImpactKind"
ms.date: "11/23/2019"
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
# RepairImpactKind enum

type: string

Specifies the kind of the impact. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'

Possible values are: 

  - `Invalid` - The repair impact is not valid or is of an unknown type.
  - `Node` - The repair impact affects a set of Service Fabric nodes.

