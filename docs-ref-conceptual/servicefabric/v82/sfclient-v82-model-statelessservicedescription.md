---
title: "StatelessServiceDescription v82"
description: "StatelessServiceDescription v82"
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
# StatelessServiceDescription v82

Describes a stateless service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ApplicationName`](#applicationname) | string | No |
| [`ServiceName`](#servicename) | string | Yes |
| [`ServiceTypeName`](#servicetypename) | string | Yes |
| [`InitializationData`](#initializationdata) | array of integer | No |
| [`PartitionDescription`](#partitiondescription) | [PartitionSchemeDescription](sfclient-v82-model-partitionschemedescription.md) | Yes |
| [`PlacementConstraints`](#placementconstraints) | string | No |
| [`CorrelationScheme`](#correlationscheme) | array of [ServiceCorrelationDescription](sfclient-v82-model-servicecorrelationdescription.md) | No |
| [`ServiceLoadMetrics`](#serviceloadmetrics) | array of [ServiceLoadMetricDescription](sfclient-v82-model-serviceloadmetricdescription.md) | No |
| [`ServicePlacementPolicies`](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](sfclient-v82-model-serviceplacementpolicydescription.md) | No |
| [`DefaultMoveCost`](#defaultmovecost) | string (enum) | No |
| [`IsDefaultMoveCostSpecified`](#isdefaultmovecostspecified) | boolean | No |
| [`ServicePackageActivationMode`](#servicepackageactivationmode) | string (enum) | No |
| [`ServiceDnsName`](#servicednsname) | string | No |
| [`ScalingPolicies`](#scalingpolicies) | array of [ScalingPolicyDescription](sfclient-v82-model-scalingpolicydescription.md) | No |
| [`TagsRequiredToPlace`](#tagsrequiredtoplace) | [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) | No |
| [`TagsRequiredToRun`](#tagsrequiredtorun) | [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) | No |
| [`InstanceCount`](#instancecount) | integer | Yes |
| [`MinInstanceCount`](#mininstancecount) | integer | No |
| [`MinInstancePercentage`](#mininstancepercentage) | integer | No |
| [`Flags`](#flags) | integer | No |
| [`InstanceCloseDelayDurationSeconds`](#instanceclosedelaydurationseconds) | integer (int64) | No |
| [`InstanceLifecycleDescription`](#instancelifecycledescription) | [InstanceLifecycleDescription](sfclient-v82-model-instancelifecycledescription.md) | No |
| [`InstanceRestartWaitDurationSeconds`](#instancerestartwaitdurationseconds) | integer (int64) | No |

____
### `ApplicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### `ServiceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.

____
### `ServiceTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the service type as specified in the service manifest.

____
### `InitializationData`
__Type__: array of integer <br/>
__Required__: No<br/>
<br/>
The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.

____
### `PartitionDescription`
__Type__: [PartitionSchemeDescription](sfclient-v82-model-partitionschemedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The partition description as an object.

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
### `ServiceLoadMetrics`
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
### `IsDefaultMoveCostSpecified`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates if the DefaultMoveCost property is specified.

____
### `ServicePackageActivationMode`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The activation mode of service package to be used for a service.

The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service.

Possible values are: 

  - `SharedProcess` - This is the default activation mode. With this activation mode, replicas or instances from different partition(s) of service, on a given node, will share same activation of service package on a node. The value is zero.
  - `ExclusiveProcess` - With this activation mode, each replica or instance of service, on a given node, will have its own dedicated activation of service package on a node. The value is 1.



____
### `ServiceDnsName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The DNS name of the service. It requires the DNS system service to be enabled in Service Fabric cluster.

____
### `ScalingPolicies`
__Type__: array of [ScalingPolicyDescription](sfclient-v82-model-scalingpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
Scaling policies for this service.

____
### `TagsRequiredToPlace`
__Type__: [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) <br/>
__Required__: No<br/>
<br/>
Tags for placement of this service.

____
### `TagsRequiredToRun`
__Type__: [NodeTagsDescription](sfclient-v82-model-nodetagsdescription.md) <br/>
__Required__: No<br/>
<br/>
Tags for running of this service.

____
### `InstanceCount`
__Type__: integer <br/>
__Required__: Yes<br/>
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
### `Flags`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Flags indicating whether other properties are set. Each of the associated properties corresponds to a flag, specified below, which, if set, indicate that the property is specified.
This property can be a combination of those flags obtained using bitwise 'OR' operator.
For example, if the provided value is 1 then the flags for InstanceCloseDelayDuration is set.

- None - Does not indicate any other properties are set. The value is zero.
- InstanceCloseDelayDuration - Indicates the InstanceCloseDelayDuration property is set. The value is 1.
- InstanceRestartWaitDuration - Indicates the InstanceRestartWaitDurationSeconds property is set. The value is 2.


____
### `InstanceCloseDelayDurationSeconds`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
Duration in seconds, to wait before a stateless instance is closed, to allow the active requests to drain gracefully. This would be effective when the instance is closing during the application/cluster upgrade and disabling node.
The endpoint exposed on this instance is removed prior to starting the delay, which prevents new connections to this instance.
In addition, clients that have subscribed to service endpoint change events(https://docs.microsoft.com/dotnet/api/system.fabric.fabricclient.servicemanagementclient.registerservicenotificationfilterasync), can do
the following upon receiving the endpoint removal notification:
    - Stop sending new requests to this instance.
    - Close existing connections after in-flight requests have completed.
    - Connect to a different instance of the service partition for future requests.
Note, the default value of InstanceCloseDelayDuration is 0, which indicates that there won't be any delay or removal of the endpoint prior to closing the instance.


____
### `InstanceLifecycleDescription`
__Type__: [InstanceLifecycleDescription](sfclient-v82-model-instancelifecycledescription.md) <br/>
__Required__: No<br/>
<br/>
Defines how instances of this service will behave during their lifecycle.

____
### `InstanceRestartWaitDurationSeconds`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
When a stateless instance goes down, this timer starts. When it expires Service Fabric will create a new instance on any node in the cluster. 
This configuration is to reduce unnecessary creation of a new instance in situations where the instance going down is likely to recover in a short time. For example, during an upgrade.
The default value is 0, which indicates that when stateless instance goes down, Service Fabric will immediately start building its replacement.

