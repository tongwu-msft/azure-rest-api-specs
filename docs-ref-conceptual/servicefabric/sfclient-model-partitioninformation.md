---
title: "PartitionInformation"
ms.date: "2017-05-09"
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

The type 'PartitionInformation' is a base type of the polymorphic type model with property 'ServicePartitionKind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| ServicePartitionKind | Derived Type |
| --- | --- | 
| Int64Range | [Int64RangePartitionInformation](sfclient-model-int64rangepartitioninformation.md) |
| Named | [NamedPartitionInformation](sfclient-model-namedpartitioninformation.md) |
| Singleton | [SingletonPartitionInformation](sfclient-model-singletonpartitioninformation.md) |

