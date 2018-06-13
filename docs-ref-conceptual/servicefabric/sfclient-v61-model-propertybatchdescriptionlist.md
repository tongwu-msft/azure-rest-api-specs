---
title: "PropertyBatchDescriptionList"
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
# PropertyBatchDescriptionList

Describes a list of property batch operations to be executed. Either all or none of the operations will be committed.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Operations](#operations) | array of [PropertyBatchOperation](sfclient-v61-model-propertybatchoperation.md) | No |

____
### Operations
__Type__: array of [PropertyBatchOperation](sfclient-v61-model-propertybatchoperation.md) <br/>
__Required__: No<br/>
<br/>
A list of the property batch operations to be executed.
