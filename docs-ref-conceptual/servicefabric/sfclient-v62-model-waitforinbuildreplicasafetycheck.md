---
title: "WaitForInbuildReplicaSafetyCheck"
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
# WaitForInbuildReplicaSafetyCheck

Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`PartitionId`](#partitionid) | string (uuid) | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'WaitForInbuildReplica' for objects of type 'WaitForInbuildReplicaSafetyCheck'.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition which is undergoing the safety check.
