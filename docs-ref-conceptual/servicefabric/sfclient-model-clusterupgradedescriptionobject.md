---
title: "ClusterUpgradeDescriptionObject"
ms.date: "2017-05-08"
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
# ClusterUpgradeDescriptionObject

Represents a ServiceFabric cluster upgrade

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ConfigVersion](#configversion) | string | No |
| [CodeVersion](#codeversion) | string | No |
| [UpgradeKind](#upgradekind) | string (enum) | No |
| [RollingUpgradeMode](#rollingupgrademode) | string (enum) | No |
| [UpgradeReplicaSetCheckTimeoutInSeconds](#upgradereplicasetchecktimeoutinseconds) | integer (int64) | No |
| [ForceRestart](#forcerestart) | boolean | No |
| [EnableDeltaHealthEvaluation](#enabledeltahealthevaluation) | boolean | No |
| [MonitoringPolicy](#monitoringpolicy) | [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) | No |
| [ClusterHealthPolicy](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | No |
| [ClusterUpgradeHealthPolicy](#clusterupgradehealthpolicy) | [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) | No |
| [ApplicationHealthPolicyMap](#applicationhealthpolicymap) | array of [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) | No |

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster configuration version (specified in the cluster manifest).

____
### CodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ServiceFabric code version of the cluster.

____
### UpgradeKind
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: Rolling <br/>
<br/>
The kind of upgrade out of the following possible values.

    - Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - Rolling - The upgrade progresses one upgrade domain at a time. The value is 1


____
### RollingUpgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: UnmonitoredAuto <br/>
<br/>
The mode used to monitor health during a rolling upgrade.

    - Invalid - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - UnmonitoredAuto - The upgrade will proceed automatically without performing any health monitoring. The value is 1
    - UnmonitoredManual - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
    - Monitored - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3


____
### UpgradeReplicaSetCheckTimeoutInSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### ForceRestart
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### EnableDeltaHealthEvaluation
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
When true, enables delta health evaluation rather than absolute health evaluation after completion of each upgrade domain.

____
### MonitoringPolicy
__Type__: [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters for monitoring an upgrade in Monitored mode.

____
### ClusterHealthPolicy
__Type__: [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster or of a cluster node.


____
### ClusterUpgradeHealthPolicy
__Type__: [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.

____
### ApplicationHealthPolicyMap
__Type__: array of [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) <br/>
__Required__: No<br/>
<br/>
Defines a map that contains specific application health policies for different applications.
Each entry specifies as key the application name and as value an ApplicationHealthPolicy used to evaluate the application health.
If an application is not specified in the map, the application health evaluation uses the ApplicationHealthPolicy found in its application manifest or the default application health policy (if no health policy is defined in the manifest).
The map is empty by default.

