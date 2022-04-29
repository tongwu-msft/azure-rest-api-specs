---
title: "UnplacedReplicaInformation v82"
description: "UnplacedReplicaInformation v82"
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
# UnplacedReplicaInformation v82

Contains information for an unplaced replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ServiceName`](#servicename) | string | No |
| [`PartitionId`](#partitionid) | string (uuid) | No |
| [`UnplacedReplicaDetails`](#unplacedreplicadetails) | array of string | No |

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service.

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
The ID of the partition.

____
### `UnplacedReplicaDetails`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
List of reasons due to which a replica cannot be placed.
