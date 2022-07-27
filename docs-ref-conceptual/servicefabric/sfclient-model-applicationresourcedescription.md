---
title: "ApplicationResourceDescription"
description: "ApplicationResourceDescription"
ms.date: "04/25/2022"
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
# ApplicationResourceDescription

This type describes a application resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`properties`](#properties) | [ApplicationProperties](sfclient-model-applicationproperties.md) | Yes |
| [`identity`](#identity) | [IdentityDescription](sfclient-model-identitydescription.md) | No |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the Application resource.

____
### `properties`
__Type__: [ApplicationProperties](sfclient-model-applicationproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes properties of a application resource.

____
### `identity`
__Type__: [IdentityDescription](sfclient-model-identitydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the identity of the application.
