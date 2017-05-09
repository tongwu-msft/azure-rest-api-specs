---
title: "Cluster"
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
# Cluster

The cluster resource


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [id](#id) | string | No |
| [name](#name) | string | No |
| [type](#type) | string | No |
| [location](#location) | string | Yes |
| [tags](#tags) | map of string to string | No |
| [properties](#properties) | [ClusterProperties](sfrp-model-clusterproperties.md) | No |

____
### id
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource ID.

____
### name
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource name.

____
### type
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure resource type.

____
### location
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Resource location.

____
### tags
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
Resource tags.

____
### properties
__Type__: [ClusterProperties](sfrp-model-clusterproperties.md) <br/>
__Required__: No<br/>
<br/>
Describes the cluster resource properties.
