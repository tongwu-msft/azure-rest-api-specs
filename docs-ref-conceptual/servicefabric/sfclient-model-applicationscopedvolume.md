---
title: "ApplicationScopedVolume"
ms.date: 06/12/2019
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
# ApplicationScopedVolume

Describes a volume whose lifetime is scoped to the application's lifetime.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`readOnly`](#readonly) | boolean | No |
| [`destinationPath`](#destinationpath) | string | Yes |
| [`creationParameters`](#creationparameters) | [ApplicationScopedVolumeCreationParameters](sfclient-model-applicationscopedvolumecreationparameters.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the volume being referenced.

____
### `readOnly`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
The flag indicating whether the volume is read only. Default is 'false'.

____
### `destinationPath`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The path within the container at which the volume should be mounted. Only valid path characters are allowed.

____
### `creationParameters`
__Type__: [ApplicationScopedVolumeCreationParameters](sfclient-model-applicationscopedvolumecreationparameters.md) <br/>
__Required__: Yes<br/>
<br/>
Describes parameters for creating application-scoped volumes.
