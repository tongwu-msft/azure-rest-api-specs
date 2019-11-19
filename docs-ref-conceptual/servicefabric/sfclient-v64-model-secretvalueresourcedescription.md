---
title: "SecretValueResourceDescription"
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
# SecretValueResourceDescription

This type describes a value of a secret resource. The name of this resource is the version identifier corresponding to this secret value.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`properties`](#properties) | [SecretValueResourceProperties](sfclient-v64-model-secretvalueresourceproperties.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Version identifier of the secret value.

____
### `properties`
__Type__: [SecretValueResourceProperties](sfclient-v64-model-secretvalueresourceproperties.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes properties of a secret value resource.
