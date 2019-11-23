---
title: "UsageInfo"
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
# UsageInfo

Information about how much space and how many files in the file system the ImageStore is using in this category

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`UsedSpace`](#usedspace) | string | No |
| [`FileCount`](#filecount) | string | No |

____
### `UsedSpace`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the size of all files in this category

____
### `FileCount`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the number of all files in this category
