---
title: "OperationListResult"
ms.date: "2017-05-16"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# OperationListResult

Describes the result of the request to list Service Fabric operations.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [value](#value) | array of [OperationResult](sfrp-model-operationresult.md) | No |
| [nextLink](#nextlink) | string | No |

____
### value
__Type__: array of [OperationResult](sfrp-model-operationresult.md) <br/>
__Required__: No<br/>
<br/>
List of Service Fabric operations supported by the Microsoft.ServiceFabric resource provider.

____
### nextLink
__Type__: string <br/>
__Required__: No<br/>
<br/>
URL to get the next set of operation list results if there are any.
