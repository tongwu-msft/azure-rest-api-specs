---
title: "ChaosSchedule"
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
# ChaosSchedule

Defines the schedule used by Chaos.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StartDate`](#startdate) | string (date-time) | No |
| [`ExpiryDate`](#expirydate) | string (date-time) | No |
| [`ChaosParametersDictionary`](#chaosparametersdictionary) | array of [ChaosParametersDictionaryItem](sfclient-model-chaosparametersdictionaryitem.md) | No |
| [`Jobs`](#jobs) | array of [ChaosScheduleJob](sfclient-model-chaosschedulejob.md) | No |

____
### `StartDate`
__Type__: string (date-time) <br/>
__Required__: No<br/>
__Default__: `1601-01-01T00:00:00.000Z` <br/>
<br/>
The date and time Chaos will start using this schedule.


____
### `ExpiryDate`
__Type__: string (date-time) <br/>
__Required__: No<br/>
__Default__: `9999-12-31T23:59:59.999Z` <br/>
<br/>
The date and time Chaos will continue to use this schedule until.


____
### `ChaosParametersDictionary`
__Type__: array of [ChaosParametersDictionaryItem](sfclient-model-chaosparametersdictionaryitem.md) <br/>
__Required__: No<br/>
<br/>
A mapping of string names to Chaos Parameters to be referenced by Chaos Schedule Jobs.


____
### `Jobs`
__Type__: array of [ChaosScheduleJob](sfclient-model-chaosschedulejob.md) <br/>
__Required__: No<br/>
<br/>
A list of all Chaos Schedule Jobs that will be automated by the schedule.

