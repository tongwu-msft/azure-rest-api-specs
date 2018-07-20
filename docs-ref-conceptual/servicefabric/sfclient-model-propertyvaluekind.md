---
title: "PropertyValueKind"
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
# PropertyValueKind enum

type: string

The kind of property, determined by the type of data. Following are the possible values.

Possible values are: 

  - `Invalid` - Indicates the property is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Binary` - The data inside the property is a binary blob. The value is 1.
  - `Int64` - The data inside the property is an int64. The value is 2.
  - `Double` - The data inside the property is a double. The value is 3.
  - `String` - The data inside the property is a string. The value is 4.
  - `Guid` - The data inside the property is a guid. The value is 5.

