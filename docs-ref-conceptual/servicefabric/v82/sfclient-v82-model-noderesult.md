---
title: "NodeResult v82"
description: "NodeResult v82"
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
# NodeResult v82

Contains information about a node that was targeted by a user-induced operation.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`NodeName`](#nodename) | string | No |
| [`NodeInstanceId`](#nodeinstanceid) | string | No |

____
### `NodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of a Service Fabric node.

____
### `NodeInstanceId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The node instance id.
