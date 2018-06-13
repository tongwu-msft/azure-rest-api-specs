---
title: "PartitionBackupEntity"
ms.date: "2018-04-23"
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
# PartitionBackupEntity

Identifies the Service Fabric stateful partition which is being backed up.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`EntityKind`](#entitykind) | string | Yes |
| [`ServiceName`](#servicename) | string | No |
| [`PartitionId`](#partitionid) | string (uuid) | No |

____
### EntityKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Partition' for objects of type 'PartitionBackupEntity'.

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
The partition ID indentifying the partition.
