---
title: "EntityKindHealthStateCount"
ms.date: "2017-10-02"
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
# EntityKindHealthStateCount

Represents health state count for entities of the specified entity kind.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [EntityKind](#entitykind) | string (enum) | No |
| [HealthStateCount](#healthstatecount) | [HealthStateCount](sfclient-v60-model-healthstatecount.md) | No |

____
### EntityKind
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The entity kind for which health states are evaluated.

The entity kind for which health states are evaluated.


____
### HealthStateCount
__Type__: [HealthStateCount](sfclient-v60-model-healthstatecount.md) <br/>
__Required__: No<br/>
<br/>
The health state count for the entities of the specified kind.
