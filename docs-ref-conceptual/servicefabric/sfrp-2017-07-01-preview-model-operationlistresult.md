---
title: "OperationListResult"
description: API reference documentation for the operations available in the OperationListResult REST API.
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# OperationListResult

Describes the result of the request to list Service Fabric resource provider operations.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [value](#value) | array of [OperationResult](sfrp-2017-07-01-preview-model-operationresult.md) | No |
| [nextLink](#nextlink) | string | No |

____
### value
__Type__: array of [OperationResult](sfrp-2017-07-01-preview-model-operationresult.md) <br/>
__Required__: No<br/>
<br/>
List of operations supported by the Service Fabric resource provider.

____
### nextLink
__Type__: string <br/>
__Required__: No<br/>
<br/>
URL to get the next set of operation list results if there are any.
