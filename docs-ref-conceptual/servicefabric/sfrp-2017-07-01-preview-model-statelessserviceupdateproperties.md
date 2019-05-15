---
title: "StatelessServiceUpdateProperties"
ms.date: "2018-05-25"
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
# StatelessServiceUpdateProperties

The properties of a stateless service resource for patch operations.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [serviceKind](#servicekind) | string | Yes |
| [placementConstraints](#placementconstraints) | string | No |
| [correlationScheme](#correlationscheme) | array of [ServiceCorrelationDescription](sfrp-2017-07-01-preview-model-servicecorrelationdescription.md) | No |
| [serviceLoadMetrics](#serviceloadmetrics) | array of [ServiceLoadMetricDescription](sfrp-2017-07-01-preview-model-serviceloadmetricdescription.md) | No |
| [servicePlacementPolicies](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](sfrp-2017-07-01-preview-model-serviceplacementpolicydescription.md) | No |
| [defaultMoveCost](#defaultmovecost) | string (enum) | No |
| [instanceCount](#instancecount) | integer | No |

____
### serviceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'StatelessServiceUpdateProperties'.

____
### placementConstraints
__Type__: string <br/>
__Required__: No<br/>
<br/>
The placement constraints as a string. Placement constraints are boolean expressions on node properties and allow for restricting a service to particular nodes based on the service requirements. For example, to place a service on nodes where NodeType is blue specify the following: "NodeColor == blue)".

____
### correlationScheme
__Type__: array of [ServiceCorrelationDescription](sfrp-2017-07-01-preview-model-servicecorrelationdescription.md) <br/>
__Required__: No<br/>
<br/>
A list that describes the correlation of the service with other services.

____
### serviceLoadMetrics
__Type__: array of [ServiceLoadMetricDescription](sfrp-2017-07-01-preview-model-serviceloadmetricdescription.md) <br/>
__Required__: No<br/>
<br/>
The service load metrics is given as an array of ServiceLoadMetricDescription objects.

____
### servicePlacementPolicies
__Type__: array of [ServicePlacementPolicyDescription](sfrp-2017-07-01-preview-model-serviceplacementpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
A list that describes the correlation of the service with other services.

____
### defaultMoveCost
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Specifies the move cost for the service.

Possible values are: 

  - Zero - Zero move cost. This value is zero.
  - Low - Specifies the move cost of the service as Low. The value is 1.
  - Medium - Specifies the move cost of the service as Medium. The value is 2.
  - High - Specifies the move cost of the service as High. The value is 3.



____
### instanceCount
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMinimum__: -1 <br/>
<br/>
The instance count.
