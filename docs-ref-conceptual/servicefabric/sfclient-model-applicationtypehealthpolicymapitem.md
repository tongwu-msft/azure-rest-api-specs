---
title: "ApplicationTypeHealthPolicyMapItem"
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
# ApplicationTypeHealthPolicyMapItem

Defines an item in ApplicationTypeHealthPolicyMap.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Key](#key) | string | Yes |
| [Value](#value) | integer | Yes |

____
### Key
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key of the application type health policy map item. This is the name of the application type.

____
### Value
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The value of the application type health policy map item.
The max percent unhealthy applications allowed for the application type. Must be between zero and 100.

