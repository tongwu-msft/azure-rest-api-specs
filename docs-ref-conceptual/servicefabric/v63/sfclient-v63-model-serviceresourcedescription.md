---
title: "ServiceResourceDescription"
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
# ServiceResourceDescription

Describes a service fabric service resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`properties`](#properties) | [ServiceResourceProperties](sfclient-v63-model-serviceresourceproperties.md) | Yes |
| [`name`](#name) | string | Yes |

____
### `properties`
__Type__: [ServiceResourceProperties](sfclient-v63-model-serviceresourceproperties.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes properties of a service resource.

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service resource name.

