---
title: "Endpoint Properties"
description: "EndpointProperties"
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
# Endpoint Properties

Describes a container endpoint.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`port`](#port) | integer | No |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the endpoint.

____
### `port`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Port used by the container.
