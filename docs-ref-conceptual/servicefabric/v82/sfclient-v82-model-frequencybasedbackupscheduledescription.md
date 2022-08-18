---
title: "FrequencyBasedBackupScheduleDescription v82"
description: "FrequencyBasedBackupScheduleDescription v82"
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
# FrequencyBasedBackupScheduleDescription v82

Describes the frequency based backup schedule.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Interval`](#interval) | string (duration) | Yes |

____
### `Interval`
__Type__: string (duration) <br/>
__Required__: Yes<br/>
<br/>
Defines the interval with which backups are periodically taken. It should be specified in ISO8601 format. Timespan in seconds is not supported and will be ignored while creating the policy.
