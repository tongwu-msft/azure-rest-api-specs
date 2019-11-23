---
title: "PartitionSafetyCheck"
ms.date: "11/23/2019"
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
# PartitionSafetyCheck

Represents a safety check for the service partition being performed by service fabric before continuing with operations.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PartitionId`](#partitionid) | string (uuid) | No |

____
### `PartitionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition which is undergoing the safety check.
