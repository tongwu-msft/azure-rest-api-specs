---
title: "ProbeExec v82"
description: "ProbeExec v82"
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
# ProbeExec v82

Exec command to run inside the container.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`command`](#command) | string | Yes |

____
### `command`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Comma separated command to run inside the container for example "sh, -c, echo hello world".
