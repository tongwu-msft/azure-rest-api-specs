---
title: "ClusterUpgradePolicy"
ms.date: "2017-04-28"
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

Cluster upgrade policy

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [overrideUserUpgradePolicy](#overrideuserupgradepolicy) | boolean | No |
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
### overrideUserUpgradePolicy
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Use the user defined upgrade policy or not

____
### forceRestart
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Force node to restart or not

____
### upgradeReplicaSetCheckTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Timeout for replica set upgrade to complete,it represents .Net TimeSpan

____
### healthCheckWaitDuration
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The length of time to wait after completing an upgrade domain before performing health checks, it represents .Net TimeSpan

____
### healthCheckStableDuration
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The length of time that health checks must pass continuously,it represents .Net TimeSpan

____
### healthCheckRetryTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The length of time that health checks can fail continuously,it represents .Net TimeSpan

____
### upgradeTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The upgrade timeout,it represents .Net TimeSpan

____
### upgradeDomainTimeout
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The timeout for any upgrade domain,it represents .Net TimeSpan

____
### healthPolicy
__Type__: [ClusterHealthPolicy](sfrp-model-clusterhealthpolicy.md) <br/>
__Required__: Yes<br/>
<br/>
Cluster health Policy

____
### deltaHealthPolicy
__Type__: [ClusterUpgradeDeltaHealthPolicy](sfrp-model-clusterupgradedeltahealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Delta health policy
