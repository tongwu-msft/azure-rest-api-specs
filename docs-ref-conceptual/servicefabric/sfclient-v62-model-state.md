---
title: "State"
ms.date: "2018-04-23"
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
# State enum

type: string

Possible values include: 'Invalid', 'Created', 'Claimed', 'Preparing', 'Approved', 'Executing', 'Restoring', 'Completed'

Possible values are: 

  - `Invalid` - Indicates that the repair task state is invalid. All Service Fabric enumerations have the invalid value.
  - `Created` - Indicates that the repair task has been created.
  - `Claimed` - Indicates that the repair task has been claimed by a repair executor.
  - `Preparing` - Indicates that the Repair Manager is preparing the system to handle the impact of the repair task, usually by taking resources offline gracefully.
  - `Approved` - Indicates that the repair task has been approved by the Repair Manager and is safe to execute.
  - `Executing` - Indicates that execution of the repair task is in progress.
  - `Restoring` - Indicates that the Repair Manager is restoring the system to its pre-repair state, usually by bringing resources back online.
  - `Completed` - Indicates that the repair task has completed, and no further state changes will occur.

