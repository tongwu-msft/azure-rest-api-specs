---
title: "BackupEpoch"
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
# BackupEpoch

An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ConfigurationNumber`](#configurationnumber) | string | No |
| [`DataLossNumber`](#datalossnumber) | string | No |

____
### `ConfigurationNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current configuration number of this Epoch. The configuration number is an increasing value that is updated whenever the configuration of this replica set changes.

____
### `DataLossNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current dataloss number of this Epoch. The data loss number property is an increasing value which is updated whenever data loss is suspected, as when loss of a quorum of replicas in the replica set that includes the Primary replica.
