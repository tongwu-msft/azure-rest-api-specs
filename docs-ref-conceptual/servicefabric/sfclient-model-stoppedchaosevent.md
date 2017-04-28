---
title: "StoppedChaosEvent"
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
# StoppedChaosEvent

Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [TimeStampUtc](#timestamputc) | string (date-time) | Yes |
| [Reason](#reason) | string | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stopped' for objects of type 'StoppedChaosEvent'.

____
### TimeStampUtc
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>


____
### Reason
__Type__: string <br/>
__Required__: No<br/>
<br/>

