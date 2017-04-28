---
title: "StartedChaosEvent"
ms.date: "2017-04-28"
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
# StartedChaosEvent

Describes a Chaos event that gets generated when Chaos is started.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [TimeStampUtc](#timestamputc) | string (date-time) | Yes |
| [ChaosParameters](#chaosparameters) | [ChaosParameters](sfclient-model-chaosparameters.md) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Started' for objects of type 'StartedChaosEvent'.

____
### TimeStampUtc
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>


____
### ChaosParameters
__Type__: [ChaosParameters](sfclient-model-chaosparameters.md) <br/>
__Required__: No<br/>
<br/>
Defines all the parameters to configure a Chaos run.

