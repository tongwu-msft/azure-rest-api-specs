---
title: "DeployedApplicationHealthStateChunk"
ms.date: "2017-05-09"
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
# DeployedApplicationHealthStateChunk

Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [HealthState](#healthstate) | string (enum) | No |
| [NodeName](#nodename) | string | No |
| [DeployedServicePackageHealthStateChunks](#deployedservicepackagehealthstatechunks) | [DeployedServicePackageHealthStateChunkList](sfclient-v56-model-deployedservicepackagehealthstatechunklist.md) | No |

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
### NodeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of node where the application is deployed.

____
### DeployedServicePackageHealthStateChunks
__Type__: [DeployedServicePackageHealthStateChunkList](sfclient-v56-model-deployedservicepackagehealthstatechunklist.md) <br/>
__Required__: No<br/>
<br/>
The list of deployed service oackage health state chunks belonging to the deployed application that respect the filters in the cluster health chunk query description.

