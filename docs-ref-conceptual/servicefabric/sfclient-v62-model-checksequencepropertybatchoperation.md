---
title: "CheckSequencePropertyBatchOperation"
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
# CheckSequencePropertyBatchOperation

Compares the Sequence Number of a property with the SequenceNumber argument.
A property's sequence number can be thought of as that property's version.
Every time the property is modified, its sequence number is increased.
The sequence number can be found in a property's metadata.
The comparison fails if the sequence numbers are not equal.
CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.
Note that if one PropertyBatchOperation in a PropertyBatch fails,
the entire batch fails and cannot be committed in a transactional manner.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`PropertyName`](#propertyname) | string | Yes |
| [`SequenceNumber`](#sequencenumber) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'CheckSequence' for objects of type 'CheckSequencePropertyBatchOperation'.

____
### `PropertyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### `SequenceNumber`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The expected sequence number.
