---
title: "BinaryPropertyValue"
ms.date: "2017-10-02"
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
# BinaryPropertyValue

Describes a Service Fabric property value of type Binary.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [Data](#data) | array of integer | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Binary' for objects of type 'BinaryPropertyValue'.

____
### Data
__Type__: array of integer <br/>
__Required__: Yes<br/>
<br/>
Array of bytes to be sent as an integer array. Each element of array is a number between 0 and 255.
