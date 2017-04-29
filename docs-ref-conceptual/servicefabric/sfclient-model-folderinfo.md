---
title: "FolderInfo"
ms.date: "2017-04-29"
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
# FolderInfo

Information about a image store folder. It inclues how many files this folder contains and its image store relative path.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [StoreRelativePath](#storerelativepath) | string | No |
| [FileCount](#filecount) | string (uuid) | No |

____
### StoreRelativePath
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remote location within image store. This path is relative to the image store root.

____
### FileCount
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
The number of files from within the image store folder.
