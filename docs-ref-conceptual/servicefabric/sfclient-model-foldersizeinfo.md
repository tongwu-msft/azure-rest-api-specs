---
title: "FolderSizeInfo"
ms.date: "11/23/2019"
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
# FolderSizeInfo

Information of a image store folder size

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StoreRelativePath`](#storerelativepath) | string | No |
| [`FolderSize`](#foldersize) | string | No |

____
### `StoreRelativePath`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remote location within image store. This path is relative to the image store root.

____
### `FolderSize`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The size of folder in bytes.
