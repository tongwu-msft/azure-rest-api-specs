---
title: "RepairTaskCancelDescription"
ms.date: "2017-09-24"
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
# RepairTaskCancelDescription

Describes a request to cancel a repair task.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [TaskId](#taskid) | string | Yes |
| [Version](#version) | string (int64) | No |
| [RequestAbort](#requestabort) | boolean | No |

____
### TaskId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The ID of the repair task.

____
### Version
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The current version number of the repair task. If non-zero, then the request will only succeed if this value matches the actual current version of the repair task. If zero, then no version check is performed.</para>

____
### RequestAbort
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
_True_ if the repair should be stopped as soon as possible even if it has already started executing. _False_ if the repair should be cancelled only if execution has not yet started.</para>
