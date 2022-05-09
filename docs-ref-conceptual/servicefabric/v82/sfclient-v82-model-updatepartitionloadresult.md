---
title: "UpdatePartitionLoadResult v82"
description: "UpdatePartitionLoadResult v82"
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
# UpdatePartitionLoadResult v82

Specifies result of updating load for specified partitions. The output will be ordered based on the partition ID.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`PartitionErrorCode`](#partitionerrorcode) | integer | No |

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition.

____
### `PartitionErrorCode`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
If OperationState is Completed - this is 0.  If OperationState is Faulted - this is an error code indicating the reason.
