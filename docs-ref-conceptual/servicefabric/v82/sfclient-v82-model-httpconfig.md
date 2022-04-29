---
title: "HttpConfig v82"
description: "HttpConfig v82"
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
# HttpConfig v82

Describes the http configuration for external connectivity for this network.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`port`](#port) | integer | Yes |
| [`hosts`](#hosts) | array of [HttpHostConfig](sfclient-v82-model-httphostconfig.md) | Yes |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
http gateway config name.

____
### `port`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
Specifies the port at which the service endpoint below needs to be exposed.

____
### `hosts`
__Type__: array of [HttpHostConfig](sfclient-v82-model-httphostconfig.md) <br/>
__Required__: Yes<br/>
<br/>
description for routing.
