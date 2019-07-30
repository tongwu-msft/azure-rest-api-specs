---
title: "ServiceOperationName"
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
# ServiceOperationName enum

type: string

Specifies the current active life-cycle operation on a stateful service replica or stateless service instance.

Possible values are: 

  - `Unknown` - Reserved for future use.
  - `None` - The service replica or instance is not going through any life-cycle changes.
  - `Open` - The service replica or instance is being opened.
  - `ChangeRole` - The service replica is changing roles.
  - `Close` - The service replica or instance is being closed.
  - `Abort` - The service replica or instance is being aborted.

