---
title: "ScalingPolicyDescription"
ms.date: "2018-04-23"
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
# ScalingPolicyDescription

Describes how the scaling should be performed

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ScalingTrigger`](#scalingtrigger) | [ScalingTriggerDescription](sfclient-model-scalingtriggerdescription.md) | Yes |
| [`ScalingMechanism`](#scalingmechanism) | [ScalingMechanismDescription](sfclient-model-scalingmechanismdescription.md) | Yes |

____
### `ScalingTrigger`
__Type__: [ScalingTriggerDescription](sfclient-model-scalingtriggerdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Specifies the trigger associated with this scaling policy

____
### `ScalingMechanism`
__Type__: [ScalingMechanismDescription](sfclient-model-scalingmechanismdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Specifies the mechanism associated with this scaling policy
