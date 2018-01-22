---
title: "PropertyValue"
ms.date: "2017-10-02"
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
# PropertyValue

Describes a Service Fabric property value.
# Inheritance

The type 'PropertyValue' is a base type of the polymorphic type model with property 'Kind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Binary | [BinaryPropertyValue](sfclient-v60-model-binarypropertyvalue.md) |
| Int64 | [Int64PropertyValue](sfclient-v60-model-int64propertyvalue.md) |
| Double | [DoublePropertyValue](sfclient-v60-model-doublepropertyvalue.md) |
| String | [StringPropertyValue](sfclient-v60-model-stringpropertyvalue.md) |
| Guid | [GuidPropertyValue](sfclient-v60-model-guidpropertyvalue.md) |

