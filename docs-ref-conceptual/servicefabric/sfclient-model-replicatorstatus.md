---
title: "ReplicatorStatus"
ms.date: "2017-05-08"
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
# ReplicatorStatus

Represents a base class for primary or secondary replicator status.
Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.

# Inheritance

The type 'ReplicatorStatus' is a base type of the polymorphic type model with property 'Kind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Primary | [PrimaryReplicatorStatus](sfclient-model-primaryreplicatorstatus.md) |
| ActiveSecondary | [SecondaryActiveReplicatorStatus](sfclient-model-secondaryactivereplicatorstatus.md) |
| IdleSecondary | [SecondaryIdleReplicatorStatus](sfclient-model-secondaryidlereplicatorstatus.md) |

