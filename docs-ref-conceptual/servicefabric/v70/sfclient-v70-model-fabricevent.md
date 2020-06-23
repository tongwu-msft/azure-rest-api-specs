---
title: "FabricEvent"
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
# FabricEvent

Represents the base for all Fabric Events.
## Inheritance

'FabricEvent' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| ApplicationEvent | [ApplicationEvent](sfclient-v70-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-v70-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-v70-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-v70-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-v70-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-v70-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-v70-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-v70-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-v70-model-applicationdeletedevent.md) |
| ApplicationNewHealthReport | [ApplicationNewHealthReportEvent](sfclient-v70-model-applicationnewhealthreportevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-v70-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeCompleted | [ApplicationUpgradeCompletedEvent](sfclient-v70-model-applicationupgradecompletedevent.md) |
| ApplicationUpgradeDomainCompleted | [ApplicationUpgradeDomainCompletedEvent](sfclient-v70-model-applicationupgradedomaincompletedevent.md) |
| ApplicationUpgradeRollbackCompleted | [ApplicationUpgradeRollbackCompletedEvent](sfclient-v70-model-applicationupgraderollbackcompletedevent.md) |
| ApplicationUpgradeRollbackStarted | [ApplicationUpgradeRollbackStartedEvent](sfclient-v70-model-applicationupgraderollbackstartedevent.md) |
| ApplicationUpgradeStarted | [ApplicationUpgradeStartedEvent](sfclient-v70-model-applicationupgradestartedevent.md) |
| DeployedApplicationNewHealthReport | [DeployedApplicationNewHealthReportEvent](sfclient-v70-model-deployedapplicationnewhealthreportevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-v70-model-deployedapplicationhealthreportexpiredevent.md) |
| ApplicationProcessExited | [ApplicationProcessExitedEvent](sfclient-v70-model-applicationprocessexitedevent.md) |
| ApplicationContainerInstanceExited | [ApplicationContainerInstanceExitedEvent](sfclient-v70-model-applicationcontainerinstanceexitedevent.md) |
| DeployedServicePackageNewHealthReport | [DeployedServicePackageNewHealthReportEvent](sfclient-v70-model-deployedservicepackagenewhealthreportevent.md) |
| DeployedServicePackageHealthReportExpired | [DeployedServicePackageHealthReportExpiredEvent](sfclient-v70-model-deployedservicepackagehealthreportexpiredevent.md) |
| ChaosCodePackageRestartScheduled | [ChaosCodePackageRestartScheduledEvent](sfclient-v70-model-chaoscodepackagerestartscheduledevent.md) |
| ClusterNewHealthReport | [ClusterNewHealthReportEvent](sfclient-v70-model-clusternewhealthreportevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-v70-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeCompleted | [ClusterUpgradeCompletedEvent](sfclient-v70-model-clusterupgradecompletedevent.md) |
| ClusterUpgradeDomainCompleted | [ClusterUpgradeDomainCompletedEvent](sfclient-v70-model-clusterupgradedomaincompletedevent.md) |
| ClusterUpgradeRollbackCompleted | [ClusterUpgradeRollbackCompletedEvent](sfclient-v70-model-clusterupgraderollbackcompletedevent.md) |
| ClusterUpgradeRollbackStarted | [ClusterUpgradeRollbackStartedEvent](sfclient-v70-model-clusterupgraderollbackstartedevent.md) |
| ClusterUpgradeStarted | [ClusterUpgradeStartedEvent](sfclient-v70-model-clusterupgradestartedevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-v70-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-v70-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-v70-model-nodeabortedevent.md) |
| NodeAddedToCluster | [NodeAddedToClusterEvent](sfclient-v70-model-nodeaddedtoclusterevent.md) |
| NodeClosed | [NodeClosedEvent](sfclient-v70-model-nodeclosedevent.md) |
| NodeDeactivateCompleted | [NodeDeactivateCompletedEvent](sfclient-v70-model-nodedeactivatecompletedevent.md) |
| NodeDeactivateStarted | [NodeDeactivateStartedEvent](sfclient-v70-model-nodedeactivatestartedevent.md) |
| NodeDown | [NodeDownEvent](sfclient-v70-model-nodedownevent.md) |
| NodeNewHealthReport | [NodeNewHealthReportEvent](sfclient-v70-model-nodenewhealthreportevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-v70-model-nodehealthreportexpiredevent.md) |
| NodeOpenSucceeded | [NodeOpenSucceededEvent](sfclient-v70-model-nodeopensucceededevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-v70-model-nodeopenfailedevent.md) |
| NodeRemovedFromCluster | [NodeRemovedFromClusterEvent](sfclient-v70-model-noderemovedfromclusterevent.md) |
| NodeUp | [NodeUpEvent](sfclient-v70-model-nodeupevent.md) |
| ChaosNodeRestartScheduled | [ChaosNodeRestartScheduledEvent](sfclient-v70-model-chaosnoderestartscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-v70-model-partitionanalysisevent.md) |
| PartitionNewHealthReport | [PartitionNewHealthReportEvent](sfclient-v70-model-partitionnewhealthreportevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-v70-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigured | [PartitionReconfiguredEvent](sfclient-v70-model-partitionreconfiguredevent.md) |
| ChaosPartitionSecondaryMoveScheduled | [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v70-model-chaospartitionsecondarymovescheduledevent.md) |
| ChaosPartitionPrimaryMoveScheduled | [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v70-model-chaospartitionprimarymovescheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-v70-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaNewHealthReport | [StatefulReplicaNewHealthReportEvent](sfclient-v70-model-statefulreplicanewhealthreportevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-v70-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaNewHealthReport | [StatelessReplicaNewHealthReportEvent](sfclient-v70-model-statelessreplicanewhealthreportevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-v70-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosReplicaRemovalScheduled | [ChaosReplicaRemovalScheduledEvent](sfclient-v70-model-chaosreplicaremovalscheduledevent.md) |
| ChaosReplicaRestartScheduled | [ChaosReplicaRestartScheduledEvent](sfclient-v70-model-chaosreplicarestartscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-v70-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-v70-model-servicedeletedevent.md) |
| ServiceNewHealthReport | [ServiceNewHealthReportEvent](sfclient-v70-model-servicenewhealthreportevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-v70-model-servicehealthreportexpiredevent.md) |

