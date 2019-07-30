---
title: "FabricError"
ms.date: "2018-04-23"
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
# FabricError

The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Error`](#error) | [FabricErrorError](sfclient-v62-model-fabricerrorerror.md) | Yes |

____
### `Error`
__Type__: [FabricErrorError](sfclient-v62-model-fabricerrorerror.md) <br/>
__Required__: Yes<br/>
<br/>
Error object containing error code and error message.
