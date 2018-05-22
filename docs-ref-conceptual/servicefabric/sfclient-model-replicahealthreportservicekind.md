---
title: "ReplicaHealthReportServiceKind"
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
# ReplicaHealthReportServiceKind enum

type: string

Possible values include: 'Stateless', 'Stateful'

Possible values are: 

  - `Stateless` - Does not use Service Fabric to make its state highly available or reliable. The value is 1
  - `Stateful` - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.

