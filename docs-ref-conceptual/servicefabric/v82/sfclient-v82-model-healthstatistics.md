---
title: "HealthStatistics v82"
description: "HealthStatistics v82"
ms.date: "10/21/2020"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# HealthStatistics v82

The health statistics of an entity, returned as part of the health query result when the query description is configured to include statistics.
The statistics include health state counts for all children types of the current entity.
For example, for cluster, the health statistics include health state counts for nodes, applications, services, partitions, replicas, deployed applications and deployed service packages.
For partition, the health statistics include health counts for replicas.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`HealthStateCountList`](#healthstatecountlist) | array of [EntityKindHealthStateCount](sfclient-v82-model-entitykindhealthstatecount.md) | No |

____
### `HealthStateCountList`
__Type__: array of [EntityKindHealthStateCount](sfclient-v82-model-entitykindhealthstatecount.md) <br/>
__Required__: No<br/>
<br/>
List of health state counts per entity kind, which keeps track of how many children of the queried entity are in Ok, Warning and Error state.

