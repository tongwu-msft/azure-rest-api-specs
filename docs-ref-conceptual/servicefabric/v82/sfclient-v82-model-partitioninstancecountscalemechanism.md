---
title: "PartitionInstanceCountScaleMechanism v82"
description: "PartitionInstanceCountScaleMechanism v82"
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
# PartitionInstanceCountScaleMechanism v82

Represents a scaling mechanism for adding or removing instances of stateless service partition.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`MinInstanceCount`](#mininstancecount) | integer | Yes |
| [`MaxInstanceCount`](#maxinstancecount) | integer | Yes |
| [`ScaleIncrement`](#scaleincrement) | integer | Yes |

____
### `MinInstanceCount`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Minimum number of instances of the partition.

____
### `MaxInstanceCount`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Maximum number of instances of the partition.

____
### `ScaleIncrement`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The number of instances to add or remove during a scaling operation.
