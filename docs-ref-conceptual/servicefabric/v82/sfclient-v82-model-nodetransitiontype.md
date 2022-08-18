---
title: "NodeTransitionType v82"
description: "NodeTransitionType v82"
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
# NodeTransitionType enum v82

type: string

Possible values include: 'Invalid', 'Start', 'Stop'

Possible values are: 

  - `Invalid` - Reserved.  Do not pass into API.
  - `Start` - Transition a stopped node to up.
  - `Stop` - Transition an up node to stopped.

