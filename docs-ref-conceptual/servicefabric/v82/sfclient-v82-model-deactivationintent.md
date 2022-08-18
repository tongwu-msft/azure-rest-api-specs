---
title: "DeactivationIntent v82"
description: "DeactivationIntent v82"
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
# DeactivationIntent enum v82

type: string

Possible values include: 'Pause', 'Restart', 'RemoveData'

Possible values are: 

  - `Pause` - Indicates that the node should be paused. The value is 1.
  - `Restart` - Indicates that the intent is for the node to be restarted after a short period of time. The value is 2.
  - `RemoveData` - Indicates the intent is for the node to remove data. The value is 3.

