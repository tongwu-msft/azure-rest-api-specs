---
title: "SelectedPartition v82"
description: "SelectedPartition v82"
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
# SelectedPartition v82

This class returns information about the partition that the user-induced operation acted upon.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceName`](#servicename) | string | No |
| [`PartitionId`](#partitionid) | string (uuid) | No |

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service the partition belongs to.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition ID is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the IDs of its partitions would be different.
