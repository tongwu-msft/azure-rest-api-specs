---
title: "ServiceTypeDeltaHealthPolicy"
ms.date: "2018-05-25"
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
# ServiceTypeDeltaHealthPolicy

Represents the delta health policy used to evaluate the health of services belonging to a service type when upgrading the cluster.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [maxPercentDeltaUnhealthyServices](#maxpercentdeltaunhealthyservices) | integer | No |

____
### maxPercentDeltaUnhealthyServices
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
__InclusiveMaximum__: 100 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum allowed percentage of services health degradation allowed during cluster upgrades.
The delta is measured between the state of the services at the beginning of upgrade and the state of the services at the time of the health evaluation.
The check is performed after every upgrade domain upgrade completion to make sure the global state of the cluster is within tolerated limits.

