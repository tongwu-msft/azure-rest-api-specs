---
title: "ClusterConfigurationUpgradeDescription v82"
description: "ClusterConfigurationUpgradeDescription v82"
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
# ClusterConfigurationUpgradeDescription v82

Describes the parameters for a standalone cluster configuration upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ClusterConfig`](#clusterconfig) | string | Yes |
| [`HealthCheckRetryTimeout`](#healthcheckretrytimeout) | string (duration) | No |
| [`HealthCheckWaitDurationInSeconds`](#healthcheckwaitdurationinseconds) | string (duration) | No |
| [`HealthCheckStableDurationInSeconds`](#healthcheckstabledurationinseconds) | string (duration) | No |
| [`UpgradeDomainTimeoutInSeconds`](#upgradedomaintimeoutinseconds) | string (duration) | No |
| [`UpgradeTimeoutInSeconds`](#upgradetimeoutinseconds) | string (duration) | No |
| [`MaxPercentUnhealthyApplications`](#maxpercentunhealthyapplications) | integer | No |
| [`MaxPercentUnhealthyNodes`](#maxpercentunhealthynodes) | integer | No |
| [`MaxPercentDeltaUnhealthyNodes`](#maxpercentdeltaunhealthynodes) | integer | No |
| [`MaxPercentUpgradeDomainDeltaUnhealthyNodes`](#maxpercentupgradedomaindeltaunhealthynodes) | integer | No |
| [`ApplicationHealthPolicies`](#applicationhealthpolicies) | [ApplicationHealthPolicies](sfclient-v82-model-applicationhealthpolicies.md) | No |

____
### `ClusterConfig`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The cluster configuration as a JSON string. For example, [this file](https://github.com/Azure-Samples/service-fabric-dotnet-standalone-cluster-configuration/blob/master/Samples/ClusterConfig.Unsecure.DevCluster.json) contains JSON describing the [nodes and other properties of the cluster](https://docs.microsoft.com/azure/service-fabric/service-fabric-cluster-manifest).

____
### `HealthCheckRetryTimeout`
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: `PT0H0M0S` <br/>
<br/>
The length of time between attempts to perform health checks if the application or cluster is not healthy.

____
### `HealthCheckWaitDurationInSeconds`
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: `PT0H0M0S` <br/>
<br/>
The length of time to wait after completing an upgrade domain before starting the health checks process.

____
### `HealthCheckStableDurationInSeconds`
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: `PT0H0M0S` <br/>
<br/>
The length of time that the application or cluster must remain healthy before the upgrade proceeds to the next upgrade domain.

____
### `UpgradeDomainTimeoutInSeconds`
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: `PT0H0M0S` <br/>
<br/>
The timeout for the upgrade domain.

____
### `UpgradeTimeoutInSeconds`
__Type__: string (duration) <br/>
__Required__: No<br/>
__Default__: `PT0H0M0S` <br/>
<br/>
The upgrade timeout.

____
### `MaxPercentUnhealthyApplications`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
The maximum allowed percentage of unhealthy applications during the upgrade. Allowed values are integer values from zero to 100.

____
### `MaxPercentUnhealthyNodes`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
The maximum allowed percentage of unhealthy nodes during the upgrade. Allowed values are integer values from zero to 100.

____
### `MaxPercentDeltaUnhealthyNodes`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
The maximum allowed percentage of delta health degradation during the upgrade. Allowed values are integer values from zero to 100.

____
### `MaxPercentUpgradeDomainDeltaUnhealthyNodes`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
The maximum allowed percentage of upgrade domain delta health degradation during the upgrade. Allowed values are integer values from zero to 100.

____
### `ApplicationHealthPolicies`
__Type__: [ApplicationHealthPolicies](sfclient-v82-model-applicationhealthpolicies.md) <br/>
__Required__: No<br/>
<br/>
Defines the application health policy map used to evaluate the health of an application or one of its children entities.

