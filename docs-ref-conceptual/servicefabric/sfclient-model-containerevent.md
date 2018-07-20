---
title: "ContainerEvent"
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
# ContainerEvent

A container event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`count`](#count) | integer | No |
| [`firstTimestamp`](#firsttimestamp) | string | No |
| [`lastTimestamp`](#lasttimestamp) | string | No |
| [`message`](#message) | string | No |
| [`type`](#type) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the container event.

____
### `count`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The count of the event.

____
### `firstTimestamp`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Date/time of the first event.

____
### `lastTimestamp`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Date/time of the last event.

____
### `message`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The event message

____
### `type`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The event type.
