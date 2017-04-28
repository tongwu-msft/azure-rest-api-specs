---
title: "FileInfo"
ms.date: "2017-04-28"
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
# FileInfo

Information about a image store file.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [FileSize](#filesize) | string (int64) | No |
| [FileVersion](#fileversion) | [FileVersion](sfclient-model-fileversion.md) | No |
| [ModifiedDate](#modifieddate) | string (date-time) | No |
| [StoreRelativePath](#storerelativepath) | string | No |

____
### FileSize
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The size of file in bytes.

____
### FileVersion
__Type__: [FileVersion](sfclient-model-fileversion.md) <br/>
__Required__: No<br/>
<br/>
Information about the version of image store file.

____
### ModifiedDate
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The date and time when the image store file was last modified.

____
### StoreRelativePath
__Type__: string <br/>
__Required__: No<br/>
<br/>
The file path relative to the image store root path.
