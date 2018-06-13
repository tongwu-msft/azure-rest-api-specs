---
title: "ChaosScheduleJob"
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
# ChaosScheduleJob

Defines a repetition rule and parameters of Chaos to be used with the Chaos Schedule.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ChaosParameters`](#chaosparameters) | string | No |
| [`Days`](#days) | [ChaosScheduleJobActiveDaysOfWeek](sfclient-model-chaosschedulejobactivedaysofweek.md) | No |
| [`Times`](#times) | array of [TimeRange](sfclient-model-timerange.md) | No |

____
### `ChaosParameters`
__Type__: string <br/>
__Required__: No<br/>
<br/>
A reference to which Chaos Parameters of the Chaos Schedule to use.


____
### `Days`
__Type__: [ChaosScheduleJobActiveDaysOfWeek](sfclient-model-chaosschedulejobactivedaysofweek.md) <br/>
__Required__: No<br/>
<br/>
Defines the days of the week that a Chaos Schedule Job will run for.

____
### `Times`
__Type__: array of [TimeRange](sfclient-model-timerange.md) <br/>
__Required__: No<br/>
<br/>
A list of Time Ranges that specify when during active days that this job will run. The times are interpreted as UTC.

