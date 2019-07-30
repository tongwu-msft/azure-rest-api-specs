---
title: "ApplicationInfo"
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
# ApplicationInfo

Information about a Service Fabric application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Id`](#id) | string | No |
| [`Name`](#name) | string | No |
| [`TypeName`](#typename) | string | No |
| [`TypeVersion`](#typeversion) | string | No |
| [`Status`](#status) | string (enum) | No |
| [`Parameters`](#parameters) | array of [ApplicationParameter](sfclient-v62-model-applicationparameter.md) | No |
| [`HealthState`](#healthstate) | string (enum) | No |
| [`ApplicationDefinitionKind`](#applicationdefinitionkind) | string (enum) | No |

____
### `Id`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the application. This is an encoded representation of the application name. This is used in the REST APIs to identify the application resource.
Starting in version 6.0, hierarchical names are delimited with the "\~" character. For example, if the application name is "fabric:/myapp/app1",
the application identity would be "myapp\~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### `TypeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application type name as defined in the application manifest.

____
### `TypeVersion`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the application type as defined in the application manifest.

____
### `Status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The status of the application.


Possible values are: 

  - `Invalid` - Indicates the application status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ready` - Indicates the application status is ready. The value is 1.
  - `Upgrading` - Indicates the application status is upgrading. The value is 2.
  - `Creating` - Indicates the application status is creating. The value is 3.
  - `Deleting` - Indicates the application status is deleting. The value is 4.
  - `Failed` - Indicates the creation or deletion of application was terminated due to persistent failures. Another create/delete request can be accepted to resume a failed application. The value is 5.



____
### `Parameters`
__Type__: array of [ApplicationParameter](sfclient-v62-model-applicationparameter.md) <br/>
__Required__: No<br/>
<br/>
List of application parameters with overridden values from their default values specified in the application manifest.

____
### `HealthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

Possible values are: 

  - `Invalid` - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ok` - Indicates the health state is okay. The value is 1.
  - `Warning` - Indicates the health state is at a warning level. The value is 2.
  - `Error` - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - `Unknown` - Indicates an unknown health status. The value is 65535.



____
### `ApplicationDefinitionKind`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The mechanism used to define a Service Fabric application.


Possible values are: 

  - `Invalid` - Indicates the application definition kind is invalid. All Service Fabric enumerations have the invalid type. The value is 65535.
  - `ServiceFabricApplicationDescription` - Indicates the application is defined by a Service Fabric application description. The value is 0.
  - `Compose` - Indicates the application is defined by compose file(s). The value is 1.


