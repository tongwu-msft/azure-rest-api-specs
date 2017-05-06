---
title: "ClusterUpgradeHealthPolicyObject"
ms.date: "2017-05-06"
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
# ClusterUpgradeHealthPolicyObject

Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [MaxPercentDeltaUnhealthyNodes](#maxpercentdeltaunhealthynodes) | integer | No |
| [MaxPercentUpgradeDomainDeltaUnhealthyNodes](#maxpercentupgradedomaindeltaunhealthynodes) | integer | No |

____
### MaxPercentDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of nodes health degradation allowed during cluster upgrades. The delta is measured between the state of the nodes at the beginning of upgrade and the state of the nodes at the time of the health evaluation. The check is performed after every upgrade domain upgrade completion to make sure the global state of the cluster is within tolerated limits. The default value is 10%.

____
### MaxPercentUpgradeDomainDeltaUnhealthyNodes
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of upgrade domain nodes health degradation allowed during cluster upgrades. The delta is measured between the state of the upgrade domain nodes at the beginning of upgrade and the state of the upgrade domain nodes at the time of the health evaluation. The check is performed after every upgrade domain upgrade completion for all completed upgrade domains to make sure the state of the upgrade domains is within tolerated limits. The default value is 15%.
