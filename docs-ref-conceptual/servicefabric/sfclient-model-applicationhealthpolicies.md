---
title: "ApplicationHealthPolicies"
ms.date: "2017-05-09"
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
# ApplicationHealthPolicies

Defines the application health policy map used to evaluate the health of an application or one of its children entities.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ApplicationHealthPolicyMap](#applicationhealthpolicymap) | array of [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) | No |

____
### ApplicationHealthPolicyMap
__Type__: array of [ApplicationHealthPolicyMapItem](sfclient-model-applicationhealthpolicymapitem.md) <br/>
__Required__: No<br/>
<br/>
The wrapper that contains the map with application health policies used to evaluate specific applications in the cluster.
