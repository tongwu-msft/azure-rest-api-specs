---
title: "ApplicationHealthPolicyMapObject v82"
description: "ApplicationHealthPolicyMapObject v82"
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
# ApplicationHealthPolicyMapObject v82

Represents the map of application health policies for a ServiceFabric cluster upgrade

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ApplicationHealthPolicyMap`](#applicationhealthpolicymap) | array of [ApplicationHealthPolicyMapItem](sfclient-v82-model-applicationhealthpolicymapitem.md) | No |

____
### `ApplicationHealthPolicyMap`
__Type__: array of [ApplicationHealthPolicyMapItem](sfclient-v82-model-applicationhealthpolicymapitem.md) <br/>
__Required__: No<br/>
<br/>
Defines a map that contains specific application health policies for different applications.
Each entry specifies as key the application name and as value an ApplicationHealthPolicy used to evaluate the application health.
If an application is not specified in the map, the application health evaluation uses the ApplicationHealthPolicy found in its application manifest or the default application health policy (if no health policy is defined in the manifest).
The map is empty by default.

