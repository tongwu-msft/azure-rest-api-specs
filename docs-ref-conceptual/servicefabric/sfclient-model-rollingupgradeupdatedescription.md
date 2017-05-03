---
title: "RollingUpgradeUpdateDescription"
ms.date: "2017-05-03"
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
# RollingUpgradeUpdateDescription

Describes the parameters for updating a rolling upgrade of application or cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [RollingUpgradeMode](#rollingupgrademode) | string (enum) | Yes |
| [ForceRestart](#forcerestart) | boolean | No |
| [ReplicaSetCheckTimeoutInMilliseconds](#replicasetchecktimeoutinmilliseconds) | integer (int64) | No |
| [FailureAction](#failureaction) | string (enum) | No |
| [HealthCheckWaitDurationInMilliseconds](#healthcheckwaitdurationinmilliseconds) | string | No |
| [HealthCheckStableDurationInMilliseconds](#healthcheckstabledurationinmilliseconds) | string | No |
| [HealthCheckRetryTimeoutInMilliseconds](#healthcheckretrytimeoutinmilliseconds) | string | No |
| [UpgradeTimeoutInMilliseconds](#upgradetimeoutinmilliseconds) | string | No |
| [UpgradeDomainTimeoutInMilliseconds](#upgradedomaintimeoutinmilliseconds) | string | No |

____
### RollingUpgradeMode
__Type__: string (enum) <br/>
__Required__: Yes<br/>
__Default__: UnmonitoredAuto <br/>
<br/>
The mode used to monitor health during a rolling upgrade.

    - Invalid - Indicates the upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - UnmonitoredAuto - The upgrade will proceed automatically without performing any health monitoring. The value is 1
    - UnmonitoredManual - The upgrade will stop after completing each upgrade domain, giving the opportunity to manually monitor health before proceeding. The value is 2
    - Monitored - The upgrade will stop after completing each upgrade domain and automatically monitor health before proceeding. The value is 3


____
### ForceRestart
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### ReplicaSetCheckTimeoutInMilliseconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### FailureAction
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.

    - Invalid - Indicates the failure action is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
    - Rollback - The upgrade will start rolling back automatically. The value is 1
    - Manual - The upgrade will switch to UnmonitoredManual upgrade mode. The value is 2


____
### HealthCheckWaitDurationInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time to wait after completing an upgrade domain before applying health policies. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### HealthCheckStableDurationInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time that the application or cluster must remain healthy before the upgrade proceeds to the next upgrade domain. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### HealthCheckRetryTimeoutInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time to retry health evaluation when the application or cluster is unhealthy before FailureAction is executed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### UpgradeTimeoutInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time the overall upgrade has to complete before FailureAction is executed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### UpgradeDomainTimeoutInMilliseconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time each upgrade domain has to complete before FailureAction is executed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.
