---
title: "GetPropertyBatchOperation"
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
# GetPropertyBatchOperation

Represents a PropertyBatchOperation that gets the specified property if it exists.
Note that if one PropertyBatchOperation in a PropertyBatch fails,
the entire batch fails and cannot be committed in a transactional manner.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`PropertyName`](#propertyname) | string | Yes |
| [`IncludeValue`](#includevalue) | boolean | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Get' for objects of type 'GetPropertyBatchOperation'.

____
### `PropertyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### `IncludeValue`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Whether or not to return the property value with the metadata.
True if values should be returned with the metadata; False to return only property metadata.

