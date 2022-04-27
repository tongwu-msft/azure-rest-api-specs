---
title: "Network service referenc v82e"
description: "NetworkRef v82e"
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
# Network service reference v82

Describes a network reference in a service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`endpointRefs`](#endpointrefs) | array of [EndpointRef](sfclient-v82-model-endpointref.md) | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the network

____
### `endpointRefs`
__Type__: array of [EndpointRef](sfclient-v82-model-endpointref.md) <br/>
__Required__: No<br/>
<br/>
A list of endpoints that are exposed on this network.
