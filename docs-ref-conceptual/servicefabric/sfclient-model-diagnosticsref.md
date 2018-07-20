---
title: "DiagnosticsRef"
ms.date: "2018-07-20"
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
# DiagnosticsRef

Reference to sinks in DiagnosticsDescription.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`enabled`](#enabled) | boolean | No |
| [`sinkRefs`](#sinkrefs) | array of string | No |

____
### `enabled`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Status of whether or not sinks are enabled.

____
### `sinkRefs`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
List of sinks to be used if enabled. References the list of sinks in DiagnosticsDescription.
