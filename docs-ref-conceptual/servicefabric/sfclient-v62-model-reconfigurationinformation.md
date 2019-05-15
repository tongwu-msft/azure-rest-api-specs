---
title: "ReconfigurationInformation"
ms.date: "2018-04-23"
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
# ReconfigurationInformation

Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PreviousConfigurationRole`](#previousconfigurationrole) | string (enum) | No |
| [`ReconfigurationPhase`](#reconfigurationphase) | string (enum) | No |
| [`ReconfigurationType`](#reconfigurationtype) | string (enum) | No |
| [`ReconfigurationStartTimeUtc`](#reconfigurationstarttimeutc) | string (date-time) | No |

____
### `PreviousConfigurationRole`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Replica role before reconfiguration started.

The role of a replica of a stateful service.

Possible values are: 

  - `Unknown` - Indicates the initial role that a replica is created in. The value is zero.
  - `None` - Specifies that the replica has no responsibility in regard to the replica set. The value is 1
  - `Primary` - Refers to the replica in the set on which all read and write operations are complete in order to enforce strong consistency semantics. Read operations are handled directly by the Primary replica, while write operations must be acknowledged by a quorum of the replicas in the replica set. There can only be one Primary replica in a replica set at a time. The value is 2.
  - `IdleSecondary` - Refers to a replica in the set that receives a state transfer from the Primary replica to prepare for becoming an active Secondary replica. There can be multiple Idle Secondary replicas in a replica set at a time. Idle Secondary replicas do not count as a part of a write quorum. The value is 3.
  - `ActiveSecondary` - Refers to a replica in the set that receives state updates from the Primary replica, applies them, and sends acknowledgements back. Secondary replicas must participate in the write quorum for a replica set. There can be multiple active Secondary replicas in a replica set at a time. The number of active Secondary replicas is configurable that the reliability subsystem should maintain. The value is 4.



____
### `ReconfigurationPhase`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Current phase of ongoing reconfiguration. If no reconfiguration is taking place then this value will be "None".

The reconfiguration phase of a replica of a stateful service.

Possible values are: 

  - `Unknown` - Indicates the invalid reconfiguration phase.
  - `None` - Specifies that there is no reconfiguration in progress.
  - `Phase0` - Refers to the phase where the reconfiguration is transferring data from the previous primary to the new primary.
  - `Phase1` - Refers to the phase where the reconfiguration is querying the replica set for the progress.
  - `Phase2` - Refers to the phase where the reconfiguration is ensuring that data from the current primary is present in a majority of the replica set.
  - `Phase3` - This phase is for internal use only.
  - `Phase4` - This phase is for internal use only.
  - `AbortPhaseZero` - This phase is for internal use only.



____
### `ReconfigurationType`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Type of current ongoing reconfiguration. If no reconfiguration is taking place then this value will be "None".

The type of reconfiguration for replica of a stateful service.

Possible values are: 

  - `Unknown` - Indicates the invalid reconfiguration type.
  - `SwapPrimary` - Specifies that the primary replica is being swapped with a different replica.
  - `Failover` - Reconfiguration triggered in response to a primary going down. This could be due to many reasons such as primary replica crashing etc.
  - `Other` - Reconfigurations where the primary replica is not changing.



____
### `ReconfigurationStartTimeUtc`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Start time (in UTC) of the ongoing reconfiguration. If no reconfiguration is taking place then this value will be zero date-time.
