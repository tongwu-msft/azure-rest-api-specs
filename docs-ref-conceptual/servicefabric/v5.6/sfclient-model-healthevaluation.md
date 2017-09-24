---
title: "HealthEvaluation"
ms.date: "2017-05-09"
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
| Application | [ApplicationHealthEvaluation](sfclient-model-applicationhealthevaluation.md) |
| Applications | [ApplicationsHealthEvaluation](sfclient-model-applicationshealthevaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](sfclient-model-applicationtypeapplicationshealthevaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](sfclient-model-deltanodescheckhealthevaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](sfclient-model-deployedapplicationhealthevaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](sfclient-model-deployedapplicationshealthevaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](sfclient-model-deployedservicepackagehealthevaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](sfclient-model-deployedservicepackageshealthevaluation.md) |
| Event | [EventHealthEvaluation](sfclient-model-eventhealthevaluation.md) |
| Node | [NodeHealthEvaluation](sfclient-model-nodehealthevaluation.md) |
| Nodes | [NodesHealthEvaluation](sfclient-model-nodeshealthevaluation.md) |
| Partition | [PartitionHealthEvaluation](sfclient-model-partitionhealthevaluation.md) |
| Partitions | [PartitionsHealthEvaluation](sfclient-model-partitionshealthevaluation.md) |
| Replica | [ReplicaHealthEvaluation](sfclient-model-replicahealthevaluation.md) |
| Replicas | [ReplicasHealthEvaluation](sfclient-model-replicashealthevaluation.md) |
| Service | [ServiceHealthEvaluation](sfclient-model-servicehealthevaluation.md) |
| Services | [ServicesHealthEvaluation](sfclient-model-serviceshealthevaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](sfclient-model-systemapplicationhealthevaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-model-upgradedomaindeltanodescheckhealthevaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](sfclient-model-upgradedomainnodeshealthevaluation.md) |

