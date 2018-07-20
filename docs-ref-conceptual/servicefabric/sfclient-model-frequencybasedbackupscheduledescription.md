---
title: "FrequencyBasedBackupScheduleDescription"
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
# FrequencyBasedBackupScheduleDescription

Describes the frequency based backup schedule.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ScheduleKind`](#schedulekind) | string | Yes |
| [`Interval`](#interval) | string (duration) | Yes |

____
### ScheduleKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'FrequencyBased' for objects of type 'FrequencyBasedBackupScheduleDescription'.

____
### `Interval`
__Type__: string (duration) <br/>
__Required__: Yes<br/>
<br/>
Defines the interval with which backups are periodically taken. It should be specified in ISO8601 format. Timespan in seconds is not supported and will be ignored while creating the policy.
