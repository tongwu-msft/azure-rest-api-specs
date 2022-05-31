---
title: "StartClusterUpgradeDescription v82"
description: "StartClusterUpgradeDescription v82"
ms.date: "10/20/2021"
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
# StartClusterUpgradeDescription v82

Describes the parameters for starting a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`CodeVersion`](#codeversion) | string | No |
| [`ConfigVersion`](#configversion) | string | No |
| [`UpgradeKind`](#upgradekind) | string (enum) | No |
| [`RollingUpgradeMode`](#rollingupgrademode) | string (enum) | No |
| [`UpgradeReplicaSetCheckTimeoutInSeconds`](#upgradereplicasetchecktimeoutinseconds) | integer (int64) | No |
| [`ForceRestart`](#forcerestart) | boolean | No |
| [`SortOrder`](#sortorder) | string (enum) | No |
| [`MonitoringPolicy`](#monitoringpolicy) | [MonitoringPolicyDescription](sfclient-v82-model-monitoringpolicydescription.md) | No |
| [`ClusterHealthPolicy`](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-v82-model-clusterhealthpolicy.md) | No |
| [`EnableDeltaHealthEvaluation`](#enabledeltahealthevaluation) | boolean | No |
| [`ClusterUpgradeHealthPolicy`](#clusterupgradehealthpolicy) | [ClusterUpgradeHealthPolicyObject](sfclient-v82-model-clusterupgradehealthpolicyobject.md) | No |
| [`ApplicationHealthPolicyMap`](#applicationhealthpolicymap) | [ApplicationHealthPolicies](sfclient-v82-model-applicationhealthpolicies.md) | No |
| [`InstanceCloseDelayDurationInSeconds`](#instanceclosedelaydurationinseconds) | integer (int64) | No |

____
### `CodeVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster code version.

____
### `ConfigVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster configuration version.

____
### `UpgradeKind`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `Rolling` <br/>
<br/>


The kind of upgrade out of the following possible values.

Possible values are: 

  - `Invalid` - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Rolling` - The upgrade progresses one upgrade domain at a time. The value is 1



____
### `RollingUpgradeMode`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `UnmonitoredAuto` <br/>
<br/>


The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, Monitored, and UnmonitoredDeferred.

Possible values are: 

  - `Invalid` - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `UnmonitoredAuto` - The upgrade will proceed automatically without performing any health monitoring. The value is 1
  - `UnmonitoredManual` - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
  - `Monitored` - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3
  - `UnmonitoredDeferred` - Perform a node-by-node upgrade. No action is performed when upgrade starts; upgrade is applied on each node when it is deactivated with intent restart or higher. The value is 4



____
### `UpgradeReplicaSetCheckTimeoutInSeconds`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### `ForceRestart`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### `SortOrder`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `Default` <br/>
<br/>


Defines the order in which an upgrade proceeds through the cluster.

Possible values are: 

  - `Invalid` - Indicates that this sort order is not valid. All Service Fabric enumerations have the invalid type. The value is 0.
  - `Default` - Indicates that the default sort order (as specified in cluster manifest) will be used. The value is 1.
  - `Numeric` - Indicates that forward numeric sort order (UD names sorted as numbers) will be used. The value is 2.
  - `Lexicographical` - Indicates that forward lexicographical sort order (UD names sorted as strings) will be used. The value is 3.
  - `ReverseNumeric` - Indicates that reverse numeric sort order (UD names sorted as numbers) will be used. The value is 4.
  - `ReverseLexicographical` - Indicates that reverse lexicographical sort order (UD names sorted as strings) will be used. The value is 5.



____
### `MonitoringPolicy`
__Type__: [MonitoringPolicyDescription](sfclient-v82-model-monitoringpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters for monitoring an upgrade in Monitored mode.

____
### `ClusterHealthPolicy`
__Type__: [ClusterHealthPolicy](sfclient-v82-model-clusterhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster or of a cluster node.


____
### `EnableDeltaHealthEvaluation`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
When true, enables delta health evaluation rather than absolute health evaluation after completion of each upgrade domain.

____
### `ClusterUpgradeHealthPolicy`
__Type__: [ClusterUpgradeHealthPolicyObject](sfclient-v82-model-clusterupgradehealthpolicyobject.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.

____
### `ApplicationHealthPolicyMap`
__Type__: [ApplicationHealthPolicies](sfclient-v82-model-applicationhealthpolicies.md) <br/>
__Required__: No<br/>
<br/>
Defines the application health policy map used to evaluate the health of an application or one of its children entities.


____
### `InstanceCloseDelayDurationInSeconds`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Duration in seconds, to wait before a stateless instance is closed, to allow the active requests to drain gracefully. This would be effective when the instance is closing during the application/cluster
upgrade, only for those instances which have a non-zero delay duration configured in the service description. See InstanceCloseDelayDurationSeconds property in $ref: "#/definitions/StatelessServiceDescription.yaml" for details.
Note, the default value of InstanceCloseDelayDurationInSeconds is 4294967295, which indicates that the behavior will entirely depend on the delay configured in the stateless service description.

