---
title: "ImageStoreContent"
ms.date: 06/12/2019
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
# ImageStoreContent

Information about the image store content.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StoreFiles`](#storefiles) | array of [FileInfo](sfclient-v65-model-fileinfo.md) | No |
| [`StoreFolders`](#storefolders) | array of [FolderInfo](sfclient-v65-model-folderinfo.md) | No |

____
### `StoreFiles`
__Type__: array of [FileInfo](sfclient-v65-model-fileinfo.md) <br/>
__Required__: No<br/>
<br/>
The list of image store file info objects represents files found under the given image store relative path.

____
### `StoreFolders`
__Type__: array of [FolderInfo](sfclient-v65-model-folderinfo.md) <br/>
__Required__: No<br/>
<br/>
The list of image store folder info objects represents subfolders found under the given image store relative path.
