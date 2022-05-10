---
title: "UploadSession v82"
description: "UploadSession v82"
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
# UploadSession v82

Information about a image store upload session

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`UploadSessions`](#uploadsessions) | array of [UploadSessionInfo](sfclient-v82-model-uploadsessioninfo.md) | No |

____
### `UploadSessions`
__Type__: array of [UploadSessionInfo](sfclient-v82-model-uploadsessioninfo.md) <br/>
__Required__: No<br/>
<br/>
When querying upload session by upload session ID, the result contains only one upload session. When querying upload session by image store relative path, the result might contain multiple upload sessions.
