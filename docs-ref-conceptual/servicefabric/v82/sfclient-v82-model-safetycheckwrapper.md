---
title: "SafetyCheckWrapper v82"
description: "SafetyCheckWrapper v82"
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
# SafetyCheckWrapper v82

A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`SafetyCheck`](#safetycheck) | [SafetyCheck](sfclient-v82-model-safetycheck.md) | No |

____
### `SafetyCheck`
__Type__: [SafetyCheck](sfclient-v82-model-safetycheck.md) <br/>
__Required__: No<br/>
<br/>
Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.
