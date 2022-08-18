---
title: "Service kinds and values"
description: API reference documentation for the operations available in the ServiceKind REST API.
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# Service kinds and values

type: string

The kind of service (Stateless or Stateful).

Possible values are: 

  - Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.
  - Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.

