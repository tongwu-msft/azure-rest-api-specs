---
title: "ReplicaStatus v82"
description: "ReplicaStatus v82"
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
# ReplicaStatus enum v82

type: string

The status of a replica of a service.

Possible values are: 

  - `Invalid` - Indicates the replica status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `InBuild` - The replica is being built. This means that a primary replica is seeding this replica. The value is 1.
  - `Standby` - The replica is in standby. The value is 2.
  - `Ready` - The replica is ready. The value is 3.
  - `Down` - The replica is down. The value is 4.
  - `Dropped` - Replica is dropped. This means that the replica has been removed from the replica set. If it is persisted, its state has been deleted. The value is 5.

