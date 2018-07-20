---
title: "PropertyBatchOperationKind"
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
# PropertyBatchOperationKind enum

type: string

The kind of property batch operation, determined by the operation to be performed. The following are the possible values.

Possible values are: 

  - `Invalid` - Indicates the property operation is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Put` - The operation will create or edit a property. The value is 1.
  - `Get` - The operation will get a property. The value is 2.
  - `CheckExists` - The operation will check that a property exists or doesn't exists, depending on the provided value. The value is 3.
  - `CheckSequence` - The operation will ensure that the sequence number is equal to the provided value. The value is 4.
  - `Delete` - The operation will delete a property. The value is 5.
  - `CheckValue` - The operation will ensure that the value of a property is equal to the provided value. The value is 7.

