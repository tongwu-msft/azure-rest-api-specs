---
title: "UpdateClusterUpgradeDescription"
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
# UpdateClusterUpgradeDescription

Parameters for updating a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`UpgradeKind`](#upgradekind) | string (enum) | No |
| [`UpdateDescription`](#updatedescription) | [RollingUpgradeUpdateDescription](sfclient-model-rollingupgradeupdatedescription.md) | No |
| [`ClusterHealthPolicy`](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | No |
| [`EnableDeltaHealthEvaluation`](#enabledeltahealthevaluation) | boolean | No |
| [`ClusterUpgradeHealthPolicy`](#clusterupgradehealthpolicy) | [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) | No |
| [`ApplicationHealthPolicyMap`](#applicationhealthpolicymap) | [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) | No |

____
### `UpgradeKind`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `Rolling` <br/>
<br/>


The type of upgrade out of the following possible values.

Possible values are: 

  - `Invalid` - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Rolling` - The upgrade progresses one upgrade domain at a time. The value is 1.
  - `Rolling_ForceRestart` - The upgrade gets restarted by force. The value is 2.



____
### `UpdateDescription`
__Type__: [RollingUpgradeUpdateDescription](sfclient-model-rollingupgradeupdatedescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters for updating a rolling upgrade of application or cluster.

____
### `ClusterHealthPolicy`
__Type__: [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) <br/>
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
__Type__: [ClusterUpgradeHealthPolicyObject](sfclient-model-clusterupgradehealthpolicyobject.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.

____
### `ApplicationHealthPolicyMap`
__Type__: [ApplicationHealthPolicies](sfclient-model-applicationhealthpolicies.md) <br/>
__Required__: No<br/>
<br/>
Defines the application health policy map used to evaluate the health of an application or one of its children entities.

