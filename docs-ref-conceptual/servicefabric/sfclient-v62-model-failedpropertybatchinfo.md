---
title: "FailedPropertyBatchInfo"
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
# FailedPropertyBatchInfo

Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`ErrorMessage`](#errormessage) | string | No |
| [`OperationIndex`](#operationindex) | integer | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Failed' for objects of type 'FailedPropertyBatchInfo'.

____
### `ErrorMessage`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The error message of the failed operation. Describes the exception thrown due to the first unsuccessful operation in the property batch.

____
### `OperationIndex`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The index of the unsuccessful operation in the property batch.
