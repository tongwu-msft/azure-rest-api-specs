---
title: "ImageStoreContent"
ms.date: "2017-04-26"
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
# ImageStoreContent

Information about the image store content.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [StoreFiles](#storefiles) | array of [FileInfo](model-FileInfo.md) | No |
| [StoreFolders](#storefolders) | array of [FolderInfo](model-FolderInfo.md) | No |

____
### StoreFiles
__Type__: array of [FileInfo](model-FileInfo.md) <br/>
__Required__: No<br/>
<br/>
The list of image store file info objects represents files found under the given image store relative path.

____
### StoreFolders
__Type__: array of [FolderInfo](model-FolderInfo.md) <br/>
__Required__: No<br/>
<br/>
The list of image store folder info objectes represents subfolders found under the given image store relative path.
