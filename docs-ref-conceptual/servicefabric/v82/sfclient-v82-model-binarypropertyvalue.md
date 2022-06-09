---
title: "BinaryPropertyValue v82"
description: "BinaryPropertyValue v82"
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
# BinaryPropertyValue v82

Describes a Service Fabric property value of type Binary.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Data`](#data) | array of integer | Yes |

____
### `Data`
__Type__: array of integer <br/>
__Required__: Yes<br/>
<br/>
Array of bytes to be sent as an integer array. Each element of array is a number between 0 and 255.
