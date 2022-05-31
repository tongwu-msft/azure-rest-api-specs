---
title: "NodeTypeHealthPolicyMapItem v82"
description: "NodeTypeHealthPolicyMapItem v82"
ms.date: "04/02/2021"
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
# NodeTypeHealthPolicyMapItem v82

Defines an item in NodeTypeHealthPolicyMap.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Key`](#key) | string | Yes |
| [`Value`](#value) | integer | Yes |

____
### `Key`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The key of the node type health policy map item. This is the name of the node type.

____
### `Value`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The value of the node type health policy map item.
If the percentage is respected but there is at least one unhealthy node in the node type, the health is evaluated as Warning. 
The percentage is calculated by dividing the number of unhealthy nodes over the total number of nodes in the node type. 
The computation rounds up to tolerate one failure on small numbers of nodes.
The max percent unhealthy nodes allowed for the node type. Must be between zero and 100.

