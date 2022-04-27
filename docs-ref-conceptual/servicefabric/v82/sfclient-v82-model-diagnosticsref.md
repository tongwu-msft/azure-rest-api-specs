---
title: "Diagnostics referenc v82"
description: "DiagnosticsRef v82e"
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
# Diagnostics reference v82

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
