---
title: "TimeBasedBackupScheduleDescription"
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
# TimeBasedBackupScheduleDescription

Describes the time based backup schedule.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ScheduleKind`](#schedulekind) | string | Yes |
| [`ScheduleFrequencyType`](#schedulefrequencytype) | string (enum) | Yes |
| [`RunDays`](#rundays) | array of [DayOfWeek](sfclient-model-dayofweek.md) | No |
| [`RunTimes`](#runtimes) | array of string (date-time) | Yes |

____
### ScheduleKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'TimeBased' for objects of type 'TimeBasedBackupScheduleDescription'.

____
### `ScheduleFrequencyType`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>


Describes the frequency with which to run the time based backup schedule.


Possible values are: 

  - `Invalid` - Indicates an invalid backup schedule frequency type. All Service Fabric enumerations have the invalid type.
  - `Daily` - Indicates that the time based backup schedule is repeated at a daily frequency.
  - `Weekly` - Indicates that the time based backup schedule is repeated at a weekly frequency.



____
### `RunDays`
__Type__: array of [DayOfWeek](sfclient-model-dayofweek.md) <br/>
__Required__: No<br/>
<br/>
List of days of a week when to trigger the periodic backup. This is valid only when the backup schedule frequency type is weekly.

____
### `RunTimes`
__Type__: array of string (date-time) <br/>
__Required__: Yes<br/>
<br/>
Represents the list of exact time during the day in ISO8601 format. Like '19:00:00' will represent '7PM' during the day. Date specified along with time will be ignored.
