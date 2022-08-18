---
title: "ReplicaHealthReportServiceKind v82"
description: "ReplicaHealthReportServiceKind v82"
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
# ReplicaHealthReportServiceKind enum v82

type: string

Possible values include: 'Stateless', 'Stateful'

Possible values are: 

  - `Stateless` - Does not use Service Fabric to make its state highly available or reliable. The value is 1
  - `Stateful` - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.

