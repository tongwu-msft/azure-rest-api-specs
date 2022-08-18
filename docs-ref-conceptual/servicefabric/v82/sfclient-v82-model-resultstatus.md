---
title: "ResultStatus v82"
description: "ResultStatus v82"
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
# ResultStatus enum v82

type: string

Possible values include: 'Invalid', 'Succeeded', 'Cancelled', 'Interrupted', 'Failed', 'Pending'

Possible values are: 

  - `Invalid` - Indicates that the repair task result is invalid. All Service Fabric enumerations have the invalid value.
  - `Succeeded` - Indicates that the repair task completed execution successfully.
  - `Cancelled` - Indicates that the repair task was cancelled prior to execution.
  - `Interrupted` - Indicates that execution of the repair task was interrupted by a cancellation request after some work had already been performed.
  - `Failed` - Indicates that there was a failure during execution of the repair task. Some work may have been performed.
  - `Pending` - Indicates that the repair task result is not yet available, because the repair task has not finished executing.

