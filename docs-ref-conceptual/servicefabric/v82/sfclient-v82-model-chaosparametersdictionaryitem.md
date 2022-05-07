---
title: "ChaosParametersDictionaryItem v82"
description: "ChaosParametersDictionaryItem v82"
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
# ChaosParametersDictionaryItem v82

Defines an item in ChaosParametersDictionary of the Chaos Schedule.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Key`](#key) | string | Yes |
| [`Value`](#value) | [ChaosParameters](sfclient-v82-model-chaosparameters.md) | Yes |

____
### `Key`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key identifying the Chaos Parameter in the dictionary. This key is referenced by Chaos Schedule Jobs.

____
### `Value`
__Type__: [ChaosParameters](sfclient-v82-model-chaosparameters.md) <br/>
__Required__: Yes<br/>
<br/>
Defines all the parameters to configure a Chaos run.

