---
title: "ApplicationHealthPolicyMapItem"
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
# ApplicationHealthPolicyMapItem

Defines an item in ApplicationHealthPolicyMap.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Key`](#key) | string | Yes |
| [`Value`](#value) | [ApplicationHealthPolicy](sfclient-v72-model-applicationhealthpolicy.md) | Yes |

____
### `Key`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key of the application health policy map item. This is the name of the application.

____
### `Value`
__Type__: [ApplicationHealthPolicy](sfclient-v72-model-applicationhealthpolicy.md) <br/>
__Required__: Yes<br/>
<br/>
The value of the application health policy map item. This is the ApplicationHealthPolicy for this application.
