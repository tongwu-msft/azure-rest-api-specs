---
title: Service resource properties
description: "ServiceResourceProperties is the base type of the polymorphic type model and the serviceKind property is the discriminator for the derived types."
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
# Service resource properties

The service resource properties.
## Inheritance

'ServiceResourceProperties' is the base type of the polymorphic type model. The 'serviceKind' property is the discriminator for the derived types. 
The value of the 'serviceKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| serviceKind | Derived Type |
| --- | --- | 
| Stateful | [StatefulServiceProperties](sfrp-2017-07-01-preview-model-statefulserviceproperties.md) |
| Stateless | [StatelessServiceProperties](sfrp-2017-07-01-preview-model-statelessserviceproperties.md) |

