---
title: "BackupPolicyScope"
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
# BackupPolicyScope enum

type: string

Specifies the scope at which the backup policy is applied.


Possible values are: 

  - `Invalid` - Indicates an invalid backup policy scope type. All Service Fabric enumerations have the invalid type.
  - `Partition` - Indicates the backup policy is applied at partition level. Hence overriding any policy which may have applied at partition's service or application level.
  - `Service` - Indicates the backup policy is applied at service level. All partitions of the service inherit this policy unless explicitly overridden at partition level.
  - `Application` - Indicates the backup policy is applied at application level. All services and partitions of the application inherit this policy unless explicitly overridden at service or partition level.

