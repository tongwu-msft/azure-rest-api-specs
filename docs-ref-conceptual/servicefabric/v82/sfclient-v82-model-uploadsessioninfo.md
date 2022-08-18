---
title: "UploadSessionInfo v82"
description: "UploadSessionInfo v82"
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
# UploadSessionInfo v82

Information about an image store upload session. A session is associated with a relative path in the image store.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StoreRelativePath`](#storerelativepath) | string | No |
| [`SessionId`](#sessionid) | string (uuid) | No |
| [`ModifiedDate`](#modifieddate) | string (date-time) | No |
| [`FileSize`](#filesize) | string | No |
| [`ExpectedRanges`](#expectedranges) | array of [UploadChunkRange](sfclient-v82-model-uploadchunkrange.md) | No |

____
### `StoreRelativePath`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remote location within image store. This path is relative to the image store root.

____
### `SessionId`
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
A unique ID of the upload session. A session ID can be reused only if the session was committed or removed.

____
### `ModifiedDate`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The date and time when the upload session was last modified.

____
### `FileSize`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The size in bytes of the uploading file.

____
### `ExpectedRanges`
__Type__: array of [UploadChunkRange](sfclient-v82-model-uploadchunkrange.md) <br/>
__Required__: No<br/>
<br/>
List of chunk ranges that image store has not received yet.
