---
title: "HealthEvaluation"
ms.date: "11/23/2019"
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
# HealthEvaluation

Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.
## Inheritance

'HealthEvaluation' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Application | [ApplicationHealthEvaluation](sfclient-v70-model-applicationhealthevaluation.md) |
| Applications | [ApplicationsHealthEvaluation](sfclient-v70-model-applicationshealthevaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](sfclient-v70-model-applicationtypeapplicationshealthevaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](sfclient-v70-model-deltanodescheckhealthevaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](sfclient-v70-model-deployedapplicationhealthevaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](sfclient-v70-model-deployedapplicationshealthevaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](sfclient-v70-model-deployedservicepackagehealthevaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](sfclient-v70-model-deployedservicepackageshealthevaluation.md) |
| Event | [EventHealthEvaluation](sfclient-v70-model-eventhealthevaluation.md) |
| Node | [NodeHealthEvaluation](sfclient-v70-model-nodehealthevaluation.md) |
| Nodes | [NodesHealthEvaluation](sfclient-v70-model-nodeshealthevaluation.md) |
| Partition | [PartitionHealthEvaluation](sfclient-v70-model-partitionhealthevaluation.md) |
| Partitions | [PartitionsHealthEvaluation](sfclient-v70-model-partitionshealthevaluation.md) |
| Replica | [ReplicaHealthEvaluation](sfclient-v70-model-replicahealthevaluation.md) |
| Replicas | [ReplicasHealthEvaluation](sfclient-v70-model-replicashealthevaluation.md) |
| Service | [ServiceHealthEvaluation](sfclient-v70-model-servicehealthevaluation.md) |
| Services | [ServicesHealthEvaluation](sfclient-v70-model-serviceshealthevaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](sfclient-v70-model-systemapplicationhealthevaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v70-model-upgradedomaindeltanodescheckhealthevaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](sfclient-v70-model-upgradedomainnodeshealthevaluation.md) |

