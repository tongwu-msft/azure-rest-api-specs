---
title: "ApplicationHealthPolicyMapItem"
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
# ApplicationHealthPolicyMapItem

Defines an item in ApplicationHealthPolicyMap.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Key](#key) | string | Yes |
| [Value](#value) | [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) | Yes |

____
### Key
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key of the application health policy map item. This is the name of the application.

____
### Value
__Type__: [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) <br/>
__Required__: Yes<br/>
<br/>
The value of the application health policy map item. This is the ApplicationHealthPolicy for this application.
