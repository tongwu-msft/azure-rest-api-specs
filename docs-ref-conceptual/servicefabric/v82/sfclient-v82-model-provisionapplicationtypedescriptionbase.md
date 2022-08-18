---
title: "ProvisionApplicationTypeDescriptionBase v82"
description: "ProvisionApplicationTypeDescriptionBase v82"
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
# ProvisionApplicationTypeDescriptionBase v82

Represents the type of registration or provision requested, and if the operation needs to be asynchronous or not. Supported types of provision operations are from either image store or external store.
## Inheritance

'ProvisionApplicationTypeDescriptionBase' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| ImageStorePath | [ProvisionApplicationTypeDescription](sfclient-v82-model-provisionapplicationtypedescription.md) |
| ExternalStore | [ExternalStoreProvisionApplicationTypeDescription](sfclient-v82-model-externalstoreprovisionapplicationtypedescription.md) |

