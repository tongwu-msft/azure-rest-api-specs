---
title: Partition Scheme Overview
description: "PartitionSchemeDescription"
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
# Partition Scheme Overview

Describes how the service is partitioned.
## Inheritance

'PartitionSchemeDescription' is the base type of the polymorphic type model. The 'PartitionScheme' property is the discriminator for the derived types. 
The value of the 'PartitionScheme' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| PartitionScheme | Derived Type |
| --- | --- | 
| Named | [NamedPartitionSchemeDescription](sfclient-model-namedpartitionschemedescription.md) |
| Singleton | [SingletonPartitionSchemeDescription](sfclient-model-singletonpartitionschemedescription.md) |
| UniformInt64Range | [UniformInt64RangePartitionSchemeDescription](sfclient-model-uniformint64rangepartitionschemedescription.md) |

