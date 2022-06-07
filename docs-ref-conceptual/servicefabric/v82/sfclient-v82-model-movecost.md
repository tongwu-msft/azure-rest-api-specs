---
title: "Service move cos v82"
description: "MoveCost v82t"
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
# Service move cost v82
type: string

Specifies the move cost for the service.

Possible values are: 

  - `Zero` - Zero move cost. This value is zero.
  - `Low` - Specifies the move cost of the service as Low. The value is 1.
  - `Medium` - Specifies the move cost of the service as Medium. The value is 2.
  - `High` - Specifies the move cost of the service as High. The value is 3.
  - `VeryHigh` - Specifies the move cost of the service as VeryHigh. The value is 4.

