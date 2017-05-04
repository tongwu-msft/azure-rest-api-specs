---
title: "Epoch"
ms.date: "2017-05-04"
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
# Epoch

An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ConfigurationVersion](#configurationversion) | string (int64) | No |
| [DataLossVersion](#datalossversion) | string (int64) | No |

____
### ConfigurationVersion
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The current configuration number of this Epoch. The configuration number is an increasing value that is updated whenever the configuration of this replica set changes.

____
### DataLossVersion
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The current dataloss number of this Epoch. The data loss number property is an increasing value which is updated whenever data loss is suspected, as when loss of a quorum of replicas in the replica set that includes the Primary replica.
