---
title: "FailedPropertyBatchInfo v82"
description: "FailedPropertyBatchInfo v82"
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
# FailedPropertyBatchInfo v82

Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ErrorMessage`](#errormessage) | string | No |
| [`OperationIndex`](#operationindex) | integer | No |

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
