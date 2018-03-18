---
title: "StartClusterUpgradeDescription"
ms.date: "2018-01-22"
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
# StartClusterUpgradeDescription

Describes the parameters for starting a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [CodeVersion](#codeversion) | string | No |
| [ConfigVersion](#configversion) | string | No |
| [UpgradeKind](#upgradekind) | string (enum) | No |
| [RollingUpgradeMode](#rollingupgrademode) | string (enum) | No |
| [UpgradeReplicaSetCheckTimeoutInSeconds](#upgradereplicasetchecktimeoutinseconds) | integer (int64) | No |
| [ForceRestart](#forcerestart) | boolean | No |
| [MonitoringPolicy](#monitoringpolicy) | [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) | No |
| [ClusterHealthPolicy](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | No |
| [EnableDeltaHealthEvaluation](#enabledeltahealthevaluation) | boolean | No |
| [ClusterUpgradeHealthPolicy](#clusterupgradehealthpolicy) | [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) | No |
| [ApplicationHealthPolicyMap](#applicationhealthpolicymap) | [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) | No |

____
### CodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster code version.

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster configuration version.

____
### UpgradeKind
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: Rolling <br/>
<br/>


The kind of upgrade out of the following possible values.

Possible values are: 

  - Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Rolling - The upgrade progresses one upgrade domain at a time. The value is 1



____
### RollingUpgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: UnmonitoredAuto <br/>
<br/>


The mode used to monitor health during a rolling upgrade.

Possible values are: 

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
### EnableDeltaHealthEvaluation
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
When true, enables delta health evaluation rather than absolute health evaluation after completion of each upgrade domain.

____
### ClusterUpgradeHealthPolicy
__Type__: [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.

____
### ApplicationHealthPolicyMap
__Type__: [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) <br/>
__Required__: No<br/>
<br/>
Defines the application health policy map used to evaluate the health of an application or one of its children entities.

