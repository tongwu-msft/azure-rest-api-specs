---
title: "DiagnosticsDescription"
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
# DiagnosticsDescription

Describes the diagnostics options available

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`sinks`](#sinks) | array of [DiagnosticsSinkProperties](sfclient-model-diagnosticssinkproperties.md) | No |
| [`enabled`](#enabled) | boolean | No |
| [`defaultSinkRefs`](#defaultsinkrefs) | array of string | No |

____
### `sinks`
__Type__: array of [DiagnosticsSinkProperties](sfclient-model-diagnosticssinkproperties.md) <br/>
__Required__: No<br/>
<br/>
List of supported sinks that can be referenced.

____
### `enabled`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Status of whether or not sinks are enabled.

____
### `defaultSinkRefs`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
The sinks to be used if diagnostics is enabled. Sink choices can be overridden at the service and code package level.
