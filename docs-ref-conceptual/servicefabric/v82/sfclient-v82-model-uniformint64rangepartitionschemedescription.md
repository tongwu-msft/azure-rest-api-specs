---
title: "UniformInt64RangePartitionSchemeDescription v82"
description: "UniformInt64RangePartitionSchemeDescription v82"
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
# UniformInt64RangePartitionSchemeDescription v82

Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Count`](#count) | integer | Yes |
| [`LowKey`](#lowkey) | string | Yes |
| [`HighKey`](#highkey) | string | Yes |

____
### `Count`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The number of partitions.

____
### `LowKey`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
String indicating the lower bound of the partition key range that
should be split between the partitions.


____
### `HighKey`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
String indicating the upper bound of the partition key range that
should be split between the partitions.

