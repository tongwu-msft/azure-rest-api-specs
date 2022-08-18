---
title: "ReplicaHealth v82"
description: "ReplicaHealth v82"
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
# ReplicaHealth v82

Represents a base class for stateful service replica or stateless service instance health.
Contains the replica aggregated health state, the health events and the unhealthy evaluations.

## Inheritance

'ReplicaHealth' is the base type of the polymorphic type model. The 'ServiceKind' property is the discriminator for the derived types. 
The value of the 'ServiceKind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| ServiceKind | Derived Type |
| --- | --- | 
| Stateful | [StatefulServiceReplicaHealth](sfclient-v82-model-statefulservicereplicahealth.md) |
| Stateless | [StatelessServiceInstanceHealth](sfclient-v82-model-statelessserviceinstancehealth.md) |

