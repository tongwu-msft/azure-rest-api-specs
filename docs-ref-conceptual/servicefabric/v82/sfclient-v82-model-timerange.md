---
title: "TimeRange v82"
description: "TimeRange v82"
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
# TimeRange v82

Defines a time range in a 24 hour day specified by a start and end time.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StartTime`](#starttime) | [TimeOfDay](sfclient-v82-model-timeofday.md) | No |
| [`EndTime`](#endtime) | [TimeOfDay](sfclient-v82-model-timeofday.md) | No |

____
### `StartTime`
__Type__: [TimeOfDay](sfclient-v82-model-timeofday.md) <br/>
__Required__: No<br/>
<br/>
Defines an hour and minute of the day specified in 24 hour time.

____
### `EndTime`
__Type__: [TimeOfDay](sfclient-v82-model-timeofday.md) <br/>
__Required__: No<br/>
<br/>
Defines an hour and minute of the day specified in 24 hour time.
