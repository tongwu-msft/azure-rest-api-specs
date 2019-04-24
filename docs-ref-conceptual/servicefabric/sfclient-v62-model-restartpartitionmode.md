---
title: "RestartPartitionMode"
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
# RestartPartitionMode enum

type: string

Possible values include: 'Invalid', 'AllReplicasOrInstances', 'OnlyActiveSecondaries'

Possible values are: 

  - `Invalid` - Reserved.  Do not pass into API.
  - `AllReplicasOrInstances` - All replicas or instances in the partition are restarted at once.
  - `OnlyActiveSecondaries` - Only the secondary replicas are restarted.

