---
title: "AutoScalingMechanism"
ms.date: 06/12/2019
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
# AutoScalingMechanism

Describes the mechanism for performing auto scaling operation. Derived classes will describe the actual mechanism.
## Inheritance

'AutoScalingMechanism' is the base type of the polymorphic type model. The 'kind' property is the discriminator for the derived types. 
The value of the 'kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| kind | Derived Type |
| --- | --- | 
| AddRemoveReplica | [AddRemoveReplicaScalingMechanism](sfclient-model-addremovereplicascalingmechanism.md) |

