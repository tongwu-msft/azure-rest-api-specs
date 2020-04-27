---
title: "RestartPolicy"
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
# RestartPolicy enum

type: string

Enumerates the restart policy for RunToCompletionExecutionPolicy

Possible values are: 

  - `onFailure` - Service will be restarted when it encounters a failure.
  - `never` - Service will never be restarted. If the service encounters a failure, it will move to Failed state.

