---
title: "PropertyBatchDescriptionList v81"
description: "PropertyBatchDescriptionList v81"
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
# PropertyBatchDescriptionList v81

Describes a list of property batch operations to be executed. Either all or none of the operations will be committed.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Operations`](#operations) | array of [PropertyBatchOperation](sfclient-v81-model-propertybatchoperation.md) | No |

____
### `Operations`
__Type__: array of [PropertyBatchOperation](sfclient-v81-model-propertybatchoperation.md) <br/>
__Required__: No<br/>
<br/>
A list of the property batch operations to be executed.
