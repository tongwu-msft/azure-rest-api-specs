---
title: "OperationResult"
ms.date: "2017-05-03"
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
# OperationResult

Available operation list result

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [name](#name) | string | No |
| [display](#display) | [AvailableOperationDisplay](sfrp-model-availableoperationdisplay.md) | No |
| [origin](#origin) | string | No |
| [nextLink](#nextlink) | string | No |

____
### name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the operation.

____
### display
__Type__: [AvailableOperationDisplay](sfrp-model-availableoperationdisplay.md) <br/>
__Required__: No<br/>
<br/>
The object that represents the operation.

____
### origin
__Type__: string <br/>
__Required__: No<br/>
<br/>
Origin result

____
### nextLink
__Type__: string <br/>
__Required__: No<br/>
<br/>
The URL to use for getting the next set of results.
