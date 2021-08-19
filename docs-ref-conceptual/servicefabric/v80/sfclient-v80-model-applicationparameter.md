---
title: "ApplicationParameter v80"
description: "ApplicationParameter v80"
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
# ApplicationParameter v80

Describes an application parameter override to be applied when creating or upgrading an application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Key`](#key) | string | Yes |
| [`Value`](#value) | string | Yes |

____
### `Key`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the parameter.

____
### `Value`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The value of the parameter.
