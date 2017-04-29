---
title: "MonitoringPolicyDescription"
ms.date: "2017-04-29"
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
# MonitoringPolicyDescription

Describes the parameters for monitoring an upgrade in Monitored mode.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [FailureAction](#failureaction) | string (enum) | No |
| [HealthCheckWaitDurationInMilliseconds](#healthcheckwaitdurationinmilliseconds) | string | No |
| [HealthCheckStableDurationInMilliseconds](#healthcheckstabledurationinmilliseconds) | string | No |
| [HealthCheckRetryTimeoutInMilliseconds](#healthcheckretrytimeoutinmilliseconds) | string | No |
| [UpgradeTimeoutInMilliseconds](#upgradetimeoutinmilliseconds) | string | No |
| [UpgradeDomainTimeoutInMilliseconds](#upgradedomaintimeoutinmilliseconds) | string | No |

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
