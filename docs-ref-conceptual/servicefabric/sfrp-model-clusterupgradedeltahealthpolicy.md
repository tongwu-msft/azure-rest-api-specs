---
title: "ClusterUpgradeDeltaHealthPolicy"
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
# ClusterUpgradeDeltaHealthPolicy

Describes the delta health policies for the cluster upgrade.

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
The maximum allowed percentage of nodes health degradation allowed during cluster upgrades. The delta is measured between the state of the nodes at the beginning of upgrade and the state of the nodes at the time of the health evaluation. The check is performed after every upgrade domain upgrade completion to make sure the global state of the cluster is within tolerated limits.

____
### maxPercentUpgradeDomainDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of upgrade domain nodes health degradation allowed during cluster upgrades. The delta is measured between the state of the upgrade domain nodes at the beginning of upgrade and the state of the upgrade domain nodes at the time of the health evaluation. The check is performed after every upgrade domain upgrade completion for all completed upgrade domains to make sure the state of the upgrade domains is within tolerated limits. 

____
### maxPercentDeltaUnhealthyApplications
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of applications health degradation allowed during cluster upgrades. The delta is measured between the state of the applications at the beginning of upgrade and the state of the applications at the time of the health evaluation. The check is performed after every upgrade domain upgrade completion to make sure the global state of the cluster is within tolerated limits. System services are not included in this.
