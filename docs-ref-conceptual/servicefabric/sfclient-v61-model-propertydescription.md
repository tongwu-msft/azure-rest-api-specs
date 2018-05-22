---
title: "PropertyDescription"
ms.date: "2018-01-22"
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
# PropertyDescription

Description of a Service Fabric property.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [PropertyName](#propertyname) | string | Yes |
| [CustomTypeId](#customtypeid) | string | No |
| [Value](#value) | [PropertyValue](sfclient-v61-model-propertyvalue.md) | Yes |

____
### PropertyName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.

____
### CustomTypeId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The property's custom type id. Using this property, the user is able to tag the type of the value of the property.

____
### Value
__Type__: [PropertyValue](sfclient-v61-model-propertyvalue.md) <br/>
__Required__: Yes<br/>
<br/>
Describes a Service Fabric property value.
