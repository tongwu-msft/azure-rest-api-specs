---
title: "ExecutionPolicy v82"
description: "ExecutionPolicy v82"
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
# ExecutionPolicy v82

The execution policy of the service
## Inheritance

'ExecutionPolicy' is the base type of the polymorphic type model. The 'type' property is the discriminator for the derived types. 
The value of the 'type' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| type | Derived Type |
| --- | --- | 
| Default | [DefaultExecutionPolicy](sfclient-v82-model-defaultexecutionpolicy.md) |
| RunToCompletion | [RunToCompletionExecutionPolicy](sfclient-v82-model-runtocompletionexecutionpolicy.md) |

