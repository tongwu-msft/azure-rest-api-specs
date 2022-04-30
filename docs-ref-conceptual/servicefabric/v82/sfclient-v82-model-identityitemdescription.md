---
title: "IdentityItemDescription v82"
description: "IdentityItemDescription v82"
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
# IdentityItemDescription v82

Describes a single user-assigned identity associated with the application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`principalId`](#principalid) | string | No |
| [`clientId`](#clientid) | string | No |

____
### `principalId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the object identifier of the Service Principal which this identity represents.

____
### `clientId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the client identifier of the Service Principal which this identity represents.
