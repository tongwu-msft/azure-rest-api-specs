---
title: "ClusterUpgradeDeltaHealthPolicy"
ms.date: "2017-04-28"
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
# ClusterUpgradeDeltaHealthPolicy

Delta health policy for the cluster

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [maxPercentDeltaUnhealthyNodes](#maxpercentdeltaunhealthynodes) | integer | Yes |
| [maxPercentUpgradeDomainDeltaUnhealthyNodes](#maxpercentupgradedomaindeltaunhealthynodes) | integer | Yes |
| [maxPercentDeltaUnhealthyApplications](#maxpercentdeltaunhealthyapplications) | integer | Yes |

____
### maxPercentDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
Additional unhealthy nodes percentage

____
### maxPercentUpgradeDomainDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
Additional unhealthy nodes percentage per upgrade domain 

____
### maxPercentDeltaUnhealthyApplications
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
Additional unhealthy applications percentage
