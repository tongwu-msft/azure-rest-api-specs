---
title: "DiskInfo v82"
description: "DiskInfo v82"
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
# DiskInfo v82

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
