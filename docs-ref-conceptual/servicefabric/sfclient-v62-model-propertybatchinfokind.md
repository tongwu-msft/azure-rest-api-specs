---
title: "PropertyBatchInfoKind"
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
# PropertyBatchInfoKind enum

type: string

The kind of property batch info, determined by the results of a property batch. The following are the possible values.

Possible values are: 

  - `Invalid` - Indicates the property batch info is invalid. All Service Fabric enumerations have the invalid type.
  - `Successful` - The property batch succeeded.
  - `Failed` - The property batch failed.

