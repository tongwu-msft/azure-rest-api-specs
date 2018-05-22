---
title: "ReplicatorStatus"
ms.date: "2018-04-23"
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

'ReplicatorStatus' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Primary | [PrimaryReplicatorStatus](sfclient-model-primaryreplicatorstatus.md) |
| ActiveSecondary | [SecondaryActiveReplicatorStatus](sfclient-model-secondaryactivereplicatorstatus.md) |
| IdleSecondary | [SecondaryIdleReplicatorStatus](sfclient-model-secondaryidlereplicatorstatus.md) |

