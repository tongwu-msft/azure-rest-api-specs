---
title: "ServiceIdentity v82"
description: "ServiceIdentity v82"
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
# ServiceIdentity v82

Map service identity friendly name to an application identity.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`identityRef`](#identityref) | string | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity friendly name.

____
### `identityRef`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application identity name.
