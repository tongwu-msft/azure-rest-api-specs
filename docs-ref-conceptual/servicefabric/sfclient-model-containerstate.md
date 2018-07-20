---
title: "ContainerState"
ms.date: "2018-07-20"
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
# ContainerState

The container state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`state`](#state) | string | No |
| [`startTime`](#starttime) | string (date-time) | No |
| [`exitCode`](#exitcode) | string | No |
| [`finishTime`](#finishtime) | string (date-time) | No |
| [`detailStatus`](#detailstatus) | string | No |

____
### `state`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The state of this container

____
### `startTime`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Date/time when the container state started.

____
### `exitCode`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The container exit code.

____
### `finishTime`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Date/time when the container state finished.

____
### `detailStatus`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Human-readable status of this state.
