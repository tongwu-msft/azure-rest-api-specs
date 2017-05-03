---
title: "ClusterCodeVersionsResult"
ms.date: "2017-05-03"
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
# ClusterCodeVersionsResult

The result of the ServiceFabric runtime versions

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [id](#id) | string | No |
| [name](#name) | string | No |
| [type](#type) | string | No |
| [properties](#properties) | [ClusterVersionDetails](sfrp-model-clusterversiondetails.md) | No |

____
### id
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identification of the result

____
### name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the result

____
### type
__Type__: string <br/>
__Required__: No<br/>
<br/>
The result resource type

____
### properties
__Type__: [ClusterVersionDetails](sfrp-model-clusterversiondetails.md) <br/>
__Required__: No<br/>
<br/>
The detail of the Service Fabric runtime version result
