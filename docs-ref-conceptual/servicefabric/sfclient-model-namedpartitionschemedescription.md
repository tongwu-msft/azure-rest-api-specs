---
title: "NamedPartitionSchemeDescription"
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
# NamedPartitionSchemeDescription

Describes the named partition scheme of the service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [PartitionScheme](#partitionscheme) | string | Yes |
| [Count](#count) | integer | Yes |
| [Names](#names) | array of string | Yes |

____
### PartitionScheme
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Named' for objects of type 'NamedPartitionSchemeDescription'.

____
### Count
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The number of partitions.

____
### Names
__Type__: array of string <br/>
__Required__: Yes<br/>
<br/>
Array of size specified by the ‘Count’ parameter, for the names of the partitions.
