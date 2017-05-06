---
title: "NamedPartitionInformation"
ms.date: "2017-05-06"
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
# NamedPartitionInformation

Describes the partition information for the name as a string that is based on partition schemes.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServicePartitionKind](#servicepartitionkind) | string | Yes |
| [Id](#id) | string (uuid) | No |
| [Name](#name) | string | No |

____
### ServicePartitionKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Named' for objects of type 'NamedPartitionInformation'.

____
### Id
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a partition. This is a randomly generated GUID when the service was created. The partition id is unique and does not change for the lifetime of the service. If the same service was deleted and recreated the ids of its partitions would be different.

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the partition.
