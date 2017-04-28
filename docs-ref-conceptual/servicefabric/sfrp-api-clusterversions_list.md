---
title: "List"
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
# List
List cluster code versions by location

List cluster code versions by location


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabric/locations/{location}/environments/{environment}/clusterVersions?api-version={api-version}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [location](#location) | string | Yes | Path |
| [environment](#environment) | string (enum) | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### location
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The location for the cluster code versions, this is different from cluster location

____
### environment
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
Cluster operating system, the default means all. Possible values include: 'Default', 'Windows', 'Linux'

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the ServiceFabric resouce provider api

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - List cluster code versions successfully<br/> | [ClusterCodeVersionsListResult](sfrp-model-clustercodeversionslistresult.md) |

