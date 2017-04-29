---
title: "StatefulServiceTypeDescription"
ms.date: "2017-04-29"
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
# StatefulServiceTypeDescription

Describes a stateful service type defined in the service manifest of a provisioned application type.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [IsStateful](#isstateful) | boolean | No |
| [ServiceTypeName](#servicetypename) | string | No |
| [PlacementConstraints](#placementconstraints) | string | No |
| [ServicePlacementPolicies](#serviceplacementpolicies) | array of [ServicePlacementPolicyDescription](sfclient-model-serviceplacementpolicydescription.md) | No |
| [Extensions](#extensions) | array of [ServiceTypeExtensionDescription](sfclient-model-servicetypeextensiondescription.md) | No |
| [HasPersistedState](#haspersistedstate) | boolean | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateful' for objects of type 'StatefulServiceTypeDescription'.

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
__Type__: array of [ServicePlacementPolicyDescription](sfclient-model-serviceplacementpolicydescription.md) <br/>
__Required__: No<br/>
<br/>
List of service placement policy descriptions.

____
### Extensions
__Type__: array of [ServiceTypeExtensionDescription](sfclient-model-servicetypeextensiondescription.md) <br/>
__Required__: No<br/>
<br/>
List of service type extensions.

____
### HasPersistedState
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
A flag indicating whether this is a persistent service which stores states on the local disk. If it is then the value of this property is true, if not it is false.
