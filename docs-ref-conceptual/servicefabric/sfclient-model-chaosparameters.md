---
title: "ChaosParameters"
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
# ChaosParameters

Defines all the parameters to configure a Chaos run.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [TimeToRunInSeconds](#timetoruninseconds) | string | No |
| [MaxClusterStabilizationTimeoutInSeconds](#maxclusterstabilizationtimeoutinseconds) | integer (int64) | No |
| [MaxConcurrentFaults](#maxconcurrentfaults) | integer (int64) | No |
| [EnableMoveReplicaFaults](#enablemovereplicafaults) | boolean | No |
| [WaitTimeBetweenFaultsInSeconds](#waittimebetweenfaultsinseconds) | integer (int64) | No |
| [WaitTimeBetweenIterationsInSeconds](#waittimebetweeniterationsinseconds) | integer (int64) | No |
| [ClusterHealthPolicy](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | No |
| [Context](#context) | [ChaosContext](sfclient-model-chaoscontext.md) | No |

____
### TimeToRunInSeconds
__Type__: string <br/>
__Required__: No<br/>
__Default__: 4294967295 <br/>
<br/>
Total time (in seconds) for which Chaos will run before automatically stopping. The maximum allowed value is 4,294,967,295 (System.UInt32.MaxValue). 
Depending on other time settings, the actual running time of Chaos can be larger than the TimeToRunInSeconds. 
To be conservative, we should expect Chaos to automatically stop after 
(MaxClusterStabilizationTimeoutInSeconds + MaxConcurrentFaults * WaitTimeBetweenFaultsInSeconds + WaitTimeBetweenIterationsInSeconds) seconds.


____
### MaxClusterStabilizationTimeoutInSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum amount of time to wait for all cluster entities to become stable and healthy. Chaos executes in iterations and at the start of each iteration it validates the health of cluster entities. 
During validation if a cluster entity is not stable and healthy within MaxClusterStabilizationTimeoutInSeconds, Chaos generates a validation failed event.


____
### MaxConcurrentFaults
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 1 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
MaxConcurrentFaults is the maximum number of concurrent faults induced per iteration.
Chaos executes in iterations and two consecutive iterations are separated by a validation phase.
The higher the concurrency, the more aggressive the injection of faults -- inducing more complex series of states to uncover bugs.
The recommendation is to start with a value of 2 or 3 and to exercise caution while moving up.


____
### EnableMoveReplicaFaults
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: true <br/>
<br/>
Enables or disables the move primary and move secondary faults.


____
### WaitTimeBetweenFaultsInSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 20 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
Wait time (in seconds) between consecutive faults within a single iteration.
The larger the value, the lower the overlapping between faults and the simpler the sequence of state transitions that the cluster goes through.
The recommendation is to start with a value between 1 and 5 and exercise caution while moving up.


____
### WaitTimeBetweenIterationsInSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 30 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
Time-separation (in seconds) between two consecutive iterations of Chaos.
The larger the value, the lower the fault injection rate.


____
### ClusterHealthPolicy
__Type__: [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Passed-in cluster health policy is used to validate health of the cluster in between Chaos iterations. If the cluster health is in error or if an unexpected exception happens during fault execution--to provide the cluster with some time to recuperate--Chaos will wait for 30 minutes before the next health-check.


____
### Context
__Type__: [ChaosContext](sfclient-model-chaoscontext.md) <br/>
__Required__: No<br/>
<br/>
Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about
the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long. 
This map is set by the starter of the Chaos run to optionally store the context about the specific run. 

