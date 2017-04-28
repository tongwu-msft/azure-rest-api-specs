---
title: "ImageStoreCopyDescription"
ms.date: "2017-04-27"
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
# ImageStoreCopyDescription

Information about how to copy image store content from one image store relative path to another image store relative path.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [RemoteSource](#remotesource) | string | Yes |
| [RemoteDestination](#remotedestination) | string | Yes |
| [SkipFiles](#skipfiles) | array of string | No |
| [CheckMarkFile](#checkmarkfile) | boolean | No |

____
### RemoteSource
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The relative path of source image store content to be copied from.

____
### RemoteDestination
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The relative path of destination image store content to be copied to.

____
### SkipFiles
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
The list of the file names to be skipped for copying.

____
### CheckMarkFile
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates whether to check mark file during copying. The property is true if checking mark file is required, false otherwise. The mark file is used to check whether the folder is well constructed. If the property is true and mark file does not exist, the copy is skipped.
