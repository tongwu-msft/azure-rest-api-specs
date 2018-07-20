---
title: "EntryPointStatus"
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
# EntryPointStatus enum

type: string

Specifies the status of the code package entry point deployed on a Service Fabric node.

Possible values are: 

  - `Invalid` - Indicates status of entry point is not known or invalid. The value is 0.
  - `Pending` - Indicates the entry point is scheduled to be started. The value is 1.
  - `Starting` - Indicates the entry point is being started. The value is 2.
  - `Started` - Indicates the entry point was started successfully and is running. The value is 3.
  - `Stopping` - Indicates the entry point is being stopped. The value is 4.
  - `Stopped` - Indicates the entry point is not running. The value is 5.

