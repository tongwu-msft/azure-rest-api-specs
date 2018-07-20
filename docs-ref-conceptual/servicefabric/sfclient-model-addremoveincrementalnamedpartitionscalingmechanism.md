---
title: "AddRemoveIncrementalNamedPartitionScalingMechanism"
ms.date: "2018-07-20"
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
# AddRemoveIncrementalNamedPartitionScalingMechanism

Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`MinPartitionCount`](#minpartitioncount) | integer | Yes |
| [`MaxPartitionCount`](#maxpartitioncount) | integer | Yes |
| [`ScaleIncrement`](#scaleincrement) | integer | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'AddRemoveIncrementalNamedPartition' for objects of type 'AddRemoveIncrementalNamedPartitionScalingMechanism'.

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
