---
title: "ServiceProperties"
ms.date: "2017-11-30"
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
# ServiceProperties

The service resource properties.
# Inheritance

The type 'ServiceProperties' is a base type of the polymorphic type model with property 'serviceKind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| serviceKind | Derived Type |
| --- | --- | 
| Stateless | [StatelessServiceProperties](sfrp-2017-07-01-preview-model-statelessserviceproperties.md) |
| Stateful | [StatefulServiceProperties](sfrp-2017-07-01-preview-model-statefulserviceproperties.md) |

