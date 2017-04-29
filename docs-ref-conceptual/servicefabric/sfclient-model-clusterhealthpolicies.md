---
title: "ClusterHealthPolicies"
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
# ClusterHealthPolicies

Health policies to evaluate cluster health.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ApplicationHealthPolicyMap](#applicationhealthpolicymap) | array of [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) | No |
| [ClusterHealthPolicy](#clusterhealthpolicy) | [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) | No |

____
### ApplicationHealthPolicyMap
__Type__: array of [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) <br/>
__Required__: No<br/>
<br/>
Defines a map that contains specific application health policies for different applications.
Each entry specifies as key the application name and as value an ApplicationHealthPolicy used to evaluate the application health.
If an application is not specified in the map, the application health evaluation uses the ApplicationHealthPolicy found in its application manifest or the default application health policy (if no health policy is defined in the manifest).
The map is empty by default.


____
### ClusterHealthPolicy
__Type__: [ClusterHealthPolicy](sfclient-model-clusterhealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
Defines a health policy used to evaluate the health of the cluster or of a cluster node.

