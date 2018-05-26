---
title: "PartitionSchemeDescription"
ms.date: "2018-05-25"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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

'PartitionSchemeDescription' is the base type of the polymorphic type model. The 'PartitionScheme' property is the discriminator for the derived types. 
The value of the 'PartitionScheme' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| PartitionScheme | Derived Type |
| --- | --- | 
| Named | [NamedPartitionSchemeDescription](sfrp-2017-07-01-preview-model-namedpartitionschemedescription.md) |
| Singleton | [SingletonPartitionSchemeDescription](sfrp-2017-07-01-preview-model-singletonpartitionschemedescription.md) |
| UniformInt64Range | [UniformInt64RangePartitionSchemeDescription](sfrp-2017-07-01-preview-model-uniformint64rangepartitionschemedescription.md) |

