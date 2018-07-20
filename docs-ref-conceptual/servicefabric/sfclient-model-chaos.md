---
title: "Chaos"
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
# Chaos

Contains a description of Chaos.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ChaosParameters`](#chaosparameters) | [ChaosParameters](sfclient-model-chaosparameters.md) | No |
| [`Status`](#status) | string (enum) | No |
| [`ScheduleStatus`](#schedulestatus) | string (enum) | No |

____
### `ChaosParameters`
__Type__: [ChaosParameters](sfclient-model-chaosparameters.md) <br/>
__Required__: No<br/>
<br/>
If Chaos is running, these are the parameters Chaos is running with.

____
### `Status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Current status of the Chaos run.


Possible values are: 

  - `Invalid` - Indicates an invalid Chaos status. All Service Fabric enumerations have the invalid type. The valus is zero.
  - `Running` - Indicates that Chaos is not stopped. The value is one.
  - `Stopped` - Indicates that Chaos is not scheduling further faults. The value is two.



____
### `ScheduleStatus`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Current status of the schedule.


Possible values are: 

  - `Invalid` - Indicates an invalid Chaos Schedule status. All Service Fabric enumerations have the invalid type. The valus is zero.
  - `Stopped` - Indicates that the schedule is stopped and not being used to schedule runs of chaos. The value is one.
  - `Active` - Indicates that the schedule is active and is being used to schedule runs of Chaos. The value is two.
  - `Expired` - Indicates that the schedule is expired and will no longer be used to schedule runs of Chaos. The value is three.
  - `Pending` - Indicates that the schedule is pending and is not yet being used to schedule runs of Chaos but will be used when the start time is passed. The value is four.


