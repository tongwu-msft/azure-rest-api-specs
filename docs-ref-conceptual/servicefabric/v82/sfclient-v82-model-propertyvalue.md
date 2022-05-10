---
title: "PropertyValue v82"
description: "PropertyValue v82"
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
# PropertyValue v82

Describes a Service Fabric property value.
## Inheritance

'PropertyValue' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Binary | [BinaryPropertyValue](sfclient-v82-model-binarypropertyvalue.md) |
| Int64 | [Int64PropertyValue](sfclient-v82-model-int64propertyvalue.md) |
| Double | [DoublePropertyValue](sfclient-v82-model-doublepropertyvalue.md) |
| String | [StringPropertyValue](sfclient-v82-model-stringpropertyvalue.md) |
| Guid | [GuidPropertyValue](sfclient-v82-model-guidpropertyvalue.md) |

