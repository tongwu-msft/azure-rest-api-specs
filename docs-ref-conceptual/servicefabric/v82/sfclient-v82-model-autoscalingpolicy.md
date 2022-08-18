---
title: "AutoScalingPolicy v82"
description: "AutoScalingPolicy v82"
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
# AutoScalingPolicy v82

Describes the auto scaling policy

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`trigger`](#trigger) | [AutoScalingTrigger](sfclient-v82-model-autoscalingtrigger.md) | Yes |
| [`mechanism`](#mechanism) | [AutoScalingMechanism](sfclient-v82-model-autoscalingmechanism.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the auto scaling policy.

____
### `trigger`
__Type__: [AutoScalingTrigger](sfclient-v82-model-autoscalingtrigger.md) <br/>
__Required__: Yes<br/>
<br/>
Determines when auto scaling operation will be invoked.

____
### `mechanism`
__Type__: [AutoScalingMechanism](sfclient-v82-model-autoscalingmechanism.md) <br/>
__Required__: Yes<br/>
<br/>
The mechanism that is used to scale when auto scaling operation is invoked.
