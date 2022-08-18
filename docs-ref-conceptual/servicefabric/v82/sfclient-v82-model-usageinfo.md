---
title: "UsageInfo v82"
description: "UsageInfo v82"
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
# UsageInfo v82

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
