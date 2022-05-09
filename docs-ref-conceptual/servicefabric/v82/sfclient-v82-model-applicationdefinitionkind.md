---
title: "ApplicationDefinitionKind v82"
description: "ApplicationDefinitionKind v82"
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
# ApplicationDefinitionKind enum v82

type: string

The mechanism used to define a Service Fabric application.


Possible values are: 

  - `Invalid` - Indicates the application definition kind is invalid. All Service Fabric enumerations have the invalid type. The value is 65535.
  - `ServiceFabricApplicationDescription` - Indicates the application is defined by a Service Fabric application description. The value is 0.
  - `Compose` - Indicates the application is defined by compose file(s). The value is 1.

