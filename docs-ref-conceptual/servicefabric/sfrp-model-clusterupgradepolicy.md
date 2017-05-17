---
title: "ClusterUpgradePolicy"
ms.date: "2017-05-16"
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
# ClusterUpgradePolicy

Describes the policy used when upgrading the cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [forceRestart](#forcerestart) | boolean | No |
| [upgradeReplicaSetCheckTimeout](#upgradereplicasetchecktimeout) | string | Yes |
| [healthCheckWaitDuration](#healthcheckwaitduration) | string | Yes |
| [healthCheckStableDuration](#healthcheckstableduration) | string | Yes |
| [healthCheckRetryTimeout](#healthcheckretrytimeout) | string | Yes |
| [upgradeTimeout](#upgradetimeout) | string | Yes |
| [upgradeDomainTimeout](#upgradedomaintimeout) | string | Yes |
| [healthPolicy](#healthpolicy) | [ClusterHealthPolicy](sfrp-model-clusterhealthpolicy.md) | Yes |
| [deltaHealthPolicy](#deltahealthpolicy) | [ClusterUpgradeDeltaHealthPolicy](sfrp-model-clusterupgradedeltahealthpolicy.md) | No |

____
### forceRestart
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
If true, then processes are forcefully restarted during upgrade even when the code version has not changed (the upgrade only changes configuration or data).

____
### upgradeReplicaSetCheckTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The maximum amount of time to block processing of an upgrade domain and revent loss of availability when there are unexpected issues. When this timeout expires, processing of the upgrade domain will proceed regardless of availability loss issues. The timeout is reset at the start of each upgrade domain. The timeout can be in either hh:mm:ss or in d.hh:mm:ss.ms format.

____
### healthCheckWaitDuration
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The length of time to wait after completing an upgrade domain before performing health checks. The duration can be in either hh:mm:ss or in d.hh:mm:ss.ms format.

____
### healthCheckStableDuration
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The amount of time that the application or cluster must remain healthy before the upgrade proceeds to the next upgrade domain. The duration can be in either hh:mm:ss or in d.hh:mm:ss.ms format.

____
### healthCheckRetryTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The amount of time to retry health evaluation when the application or cluster is unhealthy before the upgrade rolls back. The timeout can be in either hh:mm:ss or in d.hh:mm:ss.ms format.

____
### upgradeTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The amount of time the overall upgrade has to complete before the upgrade rolls back. The timeout can be in either hh:mm:ss or in d.hh:mm:ss.ms format.

____
### upgradeDomainTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The amount of time each upgrade domain has to complete before the upgrade rolls back. The timeout can be in either hh:mm:ss or in d.hh:mm:ss.ms format.

____
### healthPolicy
__Type__: [ClusterHealthPolicy](sfrp-model-clusterhealthpolicy.md) <br/>
__Required__: Yes<br/>
<br/>
The cluster health policy used when upgrading the cluster.

____
### deltaHealthPolicy
__Type__: [ClusterUpgradeDeltaHealthPolicy](sfrp-model-clusterupgradedeltahealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
The delta health policy used when upgrading the cluster.
