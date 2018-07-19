---
title: "RepairTargetKind"
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
# RepairTargetKind enum

type: string

Specifies the kind of the repair target. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'

Possible values are: 

  - `Invalid` - The repair target is not valid or is of an unknown type.
  - `Node` - The repair target is a set of Service Fabric nodes.

