---
title: "SecretResourceDescription"
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
# SecretResourceDescription

This type describes a secret resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`properties`](#properties) | [SecretResourceProperties](sfclient-v65-model-secretresourceproperties.md) | Yes |
| [`name`](#name) | string | Yes |

____
### `properties`
__Type__: [SecretResourceProperties](sfclient-v65-model-secretresourceproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the properties of a secret resource.

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the Secret resource.
