---
title: "StatelessServiceDescription"
ms.date: "2017-04-28"
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
# StatelessServiceDescription

Describes a stateless service.

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
| [InstanceCount](#instancecount) | integer | Yes |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'StatelessServiceDescription'.

____
### ApplicationName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application name.

____
### ServiceName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The service name.

____
### ServiceTypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The service type name.

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

Specifies the move cost for the service. Possible values are the following.

  - Zero - Zero move cost. This value is zero.
  - Low - Specifies the move cost of the service as Low. The value is 1.
  - Medium - Specifies the move cost of the service as Medium. The value is 2.
  - High - Specifies the move cost of the service as High. The value is 3.



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

The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service. Possible values are following.

  - SharedProcess - This is the default activation mode. With this activation mode, replicas or instances from different partition(s) of service, on a given node, will share same activation of service package on a node. The value is zero.
  - ExclusiveProcess - With this activation mode, each replica or instance of service, on a given node, will have its own dedicated activation of service package on a node. The value is 1.



____
### ServiceDnsName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The DNS name of the service. It requires the DNS system service to be enabled in Service Fabric cluster.

____
### InstanceCount
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMinimum__: -1 <br/>
<br/>
The instance count.
