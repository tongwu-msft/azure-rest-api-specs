---
title: "ClusterListResult"
description: "Describe Cluster list results. Properties include value and nextLink, with the nextLink defined as the URL used for getting the next set of results."
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# ClusterListResult

Cluster list results

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [value](#value) | array of [Cluster](sfrp-model-cluster.md) | No |
| [nextLink](#nextlink) | string | No |

____
### value
__Type__: array of [Cluster](sfrp-model-cluster.md) <br/>
__Required__: No<br/>
<br/>


____
### nextLink
__Type__: string <br/>
__Required__: No<br/>
<br/>
The URL to use for getting the next set of results.
