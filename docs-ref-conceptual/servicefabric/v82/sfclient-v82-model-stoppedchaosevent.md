---
title: "StoppedChaosEvent v82"
description: "StoppedChaosEvent v82"
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
# StoppedChaosEvent v82

Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`TimeStampUtc`](#timestamputc) | string (date-time) | Yes |
| [`Reason`](#reason) | string | No |

____
### `TimeStampUtc`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
The UTC timestamp when this Chaos event was generated.

____
### `Reason`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Describes why Chaos stopped. Chaos can stop because of StopChaos API call or the timeToRun provided in ChaosParameters is over.
