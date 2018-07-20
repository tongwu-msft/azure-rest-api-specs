---
title: "RepairTaskHealthCheckState"
ms.date: "2018-07-20"
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
# RepairTaskHealthCheckState enum

type: string

Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.

Possible values are: 

  - `NotStarted` - Indicates that the health check has not started.
  - `InProgress` - Indicates that the health check is in progress.
  - `Succeeded` - Indicates that the health check succeeded.
  - `Skipped` - Indicates that the health check was skipped.
  - `TimedOut` - Indicates that the health check timed out.

