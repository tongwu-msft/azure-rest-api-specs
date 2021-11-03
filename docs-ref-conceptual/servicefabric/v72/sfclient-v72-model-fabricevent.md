---
title: "FabricEvent"
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
# FabricEvent

Represents the base for all Fabric Events.
## Inheritance

'FabricEvent' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| ApplicationEvent | [ApplicationEvent](sfclient-v72-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-v72-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-v72-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-v72-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-v72-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-v72-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-v72-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-v72-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-v72-model-applicationdeletedevent.md) |
| ApplicationNewHealthReport | [ApplicationNewHealthReportEvent](sfclient-v72-model-applicationnewhealthreportevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-v72-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeCompleted | [ApplicationUpgradeCompletedEvent](sfclient-v72-model-applicationupgradecompletedevent.md) |
| ApplicationUpgradeDomainCompleted | [ApplicationUpgradeDomainCompletedEvent](sfclient-v72-model-applicationupgradedomaincompletedevent.md) |
| ApplicationUpgradeRollbackCompleted | [ApplicationUpgradeRollbackCompletedEvent](sfclient-v72-model-applicationupgraderollbackcompletedevent.md) |
| ApplicationUpgradeRollbackStarted | [ApplicationUpgradeRollbackStartedEvent](sfclient-v72-model-applicationupgraderollbackstartedevent.md) |
| ApplicationUpgradeStarted | [ApplicationUpgradeStartedEvent](sfclient-v72-model-applicationupgradestartedevent.md) |
| DeployedApplicationNewHealthReport | [DeployedApplicationNewHealthReportEvent](sfclient-v72-model-deployedapplicationnewhealthreportevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-v72-model-deployedapplicationhealthreportexpiredevent.md) |
| ApplicationProcessExited | [ApplicationProcessExitedEvent](sfclient-v72-model-applicationprocessexitedevent.md) |
| ApplicationContainerInstanceExited | [ApplicationContainerInstanceExitedEvent](sfclient-v72-model-applicationcontainerinstanceexitedevent.md) |
| DeployedServicePackageNewHealthReport | [DeployedServicePackageNewHealthReportEvent](sfclient-v72-model-deployedservicepackagenewhealthreportevent.md) |
| DeployedServicePackageHealthReportExpired | [DeployedServicePackageHealthReportExpiredEvent](sfclient-v72-model-deployedservicepackagehealthreportexpiredevent.md) |
| ChaosCodePackageRestartScheduled | [ChaosCodePackageRestartScheduledEvent](sfclient-v72-model-chaoscodepackagerestartscheduledevent.md) |
| ClusterNewHealthReport | [ClusterNewHealthReportEvent](sfclient-v72-model-clusternewhealthreportevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-v72-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeCompleted | [ClusterUpgradeCompletedEvent](sfclient-v72-model-clusterupgradecompletedevent.md) |
| ClusterUpgradeDomainCompleted | [ClusterUpgradeDomainCompletedEvent](sfclient-v72-model-clusterupgradedomaincompletedevent.md) |
| ClusterUpgradeRollbackCompleted | [ClusterUpgradeRollbackCompletedEvent](sfclient-v72-model-clusterupgraderollbackcompletedevent.md) |
| ClusterUpgradeRollbackStarted | [ClusterUpgradeRollbackStartedEvent](sfclient-v72-model-clusterupgraderollbackstartedevent.md) |
| ClusterUpgradeStarted | [ClusterUpgradeStartedEvent](sfclient-v72-model-clusterupgradestartedevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-v72-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-v72-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-v72-model-nodeabortedevent.md) |
| NodeAddedToCluster | [NodeAddedToClusterEvent](sfclient-v72-model-nodeaddedtoclusterevent.md) |
| NodeClosed | [NodeClosedEvent](sfclient-v72-model-nodeclosedevent.md) |
| NodeDeactivateCompleted | [NodeDeactivateCompletedEvent](sfclient-v72-model-nodedeactivatecompletedevent.md) |
| NodeDeactivateStarted | [NodeDeactivateStartedEvent](sfclient-v72-model-nodedeactivatestartedevent.md) |
| NodeDown | [NodeDownEvent](sfclient-v72-model-nodedownevent.md) |
| NodeNewHealthReport | [NodeNewHealthReportEvent](sfclient-v72-model-nodenewhealthreportevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-v72-model-nodehealthreportexpiredevent.md) |
| NodeOpenSucceeded | [NodeOpenSucceededEvent](sfclient-v72-model-nodeopensucceededevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-v72-model-nodeopenfailedevent.md) |
| NodeRemovedFromCluster | [NodeRemovedFromClusterEvent](sfclient-v72-model-noderemovedfromclusterevent.md) |
| NodeUp | [NodeUpEvent](sfclient-v72-model-nodeupevent.md) |
| ChaosNodeRestartScheduled | [ChaosNodeRestartScheduledEvent](sfclient-v72-model-chaosnoderestartscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-v72-model-partitionanalysisevent.md) |
| PartitionNewHealthReport | [PartitionNewHealthReportEvent](sfclient-v72-model-partitionnewhealthreportevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-v72-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigured | [PartitionReconfiguredEvent](sfclient-v72-model-partitionreconfiguredevent.md) |
| ChaosPartitionSecondaryMoveScheduled | [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v72-model-chaospartitionsecondarymovescheduledevent.md) |
| ChaosPartitionPrimaryMoveScheduled | [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v72-model-chaospartitionprimarymovescheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-v72-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaNewHealthReport | [StatefulReplicaNewHealthReportEvent](sfclient-v72-model-statefulreplicanewhealthreportevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-v72-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaNewHealthReport | [StatelessReplicaNewHealthReportEvent](sfclient-v72-model-statelessreplicanewhealthreportevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-v72-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosReplicaRemovalScheduled | [ChaosReplicaRemovalScheduledEvent](sfclient-v72-model-chaosreplicaremovalscheduledevent.md) |
| ChaosReplicaRestartScheduled | [ChaosReplicaRestartScheduledEvent](sfclient-v72-model-chaosreplicarestartscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-v72-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-v72-model-servicedeletedevent.md) |
| ServiceNewHealthReport | [ServiceNewHealthReportEvent](sfclient-v72-model-servicenewhealthreportevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-v72-model-servicehealthreportexpiredevent.md) |

