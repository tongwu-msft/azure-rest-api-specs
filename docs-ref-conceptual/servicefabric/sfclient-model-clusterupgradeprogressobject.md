---
title: "ClusterUpgradeProgressObject"
ms.date: "2017-05-04"
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
# ClusterUpgradeProgressObject

Information about a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [CodeVersion](#codeversion) | string | No |
| [ConfigVersion](#configversion) | string | No |
| [UpgradeDomains](#upgradedomains) | array of [UpgradeDomainInfo](sfclient-model-upgradedomaininfo.md) | No |
| [UpgradeState](#upgradestate) | string (enum) | No |
| [NextUpgradeDomain](#nextupgradedomain) | string | No |
| [RollingUpgradeMode](#rollingupgrademode) | string (enum) | No |
| [UpgradeDescription](#upgradedescription) | [ClusterUpgradeDescriptionObject](sfclient-model-clusterupgradedescriptionobject.md) | No |
| [UpgradeDurationInMilliseconds](#upgradedurationinmilliseconds) | string | No |
| [UpgradeDomainDurationInMilliseconds](#upgradedomaindurationinmilliseconds) | string | No |
| [UnhealthyEvaluations](#unhealthyevaluations) | array of [HealthEvaluationWrapper](sfclient-model-healthevaluationwrapper.md) | No |
| [CurrentUpgradeDomainProgress](#currentupgradedomainprogress) | [CurrentUpgradeDomainProgressInfo](sfclient-model-currentupgradedomainprogressinfo.md) | No |
| [StartTimestampUtc](#starttimestamputc) | string | No |
| [FailureTimestampUtc](#failuretimestamputc) | string | No |
| [FailureReason](#failurereason) | string (enum) | No |
| [UpgradeDomainProgressAtFailure](#upgradedomainprogressatfailure) | [FailedUpgradeDomainProgressObject](sfclient-model-failedupgradedomainprogressobject.md) | No |

____
### CodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ServiceFabric code version of the cluster.

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The cluster configuration version (specified in the cluster manifest).

____
### UpgradeDomains
__Type__: array of [UpgradeDomainInfo](sfclient-model-upgradedomaininfo.md) <br/>
__Required__: No<br/>
<br/>
List of upgrade domains and their statuses.

____
### UpgradeState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The state of the upgrade domain.

    - Invalid - Indicates the upgrade state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - RollingBackInProgress - The upgrade is rolling back to the previous version but is not complete yet. The value is 1
    - RollingBackCompleted - The upgrade has finished rolling back. The value is 2
    - RollingForwardPending - The current upgrade domain has finished upgrading. The overall upgrade is waiting for an explicit move next request in UnmonitoredManual mode or performing health checks in Monitored mode. The value is 3
    - RollingForwardInProgress - The upgrade is rolling forward to the target version but is not complete yet. The value is 4
    - RollingForwardCompleted - The upgrade has finished rolling forward. The value is 5
    - Failed - The upgrade has failed and is unable to execute FailureAction. The value is 6


____
### NextUpgradeDomain
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the next upgrade domain to be processed.

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
### UpgradeDescription
__Type__: [ClusterUpgradeDescriptionObject](sfclient-model-clusterupgradedescriptionobject.md) <br/>
__Required__: No<br/>
<br/>
Represents a ServiceFabric cluster upgrade

____
### UpgradeDurationInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated elapsed time spent processing the current overall upgrade.

____
### UpgradeDomainDurationInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The estimated elapsed time spent processing the current upgrade domain.

____
### UnhealthyEvaluations
__Type__: array of [HealthEvaluationWrapper](sfclient-model-healthevaluationwrapper.md) <br/>
__Required__: No<br/>
<br/>
List of health evaluations that resulted in the current aggregated health state.

____
### CurrentUpgradeDomainProgress
__Type__: [CurrentUpgradeDomainProgressInfo](sfclient-model-currentupgradedomainprogressinfo.md) <br/>
__Required__: No<br/>
<br/>
Information about the current in-progress upgrade domain.

____
### StartTimestampUtc
__Type__: string <br/>
__Required__: No<br/>
<br/>
The start time of the upgrade in UTC.

____
### FailureTimestampUtc
__Type__: string <br/>
__Required__: No<br/>
<br/>
The failure time of the upgrade in UTC.

____
### FailureReason
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The cause of an upgrade failure that resulted in FailureAction being executed.

    - None - Indicates the reason is invalid or unknown. All Service Fabric enumerations have the invalid type. The value is zero.
    - Interrupted - There was an external request to rollback the upgrade. The value is 1
    - HealthCheck - The upgrade failed due to health policy violations. The value is 2
    - UpgradeDomainTimeout - An upgrade domain took longer than the allowed upgrade domain timeout to process. The value is 3
    - UpgradeTimeout - The overall upgrade took longer than the allowed upgrade timeout to process. The value is 4


____
### UpgradeDomainProgressAtFailure
__Type__: [FailedUpgradeDomainProgressObject](sfclient-model-failedupgradedomainprogressobject.md) <br/>
__Required__: No<br/>
<br/>
The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.
