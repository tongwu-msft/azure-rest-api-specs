---
title: "FabricEvent"
ms.date: 06/12/2019
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
| ApplicationEvent | [ApplicationEvent](sfclient-v65-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-v65-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-v65-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-v65-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-v65-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-v65-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-v65-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-v65-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-v65-model-applicationdeletedevent.md) |
| ApplicationNewHealthReport | [ApplicationNewHealthReportEvent](sfclient-v65-model-applicationnewhealthreportevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-v65-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeCompleted | [ApplicationUpgradeCompletedEvent](sfclient-v65-model-applicationupgradecompletedevent.md) |
| ApplicationUpgradeDomainCompleted | [ApplicationUpgradeDomainCompletedEvent](sfclient-v65-model-applicationupgradedomaincompletedevent.md) |
| ApplicationUpgradeRollbackCompleted | [ApplicationUpgradeRollbackCompletedEvent](sfclient-v65-model-applicationupgraderollbackcompletedevent.md) |
| ApplicationUpgradeRollbackStarted | [ApplicationUpgradeRollbackStartedEvent](sfclient-v65-model-applicationupgraderollbackstartedevent.md) |
| ApplicationUpgradeStarted | [ApplicationUpgradeStartedEvent](sfclient-v65-model-applicationupgradestartedevent.md) |
| DeployedApplicationNewHealthReport | [DeployedApplicationNewHealthReportEvent](sfclient-v65-model-deployedapplicationnewhealthreportevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-v65-model-deployedapplicationhealthreportexpiredevent.md) |
| ApplicationProcessExited | [ApplicationProcessExitedEvent](sfclient-v65-model-applicationprocessexitedevent.md) |
| ApplicationContainerInstanceExited | [ApplicationContainerInstanceExitedEvent](sfclient-v65-model-applicationcontainerinstanceexitedevent.md) |
| DeployedServicePackageNewHealthReport | [DeployedServicePackageNewHealthReportEvent](sfclient-v65-model-deployedservicepackagenewhealthreportevent.md) |
| DeployedServicePackageHealthReportExpired | [DeployedServicePackageHealthReportExpiredEvent](sfclient-v65-model-deployedservicepackagehealthreportexpiredevent.md) |
| ChaosCodePackageRestartScheduled | [ChaosCodePackageRestartScheduledEvent](sfclient-v65-model-chaoscodepackagerestartscheduledevent.md) |
| ClusterNewHealthReport | [ClusterNewHealthReportEvent](sfclient-v65-model-clusternewhealthreportevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-v65-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeCompleted | [ClusterUpgradeCompletedEvent](sfclient-v65-model-clusterupgradecompletedevent.md) |
| ClusterUpgradeDomainCompleted | [ClusterUpgradeDomainCompletedEvent](sfclient-v65-model-clusterupgradedomaincompletedevent.md) |
| ClusterUpgradeRollbackCompleted | [ClusterUpgradeRollbackCompletedEvent](sfclient-v65-model-clusterupgraderollbackcompletedevent.md) |
| ClusterUpgradeRollbackStarted | [ClusterUpgradeRollbackStartedEvent](sfclient-v65-model-clusterupgraderollbackstartedevent.md) |
| ClusterUpgradeStarted | [ClusterUpgradeStartedEvent](sfclient-v65-model-clusterupgradestartedevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-v65-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-v65-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-v65-model-nodeabortedevent.md) |
| NodeAddedToCluster | [NodeAddedToClusterEvent](sfclient-v65-model-nodeaddedtoclusterevent.md) |
| NodeClosed | [NodeClosedEvent](sfclient-v65-model-nodeclosedevent.md) |
| NodeDeactivateCompleted | [NodeDeactivateCompletedEvent](sfclient-v65-model-nodedeactivatecompletedevent.md) |
| NodeDeactivateStarted | [NodeDeactivateStartedEvent](sfclient-v65-model-nodedeactivatestartedevent.md) |
| NodeDown | [NodeDownEvent](sfclient-v65-model-nodedownevent.md) |
| NodeNewHealthReport | [NodeNewHealthReportEvent](sfclient-v65-model-nodenewhealthreportevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-v65-model-nodehealthreportexpiredevent.md) |
| NodeOpenSucceeded | [NodeOpenSucceededEvent](sfclient-v65-model-nodeopensucceededevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-v65-model-nodeopenfailedevent.md) |
| NodeRemovedFromCluster | [NodeRemovedFromClusterEvent](sfclient-v65-model-noderemovedfromclusterevent.md) |
| NodeUp | [NodeUpEvent](sfclient-v65-model-nodeupevent.md) |
| ChaosNodeRestartScheduled | [ChaosNodeRestartScheduledEvent](sfclient-v65-model-chaosnoderestartscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-v65-model-partitionanalysisevent.md) |
| PartitionNewHealthReport | [PartitionNewHealthReportEvent](sfclient-v65-model-partitionnewhealthreportevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-v65-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigured | [PartitionReconfiguredEvent](sfclient-v65-model-partitionreconfiguredevent.md) |
| ChaosPartitionSecondaryMoveScheduled | [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v65-model-chaospartitionsecondarymovescheduledevent.md) |
| ChaosPartitionPrimaryMoveScheduled | [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v65-model-chaospartitionprimarymovescheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-v65-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaNewHealthReport | [StatefulReplicaNewHealthReportEvent](sfclient-v65-model-statefulreplicanewhealthreportevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-v65-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaNewHealthReport | [StatelessReplicaNewHealthReportEvent](sfclient-v65-model-statelessreplicanewhealthreportevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-v65-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosReplicaRemovalScheduled | [ChaosReplicaRemovalScheduledEvent](sfclient-v65-model-chaosreplicaremovalscheduledevent.md) |
| ChaosReplicaRestartScheduled | [ChaosReplicaRestartScheduledEvent](sfclient-v65-model-chaosreplicarestartscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-v65-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-v65-model-servicedeletedevent.md) |
| ServiceNewHealthReport | [ServiceNewHealthReportEvent](sfclient-v65-model-servicenewhealthreportevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-v65-model-servicehealthreportexpiredevent.md) |

