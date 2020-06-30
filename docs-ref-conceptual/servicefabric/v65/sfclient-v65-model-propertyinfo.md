---
title: "PropertyInfo"
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
# PropertyInfo

Information about a Service Fabric property.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | Yes |
| [`Value`](#value) | [PropertyValue](sfclient-v65-model-propertyvalue.md) | No |
| [`Metadata`](#metadata) | [PropertyMetadata](sfclient-v65-model-propertymetadata.md) | Yes |

____
### `Name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### `Value`
__Type__: [PropertyValue](sfclient-v65-model-propertyvalue.md) <br/>
__Required__: No<br/>
<br/>
Describes a Service Fabric property value.

____
### `Metadata`
__Type__: [PropertyMetadata](sfclient-v65-model-propertymetadata.md) <br/>
__Required__: Yes<br/>
<br/>
The metadata associated with a property, including the property's name.
