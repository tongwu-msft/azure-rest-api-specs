---
title: "StatelessServiceUpdateDescription"
ms.date: "2017-05-08"
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
# StatelessServiceUpdateDescription

Describes an update for a stateless service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceKind](#servicekind) | string | Yes |
| [Flags](#flags) | string | No |
| [PlacementConstraints](#placementconstraints) | string | No |
| [CorrelationScheme](#correlationscheme) | array of [ServiceCorrelationDescription](sfclient-model-servicecorrelationdescription.md) | No |
| [LoadMetrics](#loadmetrics) | array of [ServiceLoadMetricDescription](sfclient-model-serviceloadmetricdescription.md) | No |
| [ServicePlacementPolicies](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](sfclient-model-serviceplacementpolicydescription.md) | No |
| [DefaultMoveCost](#defaultmovecost) | string (enum) | No |
| [InstanceCount](#instancecount) | integer | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'StatelessServiceUpdateDescription'.

____
### Flags
__Type__: string <br/>
__Required__: No<br/>
<br/>
Flags indicating whether other properties are set. Each of the associated properties corresponds to a flag, specified below, which, if set, indicate that the property is specified.
This property can be a combination of those flags obtained using bitwise 'OR' operator.
For example, if the provided value is 6 then the flags for ReplicaRestartWaitDuration (2) and QuorumLossWaitDuration (4) are set.

- None - Does not indicate any other properties are set. The value is zero. 
- TargetReplicaSetSize/InstanceCount - Indicates whether the TargetReplicaSetSize property (for Stateful services) or the InstanceCount property (for Stateless services) is set. The value is 1.
- ReplicaRestartWaitDuration - Indicates the ReplicaRestartWaitDuration property is set. The value is  2.
- QuorumLossWaitDuration - Indicates the QuorumLossWaitDuration property is set. The value is 4.
- StandByReplicaKeepDuration - Indicates the StandByReplicaKeepDuration property is set. The value is 8.
- MinReplicaSetSize - Indicates the MinReplicaSetSize property is set. The value is 16.
- PlacementConstraints - Indicates the PlacementConstraints property is set. The value is 32.
- PlacementPolicyList - Indicates the ServicePlacementPolicies property is set. The value is 64.
- Correlation - Indicates the CorrelationScheme property is set. The value is 128.
- Metrics - Indicates the ServiceLoadMetrics property is set. The value is 256.
- DefaultMoveCost - Indicates the DefaultMoveCost property is set. The value is 512.


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
### LoadMetrics
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

Specifies the move cost for the service. Possible values are the following.

  - Zero - Zero move cost. This value is zero.
  - Low - Specifies the move cost of the service as Low. The value is 1.
  - Medium - Specifies the move cost of the service as Medium. The value is 2.
  - High - Specifies the move cost of the service as High. The value is 3.



____
### InstanceCount
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMinimum__: -1 <br/>
<br/>
The instance count.
