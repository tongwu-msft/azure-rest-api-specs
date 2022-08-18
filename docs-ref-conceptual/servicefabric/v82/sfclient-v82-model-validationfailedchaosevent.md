---
title: "ValidationFailedChaosEvent v82"
description: "ValidationFailedChaosEvent v82"
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
# ValidationFailedChaosEvent v82

Chaos event corresponding to a failure during validation.

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
Describes why the ValidationFailedChaosEvent was generated. This may happen because more than MaxPercentUnhealthyNodes are unhealthy for more than MaxClusterStabilizationTimeout. This reason will be in the Reason property of the ValidationFailedChaosEvent as a string.
