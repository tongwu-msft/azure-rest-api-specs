---
title: "StatelessServiceTypeDescription"
ms.date: "2017-04-26"
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
# StatelessServiceTypeDescription

Describes a stateless service type defined in the service manifest of a provisioned application type.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [IsStateful](#isstateful) | boolean | No |
| [ServiceTypeName](#servicetypename) | string | No |
| [PlacementConstraints](#placementconstraints) | string | No |
| [ServicePlacementPolicies](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](model-ServicePlacementPolicyDescription.md) | No |
| [Extensions](#extensions) | array of [ServiceTypeExtensionDescription](model-ServiceTypeExtensionDescription.md) | No |
| [UseImplicitHost](#useimplicithost) | boolean | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'StatelessServiceTypeDescription'.

____
### IsStateful
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates whether the service type is a stateful service type or a stateless service type. This property is true if the service type is a stateful service type, false otherwise.

____
### ServiceTypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the service type.

____
### PlacementConstraints
__Type__: string <br/>
__Required__: No<br/>
<br/>
The placement constraint to be used when instantiating this service in a Service Fabric cluster.

____
### ServicePlacementPolicies
__Type__: array of [ServicePlacementPolicyDescription](model-ServicePlacementPolicyDescription.md) <br/>
__Required__: No<br/>
<br/>
List of service placement policy descriptions.

____
### Extensions
__Type__: array of [ServiceTypeExtensionDescription](model-ServiceTypeExtensionDescription.md) <br/>
__Required__: No<br/>
<br/>
List of service type extensions.

____
### UseImplicitHost
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A flag indicating if this type is not implemented and hosted by a user service process, but is implicitly hosted by a system created process. This value is true for services using the guest executable services, false otherwise.
