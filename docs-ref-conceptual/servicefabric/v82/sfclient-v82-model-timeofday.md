---
title: "TimeOfDay v82"
description: "TimeOfDay v82"
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
# TimeOfDay v82

Defines an hour and minute of the day specified in 24 hour time.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Hour`](#hour) | integer (int32) | No |
| [`Minute`](#minute) | integer (int32) | No |

____
### `Hour`
__Type__: integer (int32) <br/>
__Required__: No<br/>
__InclusiveMaximum__: `23` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
Represents the hour of the day. Value must be between 0 and 23 inclusive.

____
### `Minute`
__Type__: integer (int32) <br/>
__Required__: No<br/>
__InclusiveMaximum__: `59` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
Represents the minute of the hour. Value must be between 0 to 59 inclusive.
