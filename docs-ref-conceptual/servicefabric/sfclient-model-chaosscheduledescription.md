---
title: "ChaosScheduleDescription"
ms.date: "2018-04-23"
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
# ChaosScheduleDescription

Defines the Chaos Schedule used by Chaos and the version of the Chaos Schedule. The version value wraps back to 0 after surpassing 2,147,483,647.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Version`](#version) | integer (int32) | No |
| [`Schedule`](#schedule) | [ChaosSchedule](sfclient-model-chaosschedule.md) | No |

____
### `Version`
__Type__: integer (int32) <br/>
__Required__: No<br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The version number of the Schedule.

____
### `Schedule`
__Type__: [ChaosSchedule](sfclient-model-chaosschedule.md) <br/>
__Required__: No<br/>
<br/>
Defines the schedule used by Chaos.
