---
title: "Int64PropertyValue"
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
# Int64PropertyValue

Describes a Service Fabric property value of type Int64.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [Data](#data) | string (int64) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Int64' for objects of type 'Int64PropertyValue'.

____
### Data
__Type__: string (int64) <br/>
__Required__: Yes<br/>
<br/>
The data of the property value.
