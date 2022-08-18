---
title: "ServicePartitionKind v82"
description: "ServicePartitionKind v82"
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
# ServicePartitionKind enum v82

type: string

The kind of partitioning scheme used to partition the service.

Possible values are: 

  - `Invalid` - Indicates the partition kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Singleton` - Indicates that there is only one partition, and SingletonPartitionSchemeDescription was specified while creating the service. The value is 1.
  - `Int64Range` - Indicates that the partition is based on Int64 key ranges, and UniformInt64RangePartitionSchemeDescription was specified while creating the service. The value is 2.
  - `Named` - Indicates that the partition is based on string names, and NamedPartitionInformation  was specified while creating the service. The value is 3.

