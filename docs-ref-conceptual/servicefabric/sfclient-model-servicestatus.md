---
title: "ServiceStatus"
ms.date: "2018-07-20"
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
# ServiceStatus enum

type: string

The status of the application.

Possible values are: 

  - `Unknown` - Indicates the service status is unknown. The value is zero.
  - `Active` - Indicates the service status is active. The value is 1.
  - `Upgrading` - Indicates the service is upgrading. The value is 2.
  - `Deleting` - Indicates the service is being deleted. The value is 3.
  - `Creating` - Indicates the service is being created. The value is 4.
  - `Failed` - Indicates creation or deletion was terminated due to persistent failures. Another create/delete request can be accepted. The value is 5.

