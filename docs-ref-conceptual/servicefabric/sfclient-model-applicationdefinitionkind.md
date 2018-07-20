---
title: "ApplicationDefinitionKind"
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
# ApplicationDefinitionKind enum

type: string

The mechanism used to define a Service Fabric application.


Possible values are: 

  - `Invalid` - Indicates the application definition kind is invalid. All Service Fabric enumerations have the invalid type. The value is 65535.
  - `ServiceFabricApplicationDescription` - Indicates the application is defined by a Service Fabric application description. The value is 0.
  - `Compose` - Indicates the application is defined by compose file(s). The value is 1.

