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
| ApplicationEvent | [ApplicationEvent](sfclient-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-model-applicationdeletedevent.md) |
| ApplicationNewHealthReport | [ApplicationNewHealthReportEvent](sfclient-model-applicationnewhealthreportevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeCompleted | [ApplicationUpgradeCompletedEvent](sfclient-model-applicationupgradecompletedevent.md) |
| ApplicationUpgradeDomainCompleted | [ApplicationUpgradeDomainCompletedEvent](sfclient-model-applicationupgradedomaincompletedevent.md) |
| ApplicationUpgradeRollbackCompleted | [ApplicationUpgradeRollbackCompletedEvent](sfclient-model-applicationupgraderollbackcompletedevent.md) |
| ApplicationUpgradeRollbackStarted | [ApplicationUpgradeRollbackStartedEvent](sfclient-model-applicationupgraderollbackstartedevent.md) |
| ApplicationUpgradeStarted | [ApplicationUpgradeStartedEvent](sfclient-model-applicationupgradestartedevent.md) |
| DeployedApplicationNewHealthReport | [DeployedApplicationNewHealthReportEvent](sfclient-model-deployedapplicationnewhealthreportevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-model-deployedapplicationhealthreportexpiredevent.md) |
| ApplicationProcessExited | [ApplicationProcessExitedEvent](sfclient-model-applicationprocessexitedevent.md) |
| ApplicationContainerInstanceExited | [ApplicationContainerInstanceExitedEvent](sfclient-model-applicationcontainerinstanceexitedevent.md) |
| DeployedServicePackageNewHealthReport | [DeployedServicePackageNewHealthReportEvent](sfclient-model-deployedservicepackagenewhealthreportevent.md) |
| DeployedServicePackageHealthReportExpired | [DeployedServicePackageHealthReportExpiredEvent](sfclient-model-deployedservicepackagehealthreportexpiredevent.md) |
| ChaosCodePackageRestartScheduled | [ChaosCodePackageRestartScheduledEvent](sfclient-model-chaoscodepackagerestartscheduledevent.md) |
| ClusterNewHealthReport | [ClusterNewHealthReportEvent](sfclient-model-clusternewhealthreportevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeCompleted | [ClusterUpgradeCompletedEvent](sfclient-model-clusterupgradecompletedevent.md) |
| ClusterUpgradeDomainCompleted | [ClusterUpgradeDomainCompletedEvent](sfclient-model-clusterupgradedomaincompletedevent.md) |
| ClusterUpgradeRollbackCompleted | [ClusterUpgradeRollbackCompletedEvent](sfclient-model-clusterupgraderollbackcompletedevent.md) |
| ClusterUpgradeRollbackStarted | [ClusterUpgradeRollbackStartedEvent](sfclient-model-clusterupgraderollbackstartedevent.md) |
| ClusterUpgradeStarted | [ClusterUpgradeStartedEvent](sfclient-model-clusterupgradestartedevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-model-nodeabortedevent.md) |
| NodeAddedToCluster | [NodeAddedToClusterEvent](sfclient-model-nodeaddedtoclusterevent.md) |
| NodeClosed | [NodeClosedEvent](sfclient-model-nodeclosedevent.md) |
| NodeDeactivateCompleted | [NodeDeactivateCompletedEvent](sfclient-model-nodedeactivatecompletedevent.md) |
| NodeDeactivateStarted | [NodeDeactivateStartedEvent](sfclient-model-nodedeactivatestartedevent.md) |
| NodeDown | [NodeDownEvent](sfclient-model-nodedownevent.md) |
| NodeNewHealthReport | [NodeNewHealthReportEvent](sfclient-model-nodenewhealthreportevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-model-nodehealthreportexpiredevent.md) |
| NodeOpenSucceeded | [NodeOpenSucceededEvent](sfclient-model-nodeopensucceededevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-model-nodeopenfailedevent.md) |
| NodeRemovedFromCluster | [NodeRemovedFromClusterEvent](sfclient-model-noderemovedfromclusterevent.md) |
| NodeUp | [NodeUpEvent](sfclient-model-nodeupevent.md) |
| ChaosNodeRestartScheduled | [ChaosNodeRestartScheduledEvent](sfclient-model-chaosnoderestartscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-model-partitionanalysisevent.md) |
| PartitionNewHealthReport | [PartitionNewHealthReportEvent](sfclient-model-partitionnewhealthreportevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigured | [PartitionReconfiguredEvent](sfclient-model-partitionreconfiguredevent.md) |
| ChaosPartitionSecondaryMoveScheduled | [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-model-chaospartitionsecondarymovescheduledevent.md) |
| ChaosPartitionPrimaryMoveScheduled | [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-model-chaospartitionprimarymovescheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaNewHealthReport | [StatefulReplicaNewHealthReportEvent](sfclient-model-statefulreplicanewhealthreportevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaNewHealthReport | [StatelessReplicaNewHealthReportEvent](sfclient-model-statelessreplicanewhealthreportevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosReplicaRemovalScheduled | [ChaosReplicaRemovalScheduledEvent](sfclient-model-chaosreplicaremovalscheduledevent.md) |
| ChaosReplicaRestartScheduled | [ChaosReplicaRestartScheduledEvent](sfclient-model-chaosreplicarestartscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-model-servicedeletedevent.md) |
| ServiceNewHealthReport | [ServiceNewHealthReportEvent](sfclient-model-servicenewhealthreportevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-model-servicehealthreportexpiredevent.md) |

