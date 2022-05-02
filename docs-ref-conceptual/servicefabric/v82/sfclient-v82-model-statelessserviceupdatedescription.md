---
title: "StatelessServiceUpdateDescription v82"
description: "StatelessServiceUpdateDescription v82"
ms.date: "04/02/2021"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# StatelessServiceUpdateDescription v82

Describes an update for a stateless service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Flags`](#flags) | string | No |
| [`PlacementConstraints`](#placementconstraints) | string | No |
| [`CorrelationScheme`](#correlationscheme) | array of [ServiceCorrelationDescription](sfclient-v82-model-servicecorrelationdescription.md) | No |
| [`LoadMetrics`](#loadmetrics) | array of [ServiceLoadMetricDescription](sfclient-v82-model-serviceloadmetricdescription.md) | No |
| [`ServicePlacementPolicies`](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](sfclient-v82-model-serviceplacementpolicydescription.md) | No |
| [`DefaultMoveCost`](#defaultmovecost) | string (enum) | No |
| [`ScalingPolicies`](#scalingpolicies) | array of [ScalingPolicyDescription](sfclient-v82-model-scalingpolicydescription.md) | No |
| [`ServiceDnsName`](#servicednsname) | string | No |
| [`TagsForPlacement`](#tagsforplacement) | [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) | No |
| [`TagsForRunning`](#tagsforrunning) | [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) | No |
| [`InstanceCount`](#instancecount) | integer | No |
| [`MinInstanceCount`](#mininstancecount) | integer | No |
| [`MinInstancePercentage`](#mininstancepercentage) | integer | No |
| [`InstanceCloseDelayDurationSeconds`](#instanceclosedelaydurationseconds) | string | No |
| [`InstanceLifecycleDescription`](#instancelifecycledescription) | [InstanceLifecycleDescription](sfclient-v82-model-instancelifecycledescription.md) | No |
| [`InstanceRestartWaitDurationSeconds`](#instancerestartwaitdurationseconds) | string | No |

____
### `Flags`
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
- ScalingPolicy - Indicates the ScalingPolicies property is set. The value is 1024.
- ServicePlacementTimeLimit - Indicates the ServicePlacementTimeLimit property is set. The value is 2048.
- MinInstanceCount - Indicates the MinInstanceCount property is set. The value is 4096.
- MinInstancePercentage - Indicates the MinInstancePercentage property is set. The value is 8192.
- InstanceCloseDelayDuration - Indicates the InstanceCloseDelayDuration property is set. The value is 16384.
- InstanceRestartWaitDuration - Indicates the InstanceCloseDelayDuration property is set. The value is 32768.
- DropSourceReplicaOnMove - Indicates the DropSourceReplicaOnMove property is set. The value is 65536.
- ServiceDnsName - Indicates the ServiceDnsName property is set. The value is 131072.
- TagsForPlacement - Indicates the TagsForPlacement property is set. The value is 1048576.
- TagsForRunning - Indicates the TagsForRunning property is set. The value is 2097152.


____
### `PlacementConstraints`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The placement constraints as a string. Placement constraints are boolean expressions on node properties and allow for restricting a service to particular nodes based on the service requirements. For example, to place a service on nodes where NodeType is blue specify the following: "NodeColor == blue)".

____
### `CorrelationScheme`
__Type__: array of [ServiceCorrelationDescription](sfclient-v82-model-servicecorrelationdescription.md) <br/>
__Required__: No<br/>
<br/>
The correlation scheme.

____
### `LoadMetrics`
__Type__: array of [ServiceLoadMetricDescription](sfclient-v82-model-serviceloadmetricdescription.md) <br/>
__Required__: No<br/>
<br/>
The service load metrics.

____
### `ServicePlacementPolicies`
__Type__: array of [ServicePlacementPolicyDescription](sfclient-v82-model-serviceplacementpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
The service placement policies.

____
### `DefaultMoveCost`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The move cost for the service.

Specifies the move cost for the service.

Possible values are: 

  - `Zero` - Zero move cost. This value is zero.
  - `Low` - Specifies the move cost of the service as Low. The value is 1.
  - `Medium` - Specifies the move cost of the service as Medium. The value is 2.
  - `High` - Specifies the move cost of the service as High. The value is 3.
  - `VeryHigh` - Specifies the move cost of the service as VeryHigh. The value is 4.



____
### `ScalingPolicies`
__Type__: array of [ScalingPolicyDescription](sfclient-v82-model-scalingpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
Scaling policies for this service.

____
### `ServiceDnsName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The DNS name of the service.

____
### `TagsForPlacement`
__Type__: [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) <br/>
__Required__: No<br/>
<br/>
Tags for placement of this service.

____
### `TagsForRunning`
__Type__: [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) <br/>
__Required__: No<br/>
<br/>
Tags for running of this service.

____
### `InstanceCount`
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMinimum__: `-1` <br/>
<br/>
The instance count.

____
### `MinInstanceCount`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
MinInstanceCount is the minimum number of instances that must be up to meet the EnsureAvailability safety check during operations like upgrade or deactivate node.
The actual number that is used is max( MinInstanceCount, ceil( MinInstancePercentage/100.0 * InstanceCount) ).
Note, if InstanceCount is set to -1, during MinInstanceCount computation -1 is first converted into the number of nodes on which the instances are allowed to be placed according to the placement constraints on the service.


____
### `MinInstancePercentage`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
MinInstancePercentage is the minimum percentage of InstanceCount that must be up to meet the EnsureAvailability safety check during operations like upgrade or deactivate node.
The actual number that is used is max( MinInstanceCount, ceil( MinInstancePercentage/100.0 * InstanceCount) ).
Note, if InstanceCount is set to -1, during MinInstancePercentage computation, -1 is first converted into the number of nodes on which the instances are allowed to be placed according to the placement constraints on the service.


____
### `InstanceCloseDelayDurationSeconds`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Duration in seconds, to wait before a stateless instance is closed, to allow the active requests to drain gracefully. This would be effective when the instance is closing during the application/cluster upgrade and disabling node.
The endpoint exposed on this instance is removed prior to starting the delay, which prevents new connections to this instance.
In addition, clients that have subscribed to service endpoint change events(https://docs.microsoft.com/dotnet/api/system.fabric.fabricclient.servicemanagementclient.registerservicenotificationfilterasync), can do
the following upon receiving the endpoint removal notification:
    - Stop sending new requests to this instance.
    - Close existing connections after in-flight requests have completed.
    - Connect to a different instance of the service partition for future requests.


____
### `InstanceLifecycleDescription`
__Type__: [InstanceLifecycleDescription](sfclient-v82-model-instancelifecycledescription.md) <br/>
__Required__: No<br/>
<br/>
Defines how instances of this service will behave during their lifecycle.

____
### `InstanceRestartWaitDurationSeconds`
__Type__: string <br/>
__Required__: No<br/>
<br/>
When a stateless instance goes down, this timer starts. When it expires Service Fabric will create a new instance on any node in the cluster. 
This configuration is to reduce unnecessary creation of a new instance in situations where the instance going down is likely to recover in a short time. For example, during an upgrade.
The default value is 0, which indicates that when stateless instance goes down, Service Fabric will immediately start building its replacement.

