---
title: "DeployedApplicationInfo"
ms.date: "2018-07-20"
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
# DeployedApplicationInfo

Information about application deployed on the node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Id`](#id) | string | No |
| [`Name`](#name) | string | No |
| [`TypeName`](#typename) | string | No |
| [`Status`](#status) | string (enum) | No |
| [`WorkDirectory`](#workdirectory) | string | No |
| [`LogDirectory`](#logdirectory) | string | No |
| [`TempDirectory`](#tempdirectory) | string | No |
| [`HealthState`](#healthstate) | string (enum) | No |

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
### `Status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The status of the application deployed on the node. Following are the possible values.


Possible values are: 

  - `Invalid` - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Downloading` - Indicates that the package is downloading from the ImageStore. The value is 1.
  - `Activating` - Indicates that the package is activating. The value is 2.
  - `Active` - Indicates that the package is active. The value is 3.
  - `Upgrading` - Indicates that the package is upgrading. The value is 4.
  - `Deactivating` - Indicates that the package is deactivating. The value is 5.



____
### `WorkDirectory`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The work directory of the application on the node. The work directory can be used to store application data.

____
### `LogDirectory`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The log directory of the application on the node. The log directory can be used to store application logs.

____
### `TempDirectory`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The temp directory of the application on the node. The code packages belonging to the application are forked with this directory set as their temporary directory.

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


