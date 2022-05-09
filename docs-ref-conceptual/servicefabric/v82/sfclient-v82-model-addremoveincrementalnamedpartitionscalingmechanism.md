---
title: "AddRemoveIncrementalNamedPartitionScalingMechanism v82"
description: "AddRemoveIncrementalNamedPartitionScalingMechanism v82"
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
# AddRemoveIncrementalNamedPartitionScalingMechanism v82

Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`MinPartitionCount`](#minpartitioncount) | integer | Yes |
| [`MaxPartitionCount`](#maxpartitioncount) | integer | Yes |
| [`ScaleIncrement`](#scaleincrement) | integer | Yes |

____
### `MinPartitionCount`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Minimum number of named partitions of the service.

____
### `MaxPartitionCount`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Maximum number of named partitions of the service.

____
### `ScaleIncrement`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The number of instances to add or remove during a scaling operation.
