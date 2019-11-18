---
title: "ServiceResourceDescription"
ms.date: 11/26/2018
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
# ServiceResourceDescription

This type describes a service resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`properties`](#properties) | [ServiceResourceProperties](sfclient-v64-model-serviceresourceproperties.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the Service resource.

____
### `properties`
__Type__: [ServiceResourceProperties](sfclient-v64-model-serviceresourceproperties.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes properties of a service resource.
