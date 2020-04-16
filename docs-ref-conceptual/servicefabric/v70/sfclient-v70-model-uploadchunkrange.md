---
title: "UploadChunkRange"
ms.date: "11/23/2019"
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
# UploadChunkRange

Information about which portion of the file to upload.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StartPosition`](#startposition) | string | No |
| [`EndPosition`](#endposition) | string | No |

____
### `StartPosition`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The start position of the portion of the file. It's represented by the number of bytes.

____
### `EndPosition`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The end position of the portion of the file. It's represented by the number of bytes.
