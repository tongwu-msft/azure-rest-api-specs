---
title: "ManagedApplicationIdentity v82"
description: "ManagedApplicationIdentity v82"
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
# ManagedApplicationIdentity v82

Describes a managed application identity.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | Yes |
| [`PrincipalId`](#principalid) | string | No |

____
### `Name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the identity.

____
### `PrincipalId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity's PrincipalId.
