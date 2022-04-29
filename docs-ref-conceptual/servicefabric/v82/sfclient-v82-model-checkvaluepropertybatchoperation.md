---
title: "CheckValuePropertyBatchOperation v82"
description: "CheckValuePropertyBatchOperation v82"
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
# CheckValuePropertyBatchOperation v82

Represents a PropertyBatchOperation that compares the value of the property with the expected value.
The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.
Note that if one PropertyBatchOperation in a PropertyBatch fails,
the entire batch fails and cannot be committed in a transactional manner.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PropertyName`](#propertyname) | string | Yes |
| [`Value`](#value) | [PropertyValue](sfclient-v82-model-propertyvalue.md) | Yes |

____
### `PropertyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### `Value`
__Type__: [PropertyValue](sfclient-v82-model-propertyvalue.md) <br/>
__Required__: Yes<br/>
<br/>
The expected property value.
