---
title: "DiskInfo"
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
# DiskInfo

Information about the disk

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Capacity`](#capacity) | string | No |
| [`AvailableSpace`](#availablespace) | string | No |

____
### `Capacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the disk size in bytes

____
### `AvailableSpace`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the available disk space in bytes
