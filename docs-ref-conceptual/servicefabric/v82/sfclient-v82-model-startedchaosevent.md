---
title: "StartedChaosEvent v82"
description: "StartedChaosEvent v82"
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
# StartedChaosEvent v82

Describes a Chaos event that gets generated when Chaos is started.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`TimeStampUtc`](#timestamputc) | string (date-time) | Yes |
| [`ChaosParameters`](#chaosparameters) | [ChaosParameters](sfclient-v82-model-chaosparameters.md) | No |

____
### `TimeStampUtc`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
The UTC timestamp when this Chaos event was generated.

____
### `ChaosParameters`
__Type__: [ChaosParameters](sfclient-v82-model-chaosparameters.md) <br/>
__Required__: No<br/>
<br/>
Defines all the parameters to configure a Chaos run.

