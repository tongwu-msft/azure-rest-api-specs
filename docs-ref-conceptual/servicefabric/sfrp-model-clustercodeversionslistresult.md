---
title: "ClusterCodeVersionsListResult"
ms.date: "2017-05-09"
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
# ClusterCodeVersionsListResult

The list results of the ServiceFabric runtime versions.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [value](#value) | array of [ClusterCodeVersionsResult](sfrp-model-clustercodeversionsresult.md) | No |
| [nextLink](#nextlink) | string | No |

____
### value
__Type__: array of [ClusterCodeVersionsResult](sfrp-model-clustercodeversionsresult.md) <br/>
__Required__: No<br/>
<br/>


____
### nextLink
__Type__: string <br/>
__Required__: No<br/>
<br/>
The URL to use for getting the next set of results.
