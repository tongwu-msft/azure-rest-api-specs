---
title: "PartitionInformation"
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
# PartitionInformation

Information about the partition identity, partitioning scheme and keys supported by it.
# Inheritance

'PartitionInformation' is the base type of the polymorphic type model. The 'ServicePartitionKind' property is the discriminator for the derived types. 
The value of the 'ServicePartitionKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| ServicePartitionKind | Derived Type |
| --- | --- | 
| Int64Range | [Int64RangePartitionInformation](sfclient-v62-model-int64rangepartitioninformation.md) |
| Named | [NamedPartitionInformation](sfclient-v62-model-namedpartitioninformation.md) |
| Singleton | [SingletonPartitionInformation](sfclient-v62-model-singletonpartitioninformation.md) |

