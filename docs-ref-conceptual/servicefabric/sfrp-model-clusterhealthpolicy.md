---
title: "ClusterHealthPolicy"
ms.date: "2017-04-29"
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
# ClusterHealthPolicy

Defines a health policy used to evaluate the health of the cluster or of a cluster node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [maxPercentUnhealthyNodes](#maxpercentunhealthynodes) | integer | No |
| [maxPercentUnhealthyApplications](#maxpercentunhealthyapplications) | integer | No |

____
### maxPercentUnhealthyNodes
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy nodes before reporting an error. For example, to allow 10% of nodes to be unhealthy, this value would be 10. 

____
### maxPercentUnhealthyApplications
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy applications before reporting an error. For example, to allow 10% of applications to be unhealthy, this value would be 10. 
