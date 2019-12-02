---
title: "ResourceStatus"
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
# ResourceStatus enum

type: string

Status of the resource.

Possible values are: 

  - `Unknown` - Indicates the resource status is unknown. The value is zero.
  - `Ready` - Indicates the resource is ready. The value is 1.
  - `Upgrading` - Indicates the resource is upgrading. The value is 2.
  - `Creating` - Indicates the resource is being created. The value is 3.
  - `Deleting` - Indicates the resource is being deleted. The value is 4.
  - `Failed` - Indicates the resource is not functional due to persistent failures. See statusDetails property for more details. The value is 5.

