---
title: "ApplicationUpgradePolicy"
ms.date: "2017-09-28"
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
# ApplicationUpgradePolicy

The application upgrade policy.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [upgradeReplicaSetCheckTimeout](#upgradereplicasetchecktimeout) | integer (int64) | No |
| [forceRestart](#forcerestart) | boolean | No |
| [rollingUpgradeMonitoringPolicy](#rollingupgrademonitoringpolicy) | [RollingUpgradeMonitoringPolicy](sfrp-2017-07-01-preview-model-rollingupgrademonitoringpolicy.md) | No |
| [applicationHealthPolicy](#applicationhealthpolicy) | [ApplicationHealthPolicy](sfrp-2017-07-01-preview-model-applicationhealthpolicy.md) | No |

____
### upgradeReplicaSetCheckTimeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and prevent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. Valid values are between 0 and 42949672925 inclusive. (unsigned 32-bit integer).

____
### forceRestart
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### rollingUpgradeMonitoringPolicy
__Type__: [RollingUpgradeMonitoringPolicy](sfrp-2017-07-01-preview-model-rollingupgrademonitoringpolicy.md) <br/>
__Required__: No<br/>
<br/>
The policy used for monitoring the application upgrade

____
### applicationHealthPolicy
__Type__: [ApplicationHealthPolicy](sfrp-2017-07-01-preview-model-applicationhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of an application or one of its children entities.

