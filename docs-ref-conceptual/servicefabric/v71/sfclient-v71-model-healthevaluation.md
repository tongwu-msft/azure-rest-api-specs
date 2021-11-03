---
title: "HealthEvaluation"
ms.date: "04/15/2020"
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
| Application | [ApplicationHealthEvaluation](sfclient-v71-model-applicationhealthevaluation.md) |
| Applications | [ApplicationsHealthEvaluation](sfclient-v71-model-applicationshealthevaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](sfclient-v71-model-applicationtypeapplicationshealthevaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](sfclient-v71-model-deltanodescheckhealthevaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](sfclient-v71-model-deployedapplicationhealthevaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](sfclient-v71-model-deployedapplicationshealthevaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](sfclient-v71-model-deployedservicepackagehealthevaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](sfclient-v71-model-deployedservicepackageshealthevaluation.md) |
| Event | [EventHealthEvaluation](sfclient-v71-model-eventhealthevaluation.md) |
| Node | [NodeHealthEvaluation](sfclient-v71-model-nodehealthevaluation.md) |
| Nodes | [NodesHealthEvaluation](sfclient-v71-model-nodeshealthevaluation.md) |
| Partition | [PartitionHealthEvaluation](sfclient-v71-model-partitionhealthevaluation.md) |
| Partitions | [PartitionsHealthEvaluation](sfclient-v71-model-partitionshealthevaluation.md) |
| Replica | [ReplicaHealthEvaluation](sfclient-v71-model-replicahealthevaluation.md) |
| Replicas | [ReplicasHealthEvaluation](sfclient-v71-model-replicashealthevaluation.md) |
| Service | [ServiceHealthEvaluation](sfclient-v71-model-servicehealthevaluation.md) |
| Services | [ServicesHealthEvaluation](sfclient-v71-model-serviceshealthevaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](sfclient-v71-model-systemapplicationhealthevaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v71-model-upgradedomaindeltanodescheckhealthevaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](sfclient-v71-model-upgradedomainnodeshealthevaluation.md) |

