---
title: "PartitionSchemeDescription"
ms.date: "2017-04-26"
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
| Named | [NamedPartitionSchemeDescription](model-NamedPartitionSchemeDescription.md) |
| Singleton | [SingletonPartitionSchemeDescription](model-SingletonPartitionSchemeDescription.md) |
| UniformInt64Range | [UniformInt64RangePartitionSchemeDescription](model-UniformInt64RangePartitionSchemeDescription.md) |

