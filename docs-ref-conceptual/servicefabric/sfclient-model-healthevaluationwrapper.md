---
title: "HealthEvaluationWrapper"
ms.date: "2017-05-08"
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
# HealthEvaluationWrapper

Wrapper object for health evaluation.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [HealthEvaluation](#healthevaluation) | [HealthEvaluation](sfclient-model-healthevaluation.md) | No |

____
### HealthEvaluation
__Type__: [HealthEvaluation](sfclient-model-healthevaluation.md) <br/>
__Required__: No<br/>
<br/>
Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.
