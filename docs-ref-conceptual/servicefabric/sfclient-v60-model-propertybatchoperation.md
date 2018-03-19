---
title: "PropertyBatchOperation"
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
# PropertyBatchOperation

Represents the base type for property operations that can be put into a batch and submitted.
# Inheritance

The type 'PropertyBatchOperation' is a base type of the polymorphic type model with property 'Kind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| CheckExists | [CheckExistsPropertyBatchOperation](sfclient-v60-model-checkexistspropertybatchoperation.md) |
| CheckSequence | [CheckSequencePropertyBatchOperation](sfclient-v60-model-checksequencepropertybatchoperation.md) |
| CheckValue | [CheckValuePropertyBatchOperation](sfclient-v60-model-checkvaluepropertybatchoperation.md) |
| Delete | [DeletePropertyBatchOperation](sfclient-v60-model-deletepropertybatchoperation.md) |
| Get | [GetPropertyBatchOperation](sfclient-v60-model-getpropertybatchoperation.md) |
| Put | [PutPropertyBatchOperation](sfclient-v60-model-putpropertybatchoperation.md) |

