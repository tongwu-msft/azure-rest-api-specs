---
title: "NetworkRef"
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
# NetworkRef

Describes a network reference in a service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`endpointRefs`](#endpointrefs) | array of [EndpointRef](sfclient-v64-model-endpointref.md) | No |

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the network

____
### `endpointRefs`
__Type__: array of [EndpointRef](sfclient-v64-model-endpointref.md) <br/>
__Required__: No<br/>
<br/>
A list of endpoints that are exposed on this network.
