---
title: "FabricReplicaStatus"
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
# FabricReplicaStatus enum

type: string

Specifies the status of the replica.

Possible values are: 

  - `Invalid` - Indicates that the read or write operation access status is not valid. This value is not returned to the caller.
  - `Down` - Indicates that the replica is down.
  - `Up` - Indicates that the replica is up.

