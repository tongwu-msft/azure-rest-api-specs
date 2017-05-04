---
title: "PartitionSchemeDescription"
ms.date: "2017-05-04"
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
# PartitionSchemeDescription

Describes how the service is partitioned.
# Inheritance

The type 'PartitionSchemeDescription' is a base type of the polymorphic type model with property 'PartitionScheme' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| PartitionScheme | Derived Type |
| --- | --- | 
| Named | [NamedPartitionSchemeDescription](sfclient-model-namedpartitionschemedescription.md) |
| Singleton | [SingletonPartitionSchemeDescription](sfclient-model-singletonpartitionschemedescription.md) |
| UniformInt64Range | [UniformInt64RangePartitionSchemeDescription](sfclient-model-uniformint64rangepartitionschemedescription.md) |

