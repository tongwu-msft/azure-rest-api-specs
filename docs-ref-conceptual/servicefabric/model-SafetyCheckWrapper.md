---
title: "SafetyCheckWrapper"
ms.date: "2017-04-26"
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
# SafetyCheckWrapper

A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [SafetyCheck](#safetycheck) | [SafetyCheck](model-SafetyCheck.md) | No |

____
### SafetyCheck
__Type__: [SafetyCheck](model-SafetyCheck.md) <br/>
__Required__: No<br/>
<br/>
Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the avaiability of the service and the reliability of the state.
