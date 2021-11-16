---
title: "HealthEvaluation v81"
description: "HealthEvaluation v81"
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
# HealthEvaluation v81

Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.
## Inheritance

'HealthEvaluation' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| Application | [ApplicationHealthEvaluation](sfclient-v81-model-applicationhealthevaluation.md) |
| Applications | [ApplicationsHealthEvaluation](sfclient-v81-model-applicationshealthevaluation.md) |
| ApplicationTypeApplications | [ApplicationTypeApplicationsHealthEvaluation](sfclient-v81-model-applicationtypeapplicationshealthevaluation.md) |
| DeltaNodesCheck | [DeltaNodesCheckHealthEvaluation](sfclient-v81-model-deltanodescheckhealthevaluation.md) |
| DeployedApplication | [DeployedApplicationHealthEvaluation](sfclient-v81-model-deployedapplicationhealthevaluation.md) |
| DeployedApplications | [DeployedApplicationsHealthEvaluation](sfclient-v81-model-deployedapplicationshealthevaluation.md) |
| DeployedServicePackage | [DeployedServicePackageHealthEvaluation](sfclient-v81-model-deployedservicepackagehealthevaluation.md) |
| DeployedServicePackages | [DeployedServicePackagesHealthEvaluation](sfclient-v81-model-deployedservicepackageshealthevaluation.md) |
| Event | [EventHealthEvaluation](sfclient-v81-model-eventhealthevaluation.md) |
| Node | [NodeHealthEvaluation](sfclient-v81-model-nodehealthevaluation.md) |
| Nodes | [NodesHealthEvaluation](sfclient-v81-model-nodeshealthevaluation.md) |
| Partition | [PartitionHealthEvaluation](sfclient-v81-model-partitionhealthevaluation.md) |
| Partitions | [PartitionsHealthEvaluation](sfclient-v81-model-partitionshealthevaluation.md) |
| Replica | [ReplicaHealthEvaluation](sfclient-v81-model-replicahealthevaluation.md) |
| Replicas | [ReplicasHealthEvaluation](sfclient-v81-model-replicashealthevaluation.md) |
| Service | [ServiceHealthEvaluation](sfclient-v81-model-servicehealthevaluation.md) |
| Services | [ServicesHealthEvaluation](sfclient-v81-model-serviceshealthevaluation.md) |
| SystemApplication | [SystemApplicationHealthEvaluation](sfclient-v81-model-systemapplicationhealthevaluation.md) |
| UpgradeDomainDeltaNodesCheck | [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v81-model-upgradedomaindeltanodescheckhealthevaluation.md) |
| UpgradeDomainDeployedApplications | [UpgradeDomainDeployedApplicationsHealthEvaluation](sfclient-v81-model-upgradedomaindeployedapplicationshealthevaluation.md) |
| UpgradeDomainNodes | [UpgradeDomainNodesHealthEvaluation](sfclient-v81-model-upgradedomainnodeshealthevaluation.md) |
| NodeTypeNodes | [NodeTypeNodesHealthEvaluation](sfclient-v81-model-nodetypenodeshealthevaluation.md) |

