---
title: "FabricEvent"
ms.date: "2018-04-23"
ms.prod: "azure"
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
# Inheritance

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
| ApplicationHealthReportCreated | [ApplicationHealthReportCreatedEvent](sfclient-model-applicationhealthreportcreatedevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeComplete | [ApplicationUpgradeCompleteEvent](sfclient-model-applicationupgradecompleteevent.md) |
| ApplicationUpgradeDomainComplete | [ApplicationUpgradeDomainCompleteEvent](sfclient-model-applicationupgradedomaincompleteevent.md) |
| ApplicationUpgradeRollbackComplete | [ApplicationUpgradeRollbackCompleteEvent](sfclient-model-applicationupgraderollbackcompleteevent.md) |
| ApplicationUpgradeRollbackStart | [ApplicationUpgradeRollbackStartEvent](sfclient-model-applicationupgraderollbackstartevent.md) |
| ApplicationUpgradeStart | [ApplicationUpgradeStartEvent](sfclient-model-applicationupgradestartevent.md) |
| DeployedApplicationHealthReportCreated | [DeployedApplicationHealthReportCreatedEvent](sfclient-model-deployedapplicationhealthreportcreatedevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-model-deployedapplicationhealthreportexpiredevent.md) |
| ProcessDeactivated | [ProcessDeactivatedEvent](sfclient-model-processdeactivatedevent.md) |
| ContainerDeactivated | [ContainerDeactivatedEvent](sfclient-model-containerdeactivatedevent.md) |
| DeployedServiceHealthReportCreated | [DeployedServiceHealthReportCreatedEvent](sfclient-model-deployedservicehealthreportcreatedevent.md) |
| DeployedServiceHealthReportExpired | [DeployedServiceHealthReportExpiredEvent](sfclient-model-deployedservicehealthreportexpiredevent.md) |
| ChaosRestartCodePackageFaultScheduled | [ChaosRestartCodePackageFaultScheduledEvent](sfclient-model-chaosrestartcodepackagefaultscheduledevent.md) |
| ChaosRestartCodePackageFaultCompleted | [ChaosRestartCodePackageFaultCompletedEvent](sfclient-model-chaosrestartcodepackagefaultcompletedevent.md) |
| ClusterHealthReportCreated | [ClusterHealthReportCreatedEvent](sfclient-model-clusterhealthreportcreatedevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeComplete | [ClusterUpgradeCompleteEvent](sfclient-model-clusterupgradecompleteevent.md) |
| ClusterUpgradeDomainComplete | [ClusterUpgradeDomainCompleteEvent](sfclient-model-clusterupgradedomaincompleteevent.md) |
| ClusterUpgradeRollbackComplete | [ClusterUpgradeRollbackCompleteEvent](sfclient-model-clusterupgraderollbackcompleteevent.md) |
| ClusterUpgradeRollbackStart | [ClusterUpgradeRollbackStartEvent](sfclient-model-clusterupgraderollbackstartevent.md) |
| ClusterUpgradeStart | [ClusterUpgradeStartEvent](sfclient-model-clusterupgradestartevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-model-nodeabortedevent.md) |
| NodeAborting | [NodeAbortingEvent](sfclient-model-nodeabortingevent.md) |
| NodeAdded | [NodeAddedEvent](sfclient-model-nodeaddedevent.md) |
| NodeClose | [NodeCloseEvent](sfclient-model-nodecloseevent.md) |
| NodeClosing | [NodeClosingEvent](sfclient-model-nodeclosingevent.md) |
| NodeDeactivateComplete | [NodeDeactivateCompleteEvent](sfclient-model-nodedeactivatecompleteevent.md) |
| NodeDeactivateStart | [NodeDeactivateStartEvent](sfclient-model-nodedeactivatestartevent.md) |
| NodeDown | [NodeDownEvent](sfclient-model-nodedownevent.md) |
| NodeHealthReportCreated | [NodeHealthReportCreatedEvent](sfclient-model-nodehealthreportcreatedevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-model-nodehealthreportexpiredevent.md) |
| NodeOpenedSuccess | [NodeOpenedSuccessEvent](sfclient-model-nodeopenedsuccessevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-model-nodeopenfailedevent.md) |
| NodeOpening | [NodeOpeningEvent](sfclient-model-nodeopeningevent.md) |
| NodeRemoved | [NodeRemovedEvent](sfclient-model-noderemovedevent.md) |
| NodeUp | [NodeUpEvent](sfclient-model-nodeupevent.md) |
| ChaosRestartNodeFaultCompleted | [ChaosRestartNodeFaultCompletedEvent](sfclient-model-chaosrestartnodefaultcompletedevent.md) |
| ChaosRestartNodeFaultScheduled | [ChaosRestartNodeFaultScheduledEvent](sfclient-model-chaosrestartnodefaultscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-model-partitionanalysisevent.md) |
| PartitionHealthReportCreated | [PartitionHealthReportCreatedEvent](sfclient-model-partitionhealthreportcreatedevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigurationCompleted | [PartitionReconfigurationCompletedEvent](sfclient-model-partitionreconfigurationcompletedevent.md) |
| ChaosMoveSecondaryFaultScheduled | [ChaosMoveSecondaryFaultScheduledEvent](sfclient-model-chaosmovesecondaryfaultscheduledevent.md) |
| ChaosMovePrimaryFaultScheduled | [ChaosMovePrimaryFaultScheduledEvent](sfclient-model-chaosmoveprimaryfaultscheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaHealthReportCreated | [StatefulReplicaHealthReportCreatedEvent](sfclient-model-statefulreplicahealthreportcreatedevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaHealthReportCreated | [StatelessReplicaHealthReportCreatedEvent](sfclient-model-statelessreplicahealthreportcreatedevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosRemoveReplicaFaultScheduled | [ChaosRemoveReplicaFaultScheduledEvent](sfclient-model-chaosremovereplicafaultscheduledevent.md) |
| ChaosRemoveReplicaFaultCompleted | [ChaosRemoveReplicaFaultCompletedEvent](sfclient-model-chaosremovereplicafaultcompletedevent.md) |
| ChaosRestartReplicaFaultScheduled | [ChaosRestartReplicaFaultScheduledEvent](sfclient-model-chaosrestartreplicafaultscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-model-servicedeletedevent.md) |
| ServiceHealthReportCreated | [ServiceHealthReportCreatedEvent](sfclient-model-servicehealthreportcreatedevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-model-servicehealthreportexpiredevent.md) |

