---
title: "PartitionBackupEntity v82"
description: "PartitionBackupEntity v82"
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
# PartitionBackupEntity v82

Identifies the Service Fabric stateful partition which is being backed up.

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
The full name of the service with 'fabric:' URI scheme.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
The partition ID identifying the partition.
