---
title: "ServiceUpdateProperties"
ms.date: "2018-01-22"
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
# ServiceUpdateProperties

The service resource properties for patch operations.
# Inheritance

The type 'ServiceUpdateProperties' is a base type of the polymorphic type model with property 'serviceKind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| serviceKind | Derived Type |
| --- | --- | 
| Stateless | [StatelessServiceUpdateProperties](sfrp-2017-07-01-preview-model-statelessserviceupdateproperties.md) |
| Stateful | [StatefulServiceUpdateProperties](sfrp-2017-07-01-preview-model-statefulserviceupdateproperties.md) |

