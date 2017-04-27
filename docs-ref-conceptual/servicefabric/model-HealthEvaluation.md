---
title: "HealthEvaluation"
ms.date: "2017-04-26"
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
# HealthEvaluation

Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.
# Inheritance

The type 'HealthEvaluation' is a base type of the polymorphic type model with property 'Kind' as the discriminator.
Depending upon the value of the property the serialized contents on the wire will be one of the derived types listed below.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Application | [ApplicationHealthEvaluation](model-ApplicationHealthEvaluation.md) |
| Applications | [ApplicationsHealthEvaluation](model-ApplicationsHealthEvaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](model-ApplicationTypeApplicationsHealthEvaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](model-DeltaNodesCheckHealthEvaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](model-DeployedApplicationHealthEvaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](model-DeployedApplicationsHealthEvaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](model-DeployedServicePackageHealthEvaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](model-DeployedServicePackagesHealthEvaluation.md) |
| Event | [EventHealthEvaluation](model-EventHealthEvaluation.md) |
| Node | [NodeHealthEvaluation](model-NodeHealthEvaluation.md) |
| Nodes | [NodesHealthEvaluation](model-NodesHealthEvaluation.md) |
| Partition | [PartitionHealthEvaluation](model-PartitionHealthEvaluation.md) |
| Partitions | [PartitionsHealthEvaluation](model-PartitionsHealthEvaluation.md) |
| Replica | [ReplicaHealthEvaluation](model-ReplicaHealthEvaluation.md) |
| Replicas | [ReplicasHealthEvaluation](model-ReplicasHealthEvaluation.md) |
| Service | [ServiceHealthEvaluation](model-ServiceHealthEvaluation.md) |
| Services | [ServicesHealthEvaluation](model-ServicesHealthEvaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](model-SystemApplicationHealthEvaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](model-UpgradeDomainDeltaNodesCheckHealthEvaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](model-UpgradeDomainNodesHealthEvaluation.md) |

