---
title: "DeployedServicePackageHealthState"
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
# DeployedServicePackageHealthState

Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`AggregatedHealthState`](#aggregatedhealthstate) | string (enum) | No |
| [`NodeName`](#nodename) | string | No |
| [`ApplicationName`](#applicationname) | string | No |
| [`ServiceManifestName`](#servicemanifestname) | string | No |
| [`ServicePackageActivationId`](#servicepackageactivationid) | string | No |

____
### `AggregatedHealthState`
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
### `NodeName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the node on which the service package is deployed.

____
### `ApplicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### `ServiceManifestName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the manifest describing the service package.

____
### `ServicePackageActivationId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.

