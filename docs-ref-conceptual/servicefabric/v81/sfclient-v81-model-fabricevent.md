---
title: "FabricEvent v81"
description: "FabricEvent v81"
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
# FabricEvent v81

Represents the base for all Fabric Events.
## Inheritance

'FabricEvent' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| ApplicationEvent | [ApplicationEvent](sfclient-v81-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-v81-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-v81-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-v81-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-v81-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-v81-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-v81-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-v81-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-v81-model-applicationdeletedevent.md) |
| ApplicationNewHealthReport | [ApplicationNewHealthReportEvent](sfclient-v81-model-applicationnewhealthreportevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-v81-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeCompleted | [ApplicationUpgradeCompletedEvent](sfclient-v81-model-applicationupgradecompletedevent.md) |
| ApplicationUpgradeDomainCompleted | [ApplicationUpgradeDomainCompletedEvent](sfclient-v81-model-applicationupgradedomaincompletedevent.md) |
| ApplicationUpgradeRollbackCompleted | [ApplicationUpgradeRollbackCompletedEvent](sfclient-v81-model-applicationupgraderollbackcompletedevent.md) |
| ApplicationUpgradeRollbackStarted | [ApplicationUpgradeRollbackStartedEvent](sfclient-v81-model-applicationupgraderollbackstartedevent.md) |
| ApplicationUpgradeStarted | [ApplicationUpgradeStartedEvent](sfclient-v81-model-applicationupgradestartedevent.md) |
| DeployedApplicationNewHealthReport | [DeployedApplicationNewHealthReportEvent](sfclient-v81-model-deployedapplicationnewhealthreportevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-v81-model-deployedapplicationhealthreportexpiredevent.md) |
| ApplicationProcessExited | [ApplicationProcessExitedEvent](sfclient-v81-model-applicationprocessexitedevent.md) |
| ApplicationContainerInstanceExited | [ApplicationContainerInstanceExitedEvent](sfclient-v81-model-applicationcontainerinstanceexitedevent.md) |
| DeployedServicePackageNewHealthReport | [DeployedServicePackageNewHealthReportEvent](sfclient-v81-model-deployedservicepackagenewhealthreportevent.md) |
| DeployedServicePackageHealthReportExpired | [DeployedServicePackageHealthReportExpiredEvent](sfclient-v81-model-deployedservicepackagehealthreportexpiredevent.md) |
| ChaosCodePackageRestartScheduled | [ChaosCodePackageRestartScheduledEvent](sfclient-v81-model-chaoscodepackagerestartscheduledevent.md) |
| ClusterNewHealthReport | [ClusterNewHealthReportEvent](sfclient-v81-model-clusternewhealthreportevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-v81-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeCompleted | [ClusterUpgradeCompletedEvent](sfclient-v81-model-clusterupgradecompletedevent.md) |
| ClusterUpgradeDomainCompleted | [ClusterUpgradeDomainCompletedEvent](sfclient-v81-model-clusterupgradedomaincompletedevent.md) |
| ClusterUpgradeRollbackCompleted | [ClusterUpgradeRollbackCompletedEvent](sfclient-v81-model-clusterupgraderollbackcompletedevent.md) |
| ClusterUpgradeRollbackStarted | [ClusterUpgradeRollbackStartedEvent](sfclient-v81-model-clusterupgraderollbackstartedevent.md) |
| ClusterUpgradeStarted | [ClusterUpgradeStartedEvent](sfclient-v81-model-clusterupgradestartedevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-v81-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-v81-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-v81-model-nodeabortedevent.md) |
| NodeAddedToCluster | [NodeAddedToClusterEvent](sfclient-v81-model-nodeaddedtoclusterevent.md) |
| NodeClosed | [NodeClosedEvent](sfclient-v81-model-nodeclosedevent.md) |
| NodeDeactivateCompleted | [NodeDeactivateCompletedEvent](sfclient-v81-model-nodedeactivatecompletedevent.md) |
| NodeDeactivateStarted | [NodeDeactivateStartedEvent](sfclient-v81-model-nodedeactivatestartedevent.md) |
| NodeDown | [NodeDownEvent](sfclient-v81-model-nodedownevent.md) |
| NodeNewHealthReport | [NodeNewHealthReportEvent](sfclient-v81-model-nodenewhealthreportevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-v81-model-nodehealthreportexpiredevent.md) |
| NodeOpenSucceeded | [NodeOpenSucceededEvent](sfclient-v81-model-nodeopensucceededevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-v81-model-nodeopenfailedevent.md) |
| NodeRemovedFromCluster | [NodeRemovedFromClusterEvent](sfclient-v81-model-noderemovedfromclusterevent.md) |
| NodeUp | [NodeUpEvent](sfclient-v81-model-nodeupevent.md) |
| ChaosNodeRestartScheduled | [ChaosNodeRestartScheduledEvent](sfclient-v81-model-chaosnoderestartscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-v81-model-partitionanalysisevent.md) |
| PartitionNewHealthReport | [PartitionNewHealthReportEvent](sfclient-v81-model-partitionnewhealthreportevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-v81-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigured | [PartitionReconfiguredEvent](sfclient-v81-model-partitionreconfiguredevent.md) |
| ChaosPartitionSecondaryMoveScheduled | [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v81-model-chaospartitionsecondarymovescheduledevent.md) |
| ChaosPartitionPrimaryMoveScheduled | [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v81-model-chaospartitionprimarymovescheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-v81-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaNewHealthReport | [StatefulReplicaNewHealthReportEvent](sfclient-v81-model-statefulreplicanewhealthreportevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-v81-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaNewHealthReport | [StatelessReplicaNewHealthReportEvent](sfclient-v81-model-statelessreplicanewhealthreportevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-v81-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosReplicaRemovalScheduled | [ChaosReplicaRemovalScheduledEvent](sfclient-v81-model-chaosreplicaremovalscheduledevent.md) |
| ChaosReplicaRestartScheduled | [ChaosReplicaRestartScheduledEvent](sfclient-v81-model-chaosreplicarestartscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-v81-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-v81-model-servicedeletedevent.md) |
| ServiceNewHealthReport | [ServiceNewHealthReportEvent](sfclient-v81-model-servicenewhealthreportevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-v81-model-servicehealthreportexpiredevent.md) |

