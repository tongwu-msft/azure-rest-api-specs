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
| ApplicationEvent | [ApplicationEvent](sfclient-v62-model-applicationevent.md) |
| ClusterEvent | [ClusterEvent](sfclient-v62-model-clusterevent.md) |
| ContainerInstanceEvent | [ContainerInstanceEvent](sfclient-v62-model-containerinstanceevent.md) |
| NodeEvent | [NodeEvent](sfclient-v62-model-nodeevent.md) |
| PartitionEvent | [PartitionEvent](sfclient-v62-model-partitionevent.md) |
| ReplicaEvent | [ReplicaEvent](sfclient-v62-model-replicaevent.md) |
| ServiceEvent | [ServiceEvent](sfclient-v62-model-serviceevent.md) |
| ApplicationCreated | [ApplicationCreatedEvent](sfclient-v62-model-applicationcreatedevent.md) |
| ApplicationDeleted | [ApplicationDeletedEvent](sfclient-v62-model-applicationdeletedevent.md) |
| ApplicationHealthReportCreated | [ApplicationHealthReportCreatedEvent](sfclient-v62-model-applicationhealthreportcreatedevent.md) |
| ApplicationHealthReportExpired | [ApplicationHealthReportExpiredEvent](sfclient-v62-model-applicationhealthreportexpiredevent.md) |
| ApplicationUpgradeComplete | [ApplicationUpgradeCompleteEvent](sfclient-v62-model-applicationupgradecompleteevent.md) |
| ApplicationUpgradeDomainComplete | [ApplicationUpgradeDomainCompleteEvent](sfclient-v62-model-applicationupgradedomaincompleteevent.md) |
| ApplicationUpgradeRollbackComplete | [ApplicationUpgradeRollbackCompleteEvent](sfclient-v62-model-applicationupgraderollbackcompleteevent.md) |
| ApplicationUpgradeRollbackStart | [ApplicationUpgradeRollbackStartEvent](sfclient-v62-model-applicationupgraderollbackstartevent.md) |
| ApplicationUpgradeStart | [ApplicationUpgradeStartEvent](sfclient-v62-model-applicationupgradestartevent.md) |
| DeployedApplicationHealthReportCreated | [DeployedApplicationHealthReportCreatedEvent](sfclient-v62-model-deployedapplicationhealthreportcreatedevent.md) |
| DeployedApplicationHealthReportExpired | [DeployedApplicationHealthReportExpiredEvent](sfclient-v62-model-deployedapplicationhealthreportexpiredevent.md) |
| ProcessDeactivated | [ProcessDeactivatedEvent](sfclient-v62-model-processdeactivatedevent.md) |
| ContainerDeactivated | [ContainerDeactivatedEvent](sfclient-v62-model-containerdeactivatedevent.md) |
| DeployedServiceHealthReportCreated | [DeployedServiceHealthReportCreatedEvent](sfclient-v62-model-deployedservicehealthreportcreatedevent.md) |
| DeployedServiceHealthReportExpired | [DeployedServiceHealthReportExpiredEvent](sfclient-v62-model-deployedservicehealthreportexpiredevent.md) |
| ChaosRestartCodePackageFaultScheduled | [ChaosRestartCodePackageFaultScheduledEvent](sfclient-v62-model-chaosrestartcodepackagefaultscheduledevent.md) |
| ChaosRestartCodePackageFaultCompleted | [ChaosRestartCodePackageFaultCompletedEvent](sfclient-v62-model-chaosrestartcodepackagefaultcompletedevent.md) |
| ClusterHealthReportCreated | [ClusterHealthReportCreatedEvent](sfclient-v62-model-clusterhealthreportcreatedevent.md) |
| ClusterHealthReportExpired | [ClusterHealthReportExpiredEvent](sfclient-v62-model-clusterhealthreportexpiredevent.md) |
| ClusterUpgradeComplete | [ClusterUpgradeCompleteEvent](sfclient-v62-model-clusterupgradecompleteevent.md) |
| ClusterUpgradeDomainComplete | [ClusterUpgradeDomainCompleteEvent](sfclient-v62-model-clusterupgradedomaincompleteevent.md) |
| ClusterUpgradeRollbackComplete | [ClusterUpgradeRollbackCompleteEvent](sfclient-v62-model-clusterupgraderollbackcompleteevent.md) |
| ClusterUpgradeRollbackStart | [ClusterUpgradeRollbackStartEvent](sfclient-v62-model-clusterupgraderollbackstartevent.md) |
| ClusterUpgradeStart | [ClusterUpgradeStartEvent](sfclient-v62-model-clusterupgradestartevent.md) |
| ChaosStopped | [ChaosStoppedEvent](sfclient-v62-model-chaosstoppedevent.md) |
| ChaosStarted | [ChaosStartedEvent](sfclient-v62-model-chaosstartedevent.md) |
| NodeAborted | [NodeAbortedEvent](sfclient-v62-model-nodeabortedevent.md) |
| NodeAborting | [NodeAbortingEvent](sfclient-v62-model-nodeabortingevent.md) |
| NodeAdded | [NodeAddedEvent](sfclient-v62-model-nodeaddedevent.md) |
| NodeClose | [NodeCloseEvent](sfclient-v62-model-nodecloseevent.md) |
| NodeClosing | [NodeClosingEvent](sfclient-v62-model-nodeclosingevent.md) |
| NodeDeactivateComplete | [NodeDeactivateCompleteEvent](sfclient-v62-model-nodedeactivatecompleteevent.md) |
| NodeDeactivateStart | [NodeDeactivateStartEvent](sfclient-v62-model-nodedeactivatestartevent.md) |
| NodeDown | [NodeDownEvent](sfclient-v62-model-nodedownevent.md) |
| NodeHealthReportCreated | [NodeHealthReportCreatedEvent](sfclient-v62-model-nodehealthreportcreatedevent.md) |
| NodeHealthReportExpired | [NodeHealthReportExpiredEvent](sfclient-v62-model-nodehealthreportexpiredevent.md) |
| NodeOpenedSuccess | [NodeOpenedSuccessEvent](sfclient-v62-model-nodeopenedsuccessevent.md) |
| NodeOpenFailed | [NodeOpenFailedEvent](sfclient-v62-model-nodeopenfailedevent.md) |
| NodeOpening | [NodeOpeningEvent](sfclient-v62-model-nodeopeningevent.md) |
| NodeRemoved | [NodeRemovedEvent](sfclient-v62-model-noderemovedevent.md) |
| NodeUp | [NodeUpEvent](sfclient-v62-model-nodeupevent.md) |
| ChaosRestartNodeFaultCompleted | [ChaosRestartNodeFaultCompletedEvent](sfclient-v62-model-chaosrestartnodefaultcompletedevent.md) |
| ChaosRestartNodeFaultScheduled | [ChaosRestartNodeFaultScheduledEvent](sfclient-v62-model-chaosrestartnodefaultscheduledevent.md) |
| PartitionAnalysisEvent | [PartitionAnalysisEvent](sfclient-v62-model-partitionanalysisevent.md) |
| PartitionHealthReportCreated | [PartitionHealthReportCreatedEvent](sfclient-v62-model-partitionhealthreportcreatedevent.md) |
| PartitionHealthReportExpired | [PartitionHealthReportExpiredEvent](sfclient-v62-model-partitionhealthreportexpiredevent.md) |
| PartitionReconfigurationCompleted | [PartitionReconfigurationCompletedEvent](sfclient-v62-model-partitionreconfigurationcompletedevent.md) |
| ChaosMoveSecondaryFaultScheduled | [ChaosMoveSecondaryFaultScheduledEvent](sfclient-v62-model-chaosmovesecondaryfaultscheduledevent.md) |
| ChaosMovePrimaryFaultScheduled | [ChaosMovePrimaryFaultScheduledEvent](sfclient-v62-model-chaosmoveprimaryfaultscheduledevent.md) |
| PartitionPrimaryMoveAnalysis | [PartitionPrimaryMoveAnalysisEvent](sfclient-v62-model-partitionprimarymoveanalysisevent.md) |
| StatefulReplicaHealthReportCreated | [StatefulReplicaHealthReportCreatedEvent](sfclient-v62-model-statefulreplicahealthreportcreatedevent.md) |
| StatefulReplicaHealthReportExpired | [StatefulReplicaHealthReportExpiredEvent](sfclient-v62-model-statefulreplicahealthreportexpiredevent.md) |
| StatelessReplicaHealthReportCreated | [StatelessReplicaHealthReportCreatedEvent](sfclient-v62-model-statelessreplicahealthreportcreatedevent.md) |
| StatelessReplicaHealthReportExpired | [StatelessReplicaHealthReportExpiredEvent](sfclient-v62-model-statelessreplicahealthreportexpiredevent.md) |
| ChaosRemoveReplicaFaultScheduled | [ChaosRemoveReplicaFaultScheduledEvent](sfclient-v62-model-chaosremovereplicafaultscheduledevent.md) |
| ChaosRemoveReplicaFaultCompleted | [ChaosRemoveReplicaFaultCompletedEvent](sfclient-v62-model-chaosremovereplicafaultcompletedevent.md) |
| ChaosRestartReplicaFaultScheduled | [ChaosRestartReplicaFaultScheduledEvent](sfclient-v62-model-chaosrestartreplicafaultscheduledevent.md) |
| ServiceCreated | [ServiceCreatedEvent](sfclient-v62-model-servicecreatedevent.md) |
| ServiceDeleted | [ServiceDeletedEvent](sfclient-v62-model-servicedeletedevent.md) |
| ServiceHealthReportCreated | [ServiceHealthReportCreatedEvent](sfclient-v62-model-servicehealthreportcreatedevent.md) |
| ServiceHealthReportExpired | [ServiceHealthReportExpiredEvent](sfclient-v62-model-servicehealthreportexpiredevent.md) |

