---
title: "RepairTaskDeleteDescription"
ms.date: "11/23/2019"
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
# RepairTaskDeleteDescription

Describes a request to delete a completed repair task.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`TaskId`](#taskid) | string | Yes |
| [`Version`](#version) | string | No |

____
### `TaskId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The ID of the completed repair task to be deleted.

____
### `Version`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current version number of the repair task. If non-zero, then the request will only succeed if this value matches the actual current version of the repair task. If zero, then no version check is performed.
