---
title: "ApplicationTypeDefinitionKind"
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
# ApplicationTypeDefinitionKind enum

type: string

The mechanism used to define a Service Fabric application type.


Possible values are: 

  - `Invalid` - Indicates the application type definition kind is invalid. All Service Fabric enumerations have the invalid type. The value is 0.
  - `ServiceFabricApplicationPackage` - Indicates the application type is defined and created by a Service Fabric application package provided by the user. The value is 1.
  - `Compose` - Indicates the application type is defined and created implicitly as part of a compose deployment. The value is 2.

