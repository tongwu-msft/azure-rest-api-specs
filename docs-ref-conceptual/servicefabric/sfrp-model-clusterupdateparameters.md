---
title: "ClusterUpdateParameters"
ms.date: "2017-05-04"
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
# ClusterUpdateParameters

Cluster update request

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [properties](#properties) | [ClusterPropertiesUpdateParameters](sfrp-model-clusterpropertiesupdateparameters.md) | No |
| [tags](#tags) | map of string to string | No |

____
### properties
__Type__: [ClusterPropertiesUpdateParameters](sfrp-model-clusterpropertiesupdateparameters.md) <br/>
__Required__: No<br/>
<br/>
Describes the cluster resource properties that can be updated during PATCH operation.

____
### tags
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
Cluster update parameters
