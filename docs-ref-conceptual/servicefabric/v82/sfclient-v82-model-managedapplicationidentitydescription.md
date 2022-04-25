---
title: "ManagedApplicationIdentityDescription v82"
description: "ManagedApplicationIdentityDescription v82"
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
# ManagedApplicationIdentityDescription v82

Managed application identity description.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`TokenServiceEndpoint`](#tokenserviceendpoint) | string | No |
| [`ManagedIdentities`](#managedidentities) | array of [ManagedApplicationIdentity](sfclient-v82-model-managedapplicationidentity.md) | No |

____
### `TokenServiceEndpoint`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Token service endpoint.

____
### `ManagedIdentities`
__Type__: array of [ManagedApplicationIdentity](sfclient-v82-model-managedapplicationidentity.md) <br/>
__Required__: No<br/>
<br/>
A list of managed application identity objects.
