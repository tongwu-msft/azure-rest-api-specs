---
title: "ComposeDeploymentUpgradeProgressInfo"
ms.date: "2018-07-20"
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
# ComposeDeploymentUpgradeProgressInfo

Describes the parameters for a compose deployment upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`DeploymentName`](#deploymentname) | string | No |
| [`ApplicationName`](#applicationname) | string | No |
| [`UpgradeState`](#upgradestate) | string (enum) | No |
| [`UpgradeStatusDetails`](#upgradestatusdetails) | string | No |
| [`UpgradeKind`](#upgradekind) | string (enum) | No |
| [`RollingUpgradeMode`](#rollingupgrademode) | string (enum) | No |
| [`ForceRestart`](#forcerestart) | boolean | No |
| [`UpgradeReplicaSetCheckTimeoutInSeconds`](#upgradereplicasetchecktimeoutinseconds) | integer (int64) | No |
| [`MonitoringPolicy`](#monitoringpolicy) | [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) | No |
| [`ApplicationHealthPolicy`](#applicationhealthpolicy) | [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) | No |
| [`TargetApplicationTypeVersion`](#targetapplicationtypeversion) | string | No |
| [`UpgradeDuration`](#upgradeduration) | string | No |
| [`CurrentUpgradeDomainDuration`](#currentupgradedomainduration) | string | No |
| [`ApplicationUnhealthyEvaluations`](#applicationunhealthyevaluations) | array of [HealthEvaluationWrapper](sfclient-model-healthevaluationwrapper.md) | No |
| [`CurrentUpgradeDomainProgress`](#currentupgradedomainprogress) | [CurrentUpgradeDomainProgressInfo](sfclient-model-currentupgradedomainprogressinfo.md) | No |
| [`StartTimestampUtc`](#starttimestamputc) | string | No |
| [`FailureTimestampUtc`](#failuretimestamputc) | string | No |
| [`FailureReason`](#failurereason) | string (enum) | No |
| [`UpgradeDomainProgressAtFailure`](#upgradedomainprogressatfailure) | [FailureUpgradeDomainProgressInfo](sfclient-model-failureupgradedomainprogressinfo.md) | No |
| [`ApplicationUpgradeStatusDetails`](#applicationupgradestatusdetails) | string | No |

____
### `DeploymentName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the target deployment.

____
### `ApplicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the target application, including the 'fabric:' URI scheme.

____
### `UpgradeState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The state of the compose deployment upgrade.


Possible values are: 

  - `Invalid` - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `ProvisioningTarget` - The upgrade is in the progress of provisioning target application type version. The value is 1.
  - `RollingForwardInProgress` - The upgrade is rolling forward to the target version but is not complete yet. The value is 2.
  - `RollingForwardPending` - The current upgrade domain has finished upgrading. The overall upgrade is waiting for an explicit move next request in UnmonitoredManual mode or performing health checks in Monitored mode. The value is 3
  - `UnprovisioningCurrent` - The upgrade is in the progress of unprovisioning current application type version and rolling forward to the target version is completed. The value is 4.
  - `RollingForwardCompleted` - The upgrade has finished rolling forward. The value is 5.
  - `RollingBackInProgress` - The upgrade is rolling back to the previous version but is not complete yet. The value is 6.
  - `UnprovisioningTarget` - The upgrade is in the progress of unprovisioning target application type version and rolling back to the current version is completed. The value is 7.
  - `RollingBackCompleted` - The upgrade has finished rolling back. The value is 8.
  - `Failed` - The upgrade has failed and is unable to execute FailureAction. The value is 9.



____
### `UpgradeStatusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Additional detailed information about the status of the pending upgrade.

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


The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.

Possible values are: 

  - `Invalid` - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `UnmonitoredAuto` - The upgrade will proceed automatically without performing any health monitoring. The value is 1
  - `UnmonitoredManual` - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
  - `Monitored` - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3



____
### `ForceRestart`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### `UpgradeReplicaSetCheckTimeoutInSeconds`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### `MonitoringPolicy`
__Type__: [MonitoringPolicyDescription](sfclient-model-monitoringpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the parameters for monitoring an upgrade in Monitored mode.

____
### `ApplicationHealthPolicy`
__Type__: [ApplicationHealthPolicy](sfclient-model-applicationhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of an application or one of its children entities.


____
### `TargetApplicationTypeVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The target application type version (found in the application manifest) for the application upgrade.

____
### `UpgradeDuration`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated amount of time that the overall upgrade elapsed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### `CurrentUpgradeDomainDuration`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated amount of time spent processing current Upgrade Domain. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### `ApplicationUnhealthyEvaluations`
__Type__: array of [HealthEvaluationWrapper](sfclient-model-healthevaluationwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of health evaluations that resulted in the current aggregated health state.

____
### `CurrentUpgradeDomainProgress`
__Type__: [CurrentUpgradeDomainProgressInfo](sfclient-model-currentupgradedomainprogressinfo.md) <br/>
__Required__: No<br/>
<br/>
Information about the current in-progress upgrade domain.

____
### `StartTimestampUtc`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated UTC datetime when the upgrade started.

____
### `FailureTimestampUtc`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated UTC datetime when the upgrade failed and FailureAction was executed.

____
### `FailureReason`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The cause of an upgrade failure that resulted in FailureAction being executed.

Possible values are: 

  - `None` - Indicates the reason is invalid or unknown. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Interrupted` - There was an external request to roll back the upgrade. The value is 1
  - `HealthCheck` - The upgrade failed due to health policy violations. The value is 2
  - `UpgradeDomainTimeout` - An upgrade domain took longer than the allowed upgrade domain timeout to process. The value is 3
  - `OverallUpgradeTimeout` - The overall upgrade took longer than the allowed upgrade timeout to process. The value is 4



____
### `UpgradeDomainProgressAtFailure`
__Type__: [FailureUpgradeDomainProgressInfo](sfclient-model-failureupgradedomainprogressinfo.md) <br/>
__Required__: No<br/>
<br/>
Information about the upgrade domain progress at the time of upgrade failure.

____
### `ApplicationUpgradeStatusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Additional details of application upgrade including failure message.
