---
title: "PropertyDescription v82"
description: "PropertyDescription v82"
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
# PropertyDescription v82

Description of a Service Fabric property.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PropertyName`](#propertyname) | string | Yes |
| [`CustomTypeId`](#customtypeid) | string | No |
| [`Value`](#value) | [PropertyValue](sfclient-v82-model-propertyvalue.md) | Yes |

____
### `PropertyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### `CustomTypeId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The property's custom type ID. Using this property, the user is able to tag the type of the value of the property.

____
### `Value`
__Type__: [PropertyValue](sfclient-v82-model-propertyvalue.md) <br/>
__Required__: Yes<br/>
<br/>
Describes a Service Fabric property value.
