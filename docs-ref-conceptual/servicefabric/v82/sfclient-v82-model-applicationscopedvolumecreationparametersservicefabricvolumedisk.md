---
title: "ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk v82"
description: "ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk v82"
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
# ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk v82

Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`sizeDisk`](#sizedisk) | string (enum) | Yes |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the volume.

____
### `sizeDisk`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
Volume size



