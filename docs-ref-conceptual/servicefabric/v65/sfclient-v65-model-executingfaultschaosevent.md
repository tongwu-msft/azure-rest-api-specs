---
title: "ExecutingFaultsChaosEvent"
ms.date: 06/12/2019
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
# ExecutingFaultsChaosEvent

Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`TimeStampUtc`](#timestamputc) | string (date-time) | Yes |
| [`Faults`](#faults) | array of string | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ExecutingFaults' for objects of type 'ExecutingFaultsChaosEvent'.

____
### `TimeStampUtc`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
The UTC timestamp when this Chaos event was generated.

____
### `Faults`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
List of string description of the faults that Chaos decided to execute in an iteration.
