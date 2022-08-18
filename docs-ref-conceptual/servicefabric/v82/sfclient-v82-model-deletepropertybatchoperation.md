---
title: "DeletePropertyBatchOperation v82"
description: "DeletePropertyBatchOperation v82"
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
# DeletePropertyBatchOperation v82

Represents a PropertyBatchOperation that deletes a specified property if it exists.
Note that if one PropertyBatchOperation in a PropertyBatch fails,
the entire batch fails and cannot be committed in a transactional manner.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PropertyName`](#propertyname) | string | Yes |

____
### `PropertyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric property.
