---
title: "SuccessfulPropertyBatchInfo"
ms.date: "11/23/2019"
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
# SuccessfulPropertyBatchInfo

Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Properties`](#properties) | map of string to [PropertyInfo](sfclient-v70-model-propertyinfo.md) | No |

____
### `Properties`
__Type__: map of string to [PropertyInfo](sfclient-v70-model-propertyinfo.md) <br/>
__Required__: No<br/>
<br/>
A map containing the properties that were requested through any "Get" property batch operations. The key represents the index of the "Get" operation in the original request, in string form. The value is the property. If a property is not found, it will not be in the map.
