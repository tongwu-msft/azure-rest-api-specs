---
title: "ApplicationHealthStateChunk"
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
# ApplicationHealthStateChunk

Represents the health state chunk of a application.
The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [HealthState](#healthstate) | string (enum) | No |
| [ApplicationName](#applicationname) | string | No |
| [ApplicationTypeName](#applicationtypename) | string | No |
| [ServiceHealthStateChunks](#servicehealthstatechunks) | [ServiceHealthStateChunkList](sfclient-model-servicehealthstatechunklist.md) | No |
| [DeployedApplicationHealthStateChunks](#deployedapplicationhealthstatechunks) | [DeployedApplicationHealthStateChunkList](sfclient-model-deployedapplicationhealthstatechunklist.md) | No |

____
### HealthState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

  - Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - Ok - Indicates the health state is okay. The value is 1.
  - Warning - Indicates the health state is at a warning level. The value is 2.
  - Error - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - Unknown - Indicates an unknown health status. The value is 65535.


____
### ApplicationName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application.

____
### ApplicationTypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application type name for the application.

____
### ServiceHealthStateChunks
__Type__: [ServiceHealthStateChunkList](sfclient-model-servicehealthstatechunklist.md) <br/>
__Required__: No<br/>
<br/>
The list of service health state chunks in the cluster that respect the filters in the cluster health chunk query description.


____
### DeployedApplicationHealthStateChunks
__Type__: [DeployedApplicationHealthStateChunkList](sfclient-model-deployedapplicationhealthstatechunklist.md) <br/>
__Required__: No<br/>
<br/>
The list of deployed application health state chunks in the cluster that respect the filters in the cluster health chunk query description.

