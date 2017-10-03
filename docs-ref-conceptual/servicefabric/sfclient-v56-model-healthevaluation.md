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
| Application | [ApplicationHealthEvaluation](sfclient-v56-model-applicationhealthevaluation.md) |
| Applications | [ApplicationsHealthEvaluation](sfclient-v56-model-applicationshealthevaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](sfclient-v56-model-applicationtypeapplicationshealthevaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](sfclient-v56-model-deltanodescheckhealthevaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](sfclient-v56-model-deployedapplicationhealthevaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](sfclient-v56-model-deployedapplicationshealthevaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](sfclient-v56-model-deployedservicepackagehealthevaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](sfclient-v56-model-deployedservicepackageshealthevaluation.md) |
| Event | [EventHealthEvaluation](sfclient-v56-model-eventhealthevaluation.md) |
| Node | [NodeHealthEvaluation](sfclient-v56-model-nodehealthevaluation.md) |
| Nodes | [NodesHealthEvaluation](sfclient-v56-model-nodeshealthevaluation.md) |
| Partition | [PartitionHealthEvaluation](sfclient-v56-model-partitionhealthevaluation.md) |
| Partitions | [PartitionsHealthEvaluation](sfclient-v56-model-partitionshealthevaluation.md) |
| Replica | [ReplicaHealthEvaluation](sfclient-v56-model-replicahealthevaluation.md) |
| Replicas | [ReplicasHealthEvaluation](sfclient-v56-model-replicashealthevaluation.md) |
| Service | [ServiceHealthEvaluation](sfclient-v56-model-servicehealthevaluation.md) |
| Services | [ServicesHealthEvaluation](sfclient-v56-model-serviceshealthevaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](sfclient-v56-model-systemapplicationhealthevaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v56-model-upgradedomaindeltanodescheckhealthevaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](sfclient-v56-model-upgradedomainnodeshealthevaluation.md) |

