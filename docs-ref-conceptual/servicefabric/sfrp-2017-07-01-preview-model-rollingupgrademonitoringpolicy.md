---
title: "RollingUpgradeMonitoringPolicy"
ms.date: "2018-01-22"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# RollingUpgradeMonitoringPolicy

The policy used for monitoring the application upgrade

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [healthCheckWaitDuration](#healthcheckwaitduration) | string | No |
| [healthCheckStableDuration](#healthcheckstableduration) | string | No |
| [healthCheckRetryTimeout](#healthcheckretrytimeout) | string | No |
| [upgradeTimeout](#upgradetimeout) | string | No |
| [upgradeDomainTimeout](#upgradedomaintimeout) | string | No |

____
### healthCheckWaitDuration
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time to wait after completing an upgrade domain before applying health policies. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### healthCheckStableDuration
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time that the application or cluster must remain healthy before the upgrade proceeds to the next upgrade domain. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### healthCheckRetryTimeout
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time to retry health evaluation when the application or cluster is unhealthy before FailureAction is executed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### upgradeTimeout
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time the overall upgrade has to complete before FailureAction is executed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.

____
### upgradeDomainTimeout
__Type__: string <br/>
__Required__: No<br/>
<br/>
The amount of time each upgrade domain has to complete before FailureAction is executed. It is first interpreted as a string representing an ISO 8601 duration. If that fails, then it is interpreted as a number representing the total number of milliseconds.
