---
title: "ServiceTypeHealthPolicyMapItem v82"
description: "ServiceTypeHealthPolicyMapItem v82"
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
# ServiceTypeHealthPolicyMapItem v82

Defines an item in ServiceTypeHealthPolicyMap.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Key`](#key) | string | Yes |
| [`Value`](#value) | [ServiceTypeHealthPolicy](sfclient-v82-model-servicetypehealthpolicy.md) | Yes |

____
### `Key`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key of the service type health policy map item. This is the name of the service type.

____
### `Value`
__Type__: [ServiceTypeHealthPolicy](sfclient-v82-model-servicetypehealthpolicy.md) <br/>
__Required__: Yes<br/>
<br/>
The value of the service type health policy map item. This is the ServiceTypeHealthPolicy for this service type.
