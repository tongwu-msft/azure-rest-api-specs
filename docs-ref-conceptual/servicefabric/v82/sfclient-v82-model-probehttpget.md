---
title: "ProbeHttpGet v82"
description: "ProbeHttpGet v82"
ms.date: "04/02/2021"
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
# ProbeHttpGet v82

Http probe for the container.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`port`](#port) | integer | Yes |
| [`path`](#path) | string | No |
| [`host`](#host) | string | No |
| [`httpHeaders`](#httpheaders) | array of [ProbeHttpGetHeaders](sfclient-v82-model-probehttpgetheaders.md) | No |
| [`scheme`](#scheme) | string (enum) | No |

____
### `port`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Port to access for probe.

____
### `path`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Path to access on the HTTP request.

____
### `host`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Host IP to connect to.

____
### `httpHeaders`
__Type__: array of [ProbeHttpGetHeaders](sfclient-v82-model-probehttpgetheaders.md) <br/>
__Required__: No<br/>
<br/>
Headers to set in the request.

____
### `scheme`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Scheme for the http probe. Can be Http or Https.



Possible values are: 

  - `http` - Indicates that the probe is http.
  - `https` - Indicates that the probe is https. No cert validation.


