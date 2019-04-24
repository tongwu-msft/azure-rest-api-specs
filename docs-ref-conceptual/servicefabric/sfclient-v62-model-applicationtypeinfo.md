---
title: "ApplicationTypeInfo"
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
# ApplicationTypeInfo

Information about an application type.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`Version`](#version) | string | No |
| [`DefaultParameterList`](#defaultparameterlist) | array of [ApplicationParameter](sfclient-v62-model-applicationparameter.md) | No |
| [`Status`](#status) | string (enum) | No |
| [`StatusDetails`](#statusdetails) | string | No |
| [`ApplicationTypeDefinitionKind`](#applicationtypedefinitionkind) | string (enum) | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application type name as defined in the application manifest.

____
### `Version`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the application type as defined in the application manifest.

____
### `DefaultParameterList`
__Type__: array of [ApplicationParameter](sfclient-v62-model-applicationparameter.md) <br/>
__Required__: No<br/>
<br/>
List of application type parameters that can be overridden when creating or updating the application.

____
### `Status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The status of the application type.


Possible values are: 

  - `Invalid` - Indicates the application type status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Provisioning` - Indicates that the application type is being provisioned in the cluster. The value is 1.
  - `Available` - Indicates that the application type is fully provisioned and is available for use. An application of this type and version can be created. The value is 2.
  - `Unprovisioning` - Indicates that the application type is in process of being unprovisioned from the cluster. The value is 3.
  - `Failed` - Indicates that the application type provisioning failed and it is unavailable for use. The failure details can be obtained from the application type information query. The failed application type information remains in the cluster until it is unprovisioned or reprovisioned successfully. The value is 4.



____
### `StatusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Additional detailed information about the status of the application type.

____
### `ApplicationTypeDefinitionKind`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The mechanism used to define a Service Fabric application type.


Possible values are: 

  - `Invalid` - Indicates the application type definition kind is invalid. All Service Fabric enumerations have the invalid type. The value is 0.
  - `ServiceFabricApplicationPackage` - Indicates the application type is defined and created by a Service Fabric application package provided by the user. The value is 1.
  - `Compose` - Indicates the application type is defined and created implicitly as part of a compose deployment. The value is 2.


