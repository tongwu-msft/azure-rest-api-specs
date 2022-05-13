---
title: "Container Instance View"
description: "ContainerInstanceView"
ms.date: "04/25/2022"
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
# Container Instance View

Runtime information of a container instance.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`restartCount`](#restartcount) | integer | No |
| [`currentState`](#currentstate) | [ContainerState](sfclient-model-containerstate.md) | No |
| [`previousState`](#previousstate) | [ContainerState](sfclient-model-containerstate.md) | No |
| [`events`](#events) | array of [ContainerEvent](sfclient-model-containerevent.md) | No |

____
### `restartCount`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The number of times the container has been restarted.

____
### `currentState`
__Type__: [ContainerState](sfclient-model-containerstate.md) <br/>
__Required__: No<br/>
<br/>
Current container instance state.

____
### `previousState`
__Type__: [ContainerState](sfclient-model-containerstate.md) <br/>
__Required__: No<br/>
<br/>
Previous container instance state.

____
### `events`
__Type__: array of [ContainerEvent](sfclient-model-containerevent.md) <br/>
__Required__: No<br/>
<br/>
The events of this container instance.
