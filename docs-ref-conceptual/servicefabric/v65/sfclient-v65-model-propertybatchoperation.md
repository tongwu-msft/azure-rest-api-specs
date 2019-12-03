---
title: "PropertyBatchOperation"
ms.date: 06/12/2019
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
# PropertyBatchOperation

Represents the base type for property operations that can be put into a batch and submitted.
## Inheritance

'PropertyBatchOperation' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| CheckExists | [CheckExistsPropertyBatchOperation](sfclient-v65-model-checkexistspropertybatchoperation.md) |
| CheckSequence | [CheckSequencePropertyBatchOperation](sfclient-v65-model-checksequencepropertybatchoperation.md) |
| CheckValue | [CheckValuePropertyBatchOperation](sfclient-v65-model-checkvaluepropertybatchoperation.md) |
| Delete | [DeletePropertyBatchOperation](sfclient-v65-model-deletepropertybatchoperation.md) |
| Get | [GetPropertyBatchOperation](sfclient-v65-model-getpropertybatchoperation.md) |
| Put | [PutPropertyBatchOperation](sfclient-v65-model-putpropertybatchoperation.md) |

