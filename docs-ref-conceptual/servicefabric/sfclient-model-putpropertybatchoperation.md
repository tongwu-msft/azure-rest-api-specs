---
title: "PutPropertyBatchOperation"
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
# PutPropertyBatchOperation

Puts the specified property under the specified name.  Note that if one PropertyBatchOperation in a PropertyBatch fails,  the entire batch fails and cannot be committed in a transactional manner.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [PropertyName](#propertyname) | string | Yes |
| [Value](#value) | [PropertyValue](sfclient-model-propertyvalue.md) | Yes |
| [CustomTypeId](#customtypeid) | string | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Put' for objects of type 'PutPropertyBatchOperation'.

____
### PropertyName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### Value
__Type__: [PropertyValue](sfclient-model-propertyvalue.md) <br/>
__Required__: Yes<br/>
<br/>
Describes a Service Fabric property value.

____
### CustomTypeId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The property's custom type id. Using this property, the user is able to tag the type of the value of the property.
