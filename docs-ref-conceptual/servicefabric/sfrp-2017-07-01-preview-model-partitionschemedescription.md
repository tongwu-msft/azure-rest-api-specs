---
title: "Service Partition Overview"
description: API reference documentation for the operations available in the PartitionSchemeDescription REST API.
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# Service Partition Overview

Describes how the service is partitioned.
## Inheritance

'PartitionSchemeDescription' is the base type of the polymorphic type model. The 'PartitionScheme' property is the discriminator for the derived types. 
The value of the 'PartitionScheme' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| PartitionScheme | Derived Type |
| --- | --- | 
| Named | [NamedPartitionSchemeDescription](sfrp-2017-07-01-preview-model-namedpartitionschemedescription.md) |
| Singleton | [SingletonPartitionSchemeDescription](sfrp-2017-07-01-preview-model-singletonpartitionschemedescription.md) |
| UniformInt64Range | [UniformInt64RangePartitionSchemeDescription](sfrp-2017-07-01-preview-model-uniformint64rangepartitionschemedescription.md) |

