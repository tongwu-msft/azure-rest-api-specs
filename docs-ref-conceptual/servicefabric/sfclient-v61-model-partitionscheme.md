---
title: "PartitionScheme"
ms.date: "2018-01-22"
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
# PartitionScheme enum

type: string

Enumerates the ways that a service can be partitioned.

Possible values are: 

  - Invalid - Indicates the partition kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Singleton - Indicates that the partition is based on string names, and is a SingletonPartitionSchemeDescription object, The value is 1.
  - UniformInt64Range - Indicates that the partition is based on Int64 key ranges, and is a UniformInt64RangePartitionSchemeDescription object. The value is 2.
  - Named - Indicates that the partition is based on string names, and is a NamedPartitionSchemeDescription object. The value is 3

