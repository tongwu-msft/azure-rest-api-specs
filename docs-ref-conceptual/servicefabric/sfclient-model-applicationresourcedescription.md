---
title: "ApplicationResourceDescription"
ms.date: "2018-07-20"
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
# ApplicationResourceDescription

Describes a service fabric application resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`properties`](#properties) | [ApplicationProperties](sfclient-model-applicationproperties.md) | Yes |
| [`name`](#name) | string | Yes |

____
### `properties`
__Type__: [ApplicationProperties](sfclient-model-applicationproperties.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes properties of an application resource.

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Application resource name.

