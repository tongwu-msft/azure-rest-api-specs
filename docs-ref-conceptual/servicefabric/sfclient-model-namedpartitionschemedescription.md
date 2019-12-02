---
title: "NamedPartitionSchemeDescription"
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
# NamedPartitionSchemeDescription

Describes the named partition scheme of the service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Count`](#count) | integer | Yes |
| [`Names`](#names) | array of string | Yes |

____
### `Count`
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The number of partitions.

____
### `Names`
__Type__: array of string <br/>
__Required__: Yes<br/>
<br/>
Array of size specified by the ‘Count’ parameter, for the names of the partitions.
