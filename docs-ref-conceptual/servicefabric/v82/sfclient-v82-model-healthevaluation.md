---
title: "HealthEvaluation v82"
description: "HealthEvaluation v82"
ms.date: "10/20/2021"
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
# HealthEvaluation v82

Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.
## Inheritance

'HealthEvaluation' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Application | [ApplicationHealthEvaluation](sfclient-v82-model-applicationhealthevaluation.md) |
| Applications | [ApplicationsHealthEvaluation](sfclient-v82-model-applicationshealthevaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](sfclient-v82-model-applicationtypeapplicationshealthevaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](sfclient-v82-model-deltanodescheckhealthevaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](sfclient-v82-model-deployedapplicationhealthevaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](sfclient-v82-model-deployedapplicationshealthevaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](sfclient-v82-model-deployedservicepackagehealthevaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](sfclient-v82-model-deployedservicepackageshealthevaluation.md) |
| Event | [EventHealthEvaluation](sfclient-v82-model-eventhealthevaluation.md) |
| Node | [NodeHealthEvaluation](sfclient-v82-model-nodehealthevaluation.md) |
| Nodes | [NodesHealthEvaluation](sfclient-v82-model-nodeshealthevaluation.md) |
| Partition | [PartitionHealthEvaluation](sfclient-v82-model-partitionhealthevaluation.md) |
| Partitions | [PartitionsHealthEvaluation](sfclient-v82-model-partitionshealthevaluation.md) |
| Replica | [ReplicaHealthEvaluation](sfclient-v82-model-replicahealthevaluation.md) |
| Replicas | [ReplicasHealthEvaluation](sfclient-v82-model-replicashealthevaluation.md) |
| Service | [ServiceHealthEvaluation](sfclient-v82-model-servicehealthevaluation.md) |
| Services | [ServicesHealthEvaluation](sfclient-v82-model-serviceshealthevaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](sfclient-v82-model-systemapplicationhealthevaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v82-model-upgradedomaindeltanodescheckhealthevaluation.md) |
| UpgradeDomainDeployedApplications | [UpgradeDomainDeployedApplicationsHealthEvaluation](sfclient-v82-model-upgradedomaindeployedapplicationshealthevaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](sfclient-v82-model-upgradedomainnodeshealthevaluation.md) |
| NodeTypeNodes | [NodeTypeNodesHealthEvaluation](sfclient-v82-model-nodetypenodeshealthevaluation.md) |

