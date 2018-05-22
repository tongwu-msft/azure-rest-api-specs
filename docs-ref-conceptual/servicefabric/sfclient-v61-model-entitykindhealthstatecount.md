---
title: "EntityKindHealthStateCount"
ms.date: "2018-01-22"
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
# EntityKindHealthStateCount

Represents health state count for entities of the specified entity kind.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [EntityKind](#entitykind) | string (enum) | No |
| [HealthStateCount](#healthstatecount) | [HealthStateCount](sfclient-v61-model-healthstatecount.md) | No |

____
### EntityKind
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The entity kind for which health states are evaluated.

The entity type of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

Possible values are: 

  - Invalid - Indicates an invalid entity kind. All Service Fabric enumerations have the invalid type. The value is zero.
  - Node - Indicates the entity is a Service Fabric node. The value is 1.
  - Partition - Indicates the entity is a Service Fabric partition. The value is 2.
  - Service - Indicates the entity is a Service Fabric service. The value is 3.
  - Application - Indicates the entity is a Service Fabric application. The value is 4.
  - Replica - Indicates the entity is a Service Fabric replica. The value is 5.
  - DeployedApplication - Indicates the entity is a Service Fabric deployed application. The value is 6.
  - DeployedServicePackage - Indicates the entity is a Service Fabric deployed service package. The value is 7.
  - Cluster - Indicates the entity is a Service Fabric cluster. The value is 8.



____
### HealthStateCount
__Type__: [HealthStateCount](sfclient-v61-model-healthstatecount.md) <br/>
__Required__: No<br/>
<br/>
The health state count for the entities of the specified kind.
