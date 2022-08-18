---
title: "ScalingPolicyDescription v82"
description: "ScalingPolicyDescription v82"
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
# ScalingPolicyDescription v82

Describes how the scaling should be performed

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ScalingTrigger`](#scalingtrigger) | [ScalingTriggerDescription](sfclient-v82-model-scalingtriggerdescription.md) | Yes |
| [`ScalingMechanism`](#scalingmechanism) | [ScalingMechanismDescription](sfclient-v82-model-scalingmechanismdescription.md) | Yes |

____
### `ScalingTrigger`
__Type__: [ScalingTriggerDescription](sfclient-v82-model-scalingtriggerdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Specifies the trigger associated with this scaling policy

____
### `ScalingMechanism`
__Type__: [ScalingMechanismDescription](sfclient-v82-model-scalingmechanismdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Specifies the mechanism associated with this scaling policy
