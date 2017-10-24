---
title: "StatefulServiceDescription"
ms.date: "2017-10-02"
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
# StatefulServiceDescription

Describes a stateful service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceKind](#servicekind) | string | Yes |
| [ApplicationName](#applicationname) | string | No |
| [ServiceName](#servicename) | string | Yes |
| [ServiceTypeName](#servicetypename) | string | Yes |
| [InitializationData](#initializationdata) | array of integer | No |
| [PartitionDescription](#partitiondescription) | [PartitionSchemeDescription](sfclient-model-partitionschemedescription.md) | Yes |
| [PlacementConstraints](#placementconstraints) | string | No |
| [CorrelationScheme](#correlationscheme) | array of [ServiceCorrelationDescription](sfclient-model-servicecorrelationdescription.md) | No |
| [ServiceLoadMetrics](#serviceloadmetrics) | array of [ServiceLoadMetricDescription](sfclient-model-serviceloadmetricdescription.md) | No |
| [ServicePlacementPolicies](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](sfclient-model-serviceplacementpolicydescription.md) | No |
| [DefaultMoveCost](#defaultmovecost) | string (enum) | No |
| [IsDefaultMoveCostSpecified](#isdefaultmovecostspecified) | boolean | No |
| [ServicePackageActivationMode](#servicepackageactivationmode) | string (enum) | No |
| [ServiceDnsName](#servicednsname) | string | No |
| [TargetReplicaSetSize](#targetreplicasetsize) | integer | Yes |
| [MinReplicaSetSize](#minreplicasetsize) | integer | Yes |
| [HasPersistedState](#haspersistedstate) | boolean | Yes |
| [Flags](#flags) | integer | No |
| [ReplicaRestartWaitDurationSeconds](#replicarestartwaitdurationseconds) | integer (int64) | No |
| [QuorumLossWaitDurationSeconds](#quorumlosswaitdurationseconds) | integer (int64) | No |
| [StandByReplicaKeepDurationSeconds](#standbyreplicakeepdurationseconds) | integer (int64) | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateful' for objects of type 'StatefulServiceDescription'.

____
### ApplicationName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### ServiceName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.

____
### ServiceTypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the service type as specified in the service manifest.

____
### InitializationData
__Type__: array of integer <br/>
__Required__: No<br/>
<br/>
The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.

____
### PartitionDescription
__Type__: [PartitionSchemeDescription](sfclient-model-partitionschemedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The partition description as an object.

____
### PlacementConstraints
__Type__: string <br/>
__Required__: No<br/>
<br/>
The placement constraints as a string. Placement constraints are boolean expressions on node properties and allow for restricting a service to particular nodes based on the service requirements. For example, to place a service on nodes where NodeType is blue specify the following: "NodeColor == blue)".

____
### CorrelationScheme
__Type__: array of [ServiceCorrelationDescription](sfclient-model-servicecorrelationdescription.md) <br/>
__Required__: No<br/>
<br/>
The correlation scheme.

____
### ServiceLoadMetrics
__Type__: array of [ServiceLoadMetricDescription](sfclient-model-serviceloadmetricdescription.md) <br/>
__Required__: No<br/>
<br/>
The service load metrics.

____
### ServicePlacementPolicies
__Type__: array of [ServicePlacementPolicyDescription](sfclient-model-serviceplacementpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
The service placement policies.

____
### DefaultMoveCost
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The move cost for the service.

The move cost for the service.


____
### IsDefaultMoveCostSpecified
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates if the DefaultMoveCost property is specified.

____
### ServicePackageActivationMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The activation mode of service package to be used for a service.

The activation mode of service package to be used for a service.


____
### ServiceDnsName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The DNS name of the service. It requires the DNS system service to be enabled in Service Fabric cluster.

____
### TargetReplicaSetSize
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The target replica set size as a number.

____
### MinReplicaSetSize
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The minimum replica set size as a number.

____
### HasPersistedState
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
A flag indicating whether this is a persistent service which stores states on the local disk. If it is then the value of this property is true, if not it is false.

____
### Flags
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Flags indicating whether other properties are set. Each of the associated properties corresponds to a flag, specified below, which, if set, indicate that the property is specified.
This property can be a combination of those flags obtained using bitwise 'OR' operator.
For example, if the provided value is 6 then the flags for QuorumLossWaitDuration (2) and StandByReplicaKeepDuration(4) are set.

- None - Does not indicate any other properties are set. The value is zero.
- ReplicaRestartWaitDuration - Indicates the ReplicaRestartWaitDuration property is set. The value is 1.
- QuorumLossWaitDuration - Indicates the QuorumLossWaitDuration property is set. The value is 2.
- StandByReplicaKeepDuration - Indicates the StandByReplicaKeepDuration property is set. The value is 4.


____
### ReplicaRestartWaitDurationSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The duration, in seconds, between when a replica goes down and when a new replica is created.

____
### QuorumLossWaitDurationSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum duration, in seconds, for which a partition is allowed to be in a state of quorum loss.

____
### StandByReplicaKeepDurationSeconds
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The definition on how long StandBy replicas should be maintained before being removed.
