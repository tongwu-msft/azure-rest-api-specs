---
title: "FabricEvent"
ms.date: 07/20/2018
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
# FabricEvent

Represents the base for all Fabric Events.
## Inheritance

'FabricEvent' is the base type of the polymorphic type model. The 'Kind' property is the discriminator for the derived types. 
The value of the 'Kind' property determines the serialized content on the wire (one of the following derived types). 
The following table lists the value of the `Kind` property and corresponding derived type it represents.
## Derived Types

| Kind | Derived Type |
| --- | --- | 
| ApplicationEvent | [ApplicationEvent](sfclient-v63-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-v63-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-v63-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-v63-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-v63-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-v63-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-v63-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-v63-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-v63-model-applicationdeletedevent.md) |
| ApplicationHealthReportCreated | [ApplicationHealthReportCreatedEvent](sfclient-v63-model-applicationhealthreportcreatedevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-v63-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeComplete | [ApplicationUpgradeCompleteEvent](sfclient-v63-model-applicationupgradecompleteevent.md) |
| ApplicationUpgradeDomainComplete | [ApplicationUpgradeDomainCompleteEvent](sfclient-v63-model-applicationupgradedomaincompleteevent.md) |
| ApplicationUpgradeRollbackComplete | [ApplicationUpgradeRollbackCompleteEvent](sfclient-v63-model-applicationupgraderollbackcompleteevent.md) |
| ApplicationUpgradeRollbackStart | [ApplicationUpgradeRollbackStartEvent](sfclient-v63-model-applicationupgraderollbackstartevent.md) |
| ApplicationUpgradeStart | [ApplicationUpgradeStartEvent](sfclient-v63-model-applicationupgradestartevent.md) |
| DeployedApplicationHealthReportCreated | [DeployedApplicationHealthReportCreatedEvent](sfclient-v63-model-deployedapplicationhealthreportcreatedevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-v63-model-deployedapplicationhealthreportexpiredevent.md) |
| ProcessDeactivated | [ProcessDeactivatedEvent](sfclient-v63-model-processdeactivatedevent.md) |
| ContainerDeactivated | [ContainerDeactivatedEvent](sfclient-v63-model-containerdeactivatedevent.md) |
| DeployedServiceHealthReportCreated | [DeployedServiceHealthReportCreatedEvent](sfclient-v63-model-deployedservicehealthreportcreatedevent.md) |
| DeployedServiceHealthReportExpired | [DeployedServiceHealthReportExpiredEvent](sfclient-v63-model-deployedservicehealthreportexpiredevent.md) |
| ChaosRestartCodePackageFaultScheduled | [ChaosRestartCodePackageFaultScheduledEvent](sfclient-v63-model-chaosrestartcodepackagefaultscheduledevent.md) |
| ChaosRestartCodePackageFaultCompleted | [ChaosRestartCodePackageFaultCompletedEvent](sfclient-v63-model-chaosrestartcodepackagefaultcompletedevent.md) |
| ClusterHealthReportCreated | [ClusterHealthReportCreatedEvent](sfclient-v63-model-clusterhealthreportcreatedevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-v63-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeComplete | [ClusterUpgradeCompleteEvent](sfclient-v63-model-clusterupgradecompleteevent.md) |
| ClusterUpgradeDomainComplete | [ClusterUpgradeDomainCompleteEvent](sfclient-v63-model-clusterupgradedomaincompleteevent.md) |
| ClusterUpgradeRollbackComplete | [ClusterUpgradeRollbackCompleteEvent](sfclient-v63-model-clusterupgraderollbackcompleteevent.md) |
| ClusterUpgradeRollbackStart | [ClusterUpgradeRollbackStartEvent](sfclient-v63-model-clusterupgraderollbackstartevent.md) |
| ClusterUpgradeStart | [ClusterUpgradeStartEvent](sfclient-v63-model-clusterupgradestartevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-v63-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-v63-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-v63-model-nodeabortedevent.md) |
| NodeAborting | [NodeAbortingEvent](sfclient-v63-model-nodeabortingevent.md) |
| NodeAdded | [NodeAddedEvent](sfclient-v63-model-nodeaddedevent.md) |
| NodeClose | [NodeCloseEvent](sfclient-v63-model-nodecloseevent.md) |
| NodeClosing | [NodeClosingEvent](sfclient-v63-model-nodeclosingevent.md) |
| NodeDeactivateComplete | [NodeDeactivateCompleteEvent](sfclient-v63-model-nodedeactivatecompleteevent.md) |
| NodeDeactivateStart | [NodeDeactivateStartEvent](sfclient-v63-model-nodedeactivatestartevent.md) |
| NodeDown | [NodeDownEvent](sfclient-v63-model-nodedownevent.md) |
| NodeHealthReportCreated | [NodeHealthReportCreatedEvent](sfclient-v63-model-nodehealthreportcreatedevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-v63-model-nodehealthreportexpiredevent.md) |
| NodeOpenedSuccess | [NodeOpenedSuccessEvent](sfclient-v63-model-nodeopenedsuccessevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-v63-model-nodeopenfailedevent.md) |
| NodeOpening | [NodeOpeningEvent](sfclient-v63-model-nodeopeningevent.md) |
| NodeRemoved | [NodeRemovedEvent](sfclient-v63-model-noderemovedevent.md) |
| NodeUp | [NodeUpEvent](sfclient-v63-model-nodeupevent.md) |
| ChaosRestartNodeFaultCompleted | [ChaosRestartNodeFaultCompletedEvent](sfclient-v63-model-chaosrestartnodefaultcompletedevent.md) |
| ChaosRestartNodeFaultScheduled | [ChaosRestartNodeFaultScheduledEvent](sfclient-v63-model-chaosrestartnodefaultscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-v63-model-partitionanalysisevent.md) |
| PartitionHealthReportCreated | [PartitionHealthReportCreatedEvent](sfclient-v63-model-partitionhealthreportcreatedevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-v63-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigurationCompleted | [PartitionReconfigurationCompletedEvent](sfclient-v63-model-partitionreconfigurationcompletedevent.md) |
| ChaosMoveSecondaryFaultScheduled | [ChaosMoveSecondaryFaultScheduledEvent](sfclient-v63-model-chaosmovesecondaryfaultscheduledevent.md) |
| ChaosMovePrimaryFaultScheduled | [ChaosMovePrimaryFaultScheduledEvent](sfclient-v63-model-chaosmoveprimaryfaultscheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-v63-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaHealthReportCreated | [StatefulReplicaHealthReportCreatedEvent](sfclient-v63-model-statefulreplicahealthreportcreatedevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-v63-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaHealthReportCreated | [StatelessReplicaHealthReportCreatedEvent](sfclient-v63-model-statelessreplicahealthreportcreatedevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-v63-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosRemoveReplicaFaultScheduled | [ChaosRemoveReplicaFaultScheduledEvent](sfclient-v63-model-chaosremovereplicafaultscheduledevent.md) |
| ChaosRemoveReplicaFaultCompleted | [ChaosRemoveReplicaFaultCompletedEvent](sfclient-v63-model-chaosremovereplicafaultcompletedevent.md) |
| ChaosRestartReplicaFaultScheduled | [ChaosRestartReplicaFaultScheduledEvent](sfclient-v63-model-chaosrestartreplicafaultscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-v63-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-v63-model-servicedeletedevent.md) |
| ServiceHealthReportCreated | [ServiceHealthReportCreatedEvent](sfclient-v63-model-servicehealthreportcreatedevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-v63-model-servicehealthreportexpiredevent.md) |

