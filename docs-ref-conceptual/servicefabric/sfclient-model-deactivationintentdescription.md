---
title: "DeactivationIntentDescription"
ms.date: "2017-05-03"
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
# DeactivationIntentDescription

Describes the intent or reason for deactivating the node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [DeactivationIntent](#deactivationintent) | string (enum) | No |

____
### DeactivationIntent
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Describes the intent or reason for deactivating the node. The possible values are following.
  - Pause - Indicates that the node should be paused. The value is 1.
  - Restart - Indicates that the intent is for the node to be restarted after a short period of time. The value is 2.
  - RemoveData - Indicates the intent is for the node to remove data. The value is 3.

