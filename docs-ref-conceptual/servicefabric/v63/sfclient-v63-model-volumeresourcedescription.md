---
title: "VolumeResourceDescription"
ms.date: 07/20/2018
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
# VolumeResourceDescription

Describes a service fabric volume resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`properties`](#properties) | [VolumeProperties](sfclient-v63-model-volumeproperties.md) | Yes |
| [`name`](#name) | string | Yes |

____
### `properties`
__Type__: [VolumeProperties](sfclient-v63-model-volumeproperties.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes properties of a volume resource.

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Volume resource name.
